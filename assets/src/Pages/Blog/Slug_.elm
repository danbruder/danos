module Pages.Blog.Slug_ exposing (Model, Msg, page)

import Api.Blog exposing (Entries, Entry)
import Auth
import Css
import Effect exposing (Effect)
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (css, href, style)
import Html.Styled.Events as Events
import Http
import Layouts
import List.Extra
import Page exposing (Page)
import Route exposing (Route)
import Shared
import Tailwind.Breakpoints as Breakpoints
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw
import View exposing (View)


page : Auth.User -> Shared.Model -> Route { slug : String } -> Page Model Msg
page user shared route =
    Page.new
        { init = init route
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
        |> Page.withLayout (layout user)


layout : Auth.User -> Model -> Layouts.Layout
layout user model =
    Layouts.Sidebar
        { sidebar =
            { title = "TODO"
            , user = user
            }
        }



-- INIT


type alias Model =
    { entries : Entries
    , selected : Maybe Entry
    , slug : String
    }


init : Route { slug : String } -> () -> ( Model, Effect Msg )
init route _ =
    ( { entries = []
      , selected = Nothing
      , slug = route.params.slug
      }
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
            let
                selected =
                    entries
                        |> List.Extra.find (\entry -> entry.slug == model.slug)
            in
            ( { model | entries = entries, selected = selected }
            , Api.Blog.cache entries
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
            div
                [ css
                    [ Tw.flex
                    ]
                ]
                [ div
                    [ css
                        [ Tw.bg_color Tw.gray_50
                        , Tw.min_h_screen
                        , Tw.overflow_y_scroll
                        , Tw.w_96
                        , Tw.p_3
                        , Tw.space_y_1
                        ]
                    ]
                    (model.entries
                        |> List.map viewEntry
                    )
                , div
                    [ css
                        [ Tw.p_3
                        ]
                    ]
                    [ viewEntryContent model.selected ]
                ]
        ]
    }


viewEntryContent : Maybe Entry -> Html Msg
viewEntryContent maybeEntry =
    case maybeEntry of
        Just entry ->
            div []
                [ div [] [ text entry.title ]
                , div [] [ text entry.body ]
                ]

        Nothing ->
            div [] []


viewEntry : Entry -> Html Msg
viewEntry entry =
    Html.div []
        [ Html.a
            [ href ("/blog/" ++ entry.slug)
            , css
                [ Tw.flex
                , Tw.space_x_3
                , Tw.border_b
                , Tw.border_color Tw.gray_100
                , Tw.py_3_dot_5
                , Tw.px_3
                , Tw.text_sm
                , Tw.rounded_lg
                , Breakpoints.lg
                    [ Tw.border_none
                    , Tw.py_2
                    ]
                , Css.hover
                    [ Tw.bg_color Tw.gray_200
                    ]
                ]
            ]
            [ Html.text entry.title
            ]
        ]
