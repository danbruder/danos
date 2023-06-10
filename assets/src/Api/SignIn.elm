module Api.SignIn exposing (Data, post)

import Effect exposing (Effect)
import Http
import Json.Decode
import Json.Encode


{-| The data we expect if the sign in attempt was successful.
-}
type alias Data =
    { token : String
    }


{-| How to create a `Data` value from JSON
-}
decoder : Json.Decode.Decoder Data
decoder =
    Json.Decode.map Data
        (Json.Decode.field "token" Json.Decode.string)


{-| Sends a POST request to our `/api/sign-in` endpoint, which
returns our JWT token if a user was found with that email
and password.
-}
post :
    { onResponse : Result Http.Error Data -> msg
    , email : String
    , password : String
    }
    -> Effect msg
post options =
    let
        body : Json.Encode.Value
        body =
            Json.Encode.object
                [ ( "email", Json.Encode.string options.email )
                , ( "password", Json.Encode.string options.password )
                ]

        cmd : Cmd msg
        cmd =
            Http.post
                { url = "http://localhost:5000/api/sign-in"
                , body = Http.jsonBody body
                , expect = Http.expectJson options.onResponse decoder
                }
    in
    Effect.sendCmd cmd
