use axum::{
    http,
    http::{HeaderValue, Method, StatusCode},
    routing::{get, post},
    Json, Router,
};
use serde::{Deserialize, Serialize};
use tokio::{time, time::Duration};
use tower_http::cors::CorsLayer;

const SECRET_TOKEN_EXAMPLE: &'static str = "dan's secret token of doom";

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/api/sign-in", post(sign_in))
        .route("/api/me", get(me))
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

async fn sign_in(Json(payload): Json<SignIn>) -> Result<Json<SignInResponse>, StatusCode> {
    time::sleep(Duration::from_millis(500)).await;

    if &payload.email == "dan@dan.com" && &payload.password == "yeet" {
        Ok(Json(SignInResponse {
            token: SECRET_TOKEN_EXAMPLE.into(),
        }))
    } else {
        Err(StatusCode::UNAUTHORIZED)
    }
}

async fn me(token: String) -> Result<Json<User>, StatusCode> {
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
struct SignIn {
    email: String,
    password: String,
}

#[derive(Serialize)]
struct SignInResponse {
    token: String,
}

#[derive(Serialize)]
struct User {
    id: String,
    name: String,
    profile_image_url: String,
    email: String,
}
