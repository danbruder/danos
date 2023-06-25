module Pages.Blog.Slug_ exposing (Model, Msg, page)

import Api.Blog exposing (Entries, Entry)
import Auth
import Css
import Dict exposing (Dict)
import Effect exposing (Effect)
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (class, classList, css, href, style)
import Html.Styled.Events as Events
import Http
import Json.Encode
import Layouts
import List.Extra
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer
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
        { init = init route shared.cache
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


init : Route { slug : String } -> Dict String Json.Encode.Value -> () -> ( Model, Effect Msg )
init route cache _ =
    let
        existing =
            Api.Blog.fromCache cache

        selected =
            existing
                |> List.Extra.find (\entry -> entry.slug == route.params.slug)

        effect =
            if List.length existing == 0 then
                Api.Blog.index
                    { onResponse = GotBlogIndex
                    }

            else
                Effect.none
    in
    ( { entries = existing
      , selected = selected
      , slug = route.params.slug
      }
    , effect
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
            , Api.Blog.cache entries |> Debug.log "sending cache"
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
                , viewItem = viewLinks model.selected
                , items = [ List.map entryToLink model.entries ]
                , content =
                    [ viewMainContent model
                    ]
                , footer = []
                }
        ]
    }


entryToLink : Entry -> Link
entryToLink entry =
    { text = entry.title, href = "/blog/" ++ entry.slug, date = entry.date }


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
            (viewMarkdownBody entry.body)
        ]


viewMarkdownBody : String -> List (Html msg)
viewMarkdownBody body =
    case
        body
            |> Markdown.Parser.parse
    of
        Ok okAst ->
            case Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer okAst of
                Ok rendered ->
                    rendered |> List.map Html.fromUnstyled

                Err _ ->
                    [ text "~ could not parse markdown ~" ]

        Err error ->
            [ (error |> List.map Markdown.Parser.deadEndToString |> String.join "\n")
                |> text
            ]


viewEmptyDetail : Html Msg
viewEmptyDetail =
    div [] []


type alias Link =
    { text : String, href : String, date : String }


viewLinks : Maybe Entry -> List Link -> Html msg
viewLinks selected links =
    let
        selectedHref =
            selected |> Maybe.map (entryToLink >> .href)

        isSelected link =
            Just link.href == selectedHref
    in
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
            []
        , links
            |> List.map
                (\link ->
                    viewLink (isSelected link) link
                )
            |> div [ css [ Tw.space_y_1 ] ]
        ]


viewLink : Bool -> Link -> Html msg
viewLink isSelected l =
    let
        baseClasses =
            [ Tw.block
            , Tw.text_sm
            , Tw.px_2
            , Tw.py_1_dot_5
            , Tw.font_medium
            , Tw.text_color Tw.gray_700
            , Css.hover
                [ Tw.text_color Tw.gray_700
                , Tw.bg_color Tw.gray_200
                ]
            , Tw.rounded_md
            ]

        selectedClasses =
            [ Tw.bg_color Tw.gray_800
            , Tw.text_color Tw.gray_50
            , Css.hover
                [ Tw.bg_color Tw.gray_900
                , Tw.text_color Tw.gray_200
                ]
            ]

        styles =
            if isSelected then
                baseClasses ++ selectedClasses

            else
                baseClasses
    in
    a
        [ css styles
        , href l.href
        ]
        [ div []
            [ text l.text
            ]
        , div [ css [ text_xs, Tw.text_color Tw.gray_500 ] ]
            [ text l.date
            ]
        ]
