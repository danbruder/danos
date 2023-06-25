module Pages.Blog exposing (Model, Msg, page)

import Api.Blog exposing (Entries, Entry)
import Auth
import Css
import Effect exposing (Effect)
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (css, href, style)
import Html.Styled.Events as Events
import Http
import Json.Encode
import Layouts
import Page exposing (Page)
import Route exposing (Route)
import Shared
import Tailwind.Breakpoints as Breakpoints
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw
import Ui.Sidebar
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
        |> Page.withLayout (layout shared.user)


layout : Maybe Auth.User -> Model -> Layouts.Layout
layout user model =
    Layouts.Sidebar
        { sidebar =
            { title = "Bookmarks"
            , user = user
            }
        }



-- INIT


type alias Model =
    { entries : Entries }


init : () -> ( Model, Effect Msg )
init () =
    ( { entries = [] }
    , Api.Blog.index
        { onResponse = GotBlogIndex
        }
    )



-- UPDATE


type Msg
    = GotBlogIndex (Result Http.Error Api.Blog.Entries)


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        GotBlogIndex (Ok entries) ->
            ( { model | entries = entries }
            , Effect.none
            )

        GotBlogIndex (Err _) ->
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
    { title = "Pages.Writing"
    , body =
        [ Html.toUnstyled <|
            Ui.Sidebar.view
                { widthClass = Tw.w_96
                , title = "Writing"
                , items =
                    [ Ui.Sidebar.LinkGroup "" <| List.map entryToSidebarLink model.entries
                    ]
                , viewItem = \i -> div [] []
                , content =
                    [ viewMainContent model
                    ]
                , footer = []
                }
        ]
    }


entryToSidebarLink : Entry -> Ui.Sidebar.Link
entryToSidebarLink entry =
    { text = entry.title, href = "/blog/" ++ entry.slug, icon = "" }


viewMainContent : Model -> Html Msg
viewMainContent model =
    div [] []
