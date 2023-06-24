module Shared.Msg exposing (Msg(..))

import Json.Encode


type Msg
    = SignIn
        { token : String
        , id : String
        , name : String
        , profileImageUrl : String
        , email : String
        }
    | SignOut
    | PutInCache String Json.Encode.Value
