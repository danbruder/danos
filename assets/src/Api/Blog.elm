module Api.Blog exposing
    ( Entries
    , Entry
    , cache
    , cacheKey
    , encode
    , entryDecoder
    , fromCache
    , index
    )

import Dict exposing (Dict)
import Effect exposing (Effect)
import Http
import Json.Decode
import Json.Encode


cacheKey : String
cacheKey =
    "blogEntires"


type alias Entries =
    List Entry


type alias Entry =
    { slug : String
    , date : String
    , title : String
    , category : String
    , body : String
    }


entryDecoder : Json.Decode.Decoder Entry
entryDecoder =
    Json.Decode.map5 Entry
        (Json.Decode.field "slug" Json.Decode.string)
        (Json.Decode.field "date" Json.Decode.string)
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "category" Json.Decode.string)
        (Json.Decode.field "body" Json.Decode.string)


entriesDecoder : Json.Decode.Decoder Entries
entriesDecoder =
    Json.Decode.field "entries" (Json.Decode.list entryDecoder)


encode : Entry -> Json.Encode.Value
encode entry =
    Json.Encode.object
        [ ( "slug", Json.Encode.string entry.slug )
        , ( "title", Json.Encode.string entry.title )
        , ( "date", Json.Encode.string entry.date )
        , ( "category", Json.Encode.string entry.category )
        , ( "body", Json.Encode.string entry.body )
        ]


index :
    { onResponse : Result Http.Error Entries -> msg
    }
    -> Effect msg
index options =
    let
        url : String
        url =
            "http://localhost:5000/api/blog"

        cmd : Cmd msg
        cmd =
            Http.get
                { url = url
                , expect = Http.expectJson options.onResponse entriesDecoder
                }
    in
    Effect.sendCmd cmd


cache : List Entry -> Effect msg
cache entries =
    Effect.saveToLocalStorage cacheKey (Json.Encode.list encode entries)


fromCache : Dict String Json.Encode.Value -> List Entry
fromCache c =
    []
