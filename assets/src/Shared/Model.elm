module Shared.Model exposing (Model, User)

import Dict exposing (Dict)
import Json.Encode


type alias Model =
    { user : Maybe User
    , cache : Dict String Json.Encode.Value
    }


type alias User =
    { token : String
    , id : String
    , name : String
    , profileImageUrl : String
    , email : String
    }
