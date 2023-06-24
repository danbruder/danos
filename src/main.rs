use axum::{
    extract::Query,
    http,
    http::{HeaderValue, Method, StatusCode},
    routing::{get, post},
    Json, Router,
};
use glob::glob;
use serde::{Deserialize, Serialize};
use tokio::{time, time::Duration};
use tower_http::cors::CorsLayer;
use yaml_front_matter::YamlFrontMatter;

const SECRET_TOKEN_EXAMPLE: &'static str = "123";

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/api/sign-in", post(sign_in))
        .route("/api/me", get(me))
        .route("/api/blog", get(blog_index))
        .layer(
            CorsLayer::new()
                .allow_origin("http://localhost:1234".parse::<HeaderValue>().unwrap())
                .allow_headers([http::header::CONTENT_TYPE])
                .allow_methods([Method::POST, Method::GET, Method::OPTIONS]),
        );

    axum::Server::bind(&"0.0.0.0:5000".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn sign_in(
    Json(payload): Json<SignIn>,
) -> Result<Json<SignInResponse>, (StatusCode, Json<SignInErrors>)> {
    time::sleep(Duration::from_millis(500)).await;

    let mut errors = vec![];

    if payload.email.is_empty() {
        errors.push(SignInError {
            field: "email".into(),
            message: "Email cannot be empty".into(),
        });
    }

    if payload.password.is_empty() {
        errors.push(SignInError {
            field: "password".into(),
            message: "Password cannot be empty".into(),
        });
    }

    if &payload.email == "dan@dan.com" && &payload.password == "yeet" {
        Ok(Json(SignInResponse {
            token: SECRET_TOKEN_EXAMPLE.into(),
        }))
    } else {
        errors.push(SignInError {
            message: "Invalid email or password".into(),
            field: "password".into(),
        });

        Err((StatusCode::UNAUTHORIZED, Json(SignInErrors { errors })))
    }
}

async fn me(Query(MeQuery { token }): Query<MeQuery>) -> Result<Json<User>, StatusCode> {
    if &token == SECRET_TOKEN_EXAMPLE {
        time::sleep(Duration::from_secs(1)).await;
        Ok(Json(User {
            id: "1".into(),
            name: "Dan".into(),
            profile_image_url: "https://avatars.githubusercontent.com/u/6187256?v=4".into(),
            email: "dan@elm.land".into(),
        }))
    } else {
        Err(StatusCode::UNAUTHORIZED)
    }
}

#[derive(Deserialize)]
struct MeQuery {
    token: String,
}

#[derive(Deserialize)]
struct SignIn {
    email: String,
    password: String,
}

#[derive(Serialize)]
struct SignInResponse {
    token: String,
}

#[derive(Serialize)]
struct SignInErrors {
    errors: Vec<SignInError>,
}

#[derive(Serialize)]
struct SignInError {
    message: String,
    field: String,
}

#[derive(Serialize)]
struct User {
    id: String,
    name: String,
    profile_image_url: String,
    email: String,
}

// Blog stuff

async fn blog_index() -> Json<BlogEntries> {
    let entries = get_entries();
    Json(BlogEntries { entries })
}

#[derive(Serialize)]
struct BlogEntries {
    entries: Vec<BlogEntry>,
}

#[derive(Serialize)]
struct BlogEntry {
    slug: String,
    date: String,
    body: String,
    title: String,
    category: String,
    tags: Vec<String>,
}

#[derive(Deserialize)]
struct BlogMetadata {
    date: Option<String>,
    draft: Option<bool>,
    title: String,
    slug: String,
    taxonomies: BlogTaxonomies,
}

#[derive(Deserialize)]
struct BlogTaxonomies {
    category: Vec<String>,
    tags: Vec<String>,
}

fn get_entries() -> Vec<BlogEntry> {
    let mut entries = vec![];
    let paths = glob("old-blog/blog/**/*.md").expect("Failed to read glob pattern");

    for path in paths {
        let path = path.unwrap();
        let contents = std::fs::read_to_string(path.clone()).unwrap();
        if let Ok(yaml) = YamlFrontMatter::parse::<BlogMetadata>(&contents) {
            let BlogMetadata {
                slug,
                draft,
                date,
                title,
                taxonomies: BlogTaxonomies { category, tags },
            } = yaml.metadata;

            if !draft.unwrap_or_default() {
                entries.push(BlogEntry {
                    slug,
                    date: date.unwrap_or_default(),
                    body: yaml.content,
                    title,
                    category: category.join(", "),
                    tags,
                });
            }
        } else {
            println!("FAILED: {}", path.display());
        }
    }

    entries.sort_by_key(|e| e.date.clone());
    entries.reverse();

    entries
}
