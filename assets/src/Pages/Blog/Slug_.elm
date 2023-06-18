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
import Tailwind.Theme as Tw exposing (..)
import Tailwind.Utilities as Tw exposing (..)
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
            Html.div [ css [ flex ] ]
                [ Html.div
                    [ css
                        [ h_screen
                        , min_h_screen
                        , bg_color Tw.gray_50
                        , w_full
                        , max_w_xs
                        ]
                    ]
                    [ viewSidebar model
                    ]
                , Html.div
                    [ css
                        [ h_screen
                        , min_h_screen
                        , overflow_y_scroll
                        , w_full
                        ]
                    ]
                    [ viewMainContent model
                    ]
                ]
        ]
    }


viewSidebarTitle =
    div [ css [ Tw.font_bold, Tw.text_sm, Tw.px_2 ] ] [ text "Writing" ]


viewSidebar : Model -> Html Msg
viewSidebar model =
    Html.aside
        [ css
            [ Tw.overflow_y_scroll
            , Tw.h_screen
            , Tw.border_r
            , Tw.border_color Tw.gray_200
            ]
        ]
        [ viewSidebarLinks model
        ]


viewSidebarLinks : Model -> Html Msg
viewSidebarLinks model =
    div [ css [ Tw.flex_1, Tw.p_3, Tw.space_y_1 ] ]
        [ h1 [ css [ Tw.font_bold, Tw.text_sm, Tw.px_2 ] ]
            [ text "Writing"
            ]
        , viewLinkGroup ""
            (model.entries |> List.map entryToSidebarLink)
        ]


entryToSidebarLink : Entry -> Link
entryToSidebarLink entry =
    { text = entry.title, href = "/blog/" ++ entry.slug, icon = "" }


viewMainContent : Model -> Html Msg
viewMainContent model =
    case model.selected of
        Just entry ->
            div []
                [ div [] [ text entry.title ]
                , div [] [ text entry.body ]
                ]

        Nothing ->
            div [] []


type alias Link =
    { text : String, href : String, icon : String }


viewLinkGroup : String -> List Link -> Html msg
viewLinkGroup title links =
    div []
        [ div
            [ css
                [ Tw.text_color Tw.gray_400
                , Tw.text_xs
                , Tw.px_2
                , Tw.pt_5
                , Tw.pb_2
                , Tw.font_semibold
                ]
            ]
            [ text title ]
        , links
            |> List.map viewLink
            |> div [ css [ Tw.space_y_1 ] ]
        ]


viewLink : Link -> Html msg
viewLink l =
    a
        [ css
            [ Tw.block
            , Tw.text_sm
            , Tw.px_2
            , Tw.py_1_dot_5
            , Tw.space_x_3
            , Tw.font_medium
            , Tw.text_color Tw.gray_700
            , Css.hover
                [ Tw.text_color Tw.gray_900
                , Tw.bg_color Tw.gray_200
                ]
            , Tw.rounded_md
            ]
        , href l.href
        ]
        [ text l.text ]
