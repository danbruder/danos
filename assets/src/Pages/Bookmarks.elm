module Pages.Bookmarks exposing (Model, Msg, page)

import Css
import Effect exposing (Effect)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attr exposing (css, href)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import Tailwind.Breakpoints as Breakpoints
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw
import Ui
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


type alias Model =
    {}


init : () -> ( Model, Effect Msg )
init () =
    ( {}
    , Effect.none
    )



-- UPDATE


type Msg
    = ExampleMsgReplaceMe


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        ExampleMsgReplaceMe ->
            ( model
            , Effect.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Pages.Bookmarks"
    , body =
        [ Ui.layout
            { sidebar =
                [ Ui.sidebar
                ]
            , body =
                [ div [ css [ Tw.w_full, Tw.px_3, Tw.py_2 ] ]
                    [ text "Bookmarks"
                    ]
                ]
            }
        ]
    }
