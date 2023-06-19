module Pages.Blog.Slug_ exposing (Model, Msg, page)

import Api.Blog exposing (Entries, Entry)
import Auth
import Css
import Effect exposing (Effect)
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (class, css, href, style)
import Html.Styled.Events as Events
import Http
import Layouts
import List.Extra
import Page exposing (Page)
import Route exposing (Route)
import Shared
import Tailwind.Breakpoints as Breakpoints
import Tailwind.Theme as Tw exposing (..)
import Tailwind.Utilities as Tw exposing (..)
import Ui.Sidebar
import View exposing (View)


page : Shared.Model -> Route { slug : String } -> Page Model Msg
page shared route =
    Page.new
        { init = init route
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
        |> Page.withLayout (layout shared.user)


layout : Maybe Auth.User -> Model -> Layouts.Layout
layout user model =
    Layouts.Sidebar
        { sidebar =
            { title = "Writing"
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
    { title = "Writing"
    , body =
        [ Html.toUnstyled <|
            Ui.Sidebar.view
                { widthClass = Tw.w_96
                , title = "Writing"
                , linkGroups =
                    [ Ui.Sidebar.LinkGroup "" <| List.map entryToSidebarLink model.entries
                    ]
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
    model.selected |> Maybe.map viewEntryDetail |> Maybe.withDefault viewEmptyDetail


viewEntryDetail : Entry -> Html Msg
viewEntryDetail entry =
    div
        [ css
            [ Tw.max_w_3xl
            , Tw.m_auto
            , Tw.py_12
            , Tw.px_4
            , Tw.pb_10
            , Breakpoints.md
                [ Tw.px_8
                ]
            ]
        ]
        [ div [ css [ Tw.space_y_3 ] ]
            [ h1
                [ css
                    [ Tw.text_2xl
                    , Tw.font_bold
                    , Breakpoints.xl [ Tw.text_3xl ]
                    ]
                ]
                [ text entry.title ]
            , span
                [ css
                    [ Tw.inline_block
                    , Tw.leading_snug
                    , Tw.text_color Tw.gray_600
                    ]
                ]
                [ text entry.date ]
            ]
        , div
            [ css
                [ Tw.mt_8
                , Tw.prose
                ]
            ]
            [ text entry.body ]
        ]


viewEmptyDetail : Html Msg
viewEmptyDetail =
    div [] []
