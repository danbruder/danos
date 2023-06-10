use axum::{
    http,
    http::{HeaderValue, Method, StatusCode},
    routing::post,
    Json, Router,
};
use serde::Deserialize;
use tokio::{time, time::Duration};
use tower_http::cors::CorsLayer;

const SECRET_TOKEN_EXAMPLE: &'static str = "dan's secret token of doom";

#[tokio::main]
async fn main() {
    let app = Router::new().route("/api/sign-in", post(sign_in)).layer(
        CorsLayer::new()
            .allow_origin("http://localhost:3000".parse::<HeaderValue>().unwrap())
            .allow_headers([http::header::CONTENT_TYPE])
            .allow_methods([Method::POST, Method::GET, Method::OPTIONS]),
    );

    axum::Server::bind(&"0.0.0.0:5000".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn sign_in(Json(payload): Json<SignIn>) -> Json<String> {
    time::sleep(Duration::from_millis(500)).await;

    Json(SECRET_TOKEN_EXAMPLE.into())
}

async fn me(token: String) -> Result<Json<User>, StatusCode> {
    if &token == SECRET_TOKEN_EXAMPLE {
        time::sleep(Duration::from_secs(1)).await;
        Ok(Json(User {
            id: "Dan".into(),
            name: "Dan".into(),
            profile_image_url: "https://avatars.githubusercontent.com/u/6187256?v=4".into(),
            email: "ryan@elm.land".into(),
        }))
    } else {
        Err(StatusCode::UNAUTHORIZED)
    }
}

#[derive(Deserialize)]
struct SignIn {
    username: String,
    password: String,
}

#[derive(Serialize)]
struct User {
    id: String,
    name: String,
    profile_image_url: String,
    email: String,
}
