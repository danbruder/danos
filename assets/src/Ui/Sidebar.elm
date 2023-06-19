module Ui.Sidebar exposing (Link, LinkGroup, view)

import Css
import Css.Global
import Effect exposing (Effect)
import Html as NativeHtml
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events
import Shared
import Tailwind.Breakpoints as Bp
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw exposing (..)


type alias Settings msg =
    { title : String
    , linkGroups : List LinkGroup
    , widthClass : Css.Style
    , content : List (Html msg)
    , footer : List (Html msg)
    }



-- VIEW


view : Settings msg -> Html msg
view { title, linkGroups, widthClass, content, footer } =
    Html.div [ css [ Tw.h_screen, Tw.min_h_screen ] ]
        [ Html.div [ css [ flex ] ]
            [ Html.div
                [ css
                    [ h_screen
                    , min_h_screen
                    , bg_color Tw.gray_50
                    , widthClass
                    ]
                ]
                [ viewSidebar title linkGroups footer ]
            , Html.div
                [ css
                    [ h_screen
                    , min_h_screen
                    , overflow_y_scroll
                    , w_full
                    ]
                ]
                [ div [] content
                ]
            ]
        ]


viewSidebar : String -> List LinkGroup -> List (Html msg) -> Html msg
viewSidebar title linkGroups footer =
    Html.aside
        [ css
            [ Tw.overflow_y_scroll
            , Tw.h_screen
            , Tw.border_r
            , Tw.border_color Tw.gray_200
            , Tw.flex
            , Tw.flex_col
            ]
        ]
        [ div
            [ css [ Tw.flex_1, Tw.p_3, Tw.space_y_1 ] ]
            [ h1 [ css [ Tw.font_bold, Tw.text_sm, Tw.px_2 ] ]
                [ text title
                ]
            , div [] <| List.map viewLinkGroup linkGroups
            ]
        , div [ css [ Tw.p_6, Tw.space_y_1, Tw.text_sm, Tw.font_semibold ] ] footer
        ]


type alias LinkGroup =
    { title : String, links : List Link }


type alias Link =
    { text : String, href : String, icon : String }


viewLinkGroup : LinkGroup -> Html msg
viewLinkGroup group =
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
            [ text group.title ]
        , group.links
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
