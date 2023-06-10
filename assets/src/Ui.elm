module Ui exposing (layout, sidebar)

import Css
import Css.Global
import Html as NativeHtml
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Tailwind.Breakpoints as Bp
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw exposing (..)


layout :
    { sidebar : List (Html.Html msg)
    , body : List (Html.Html msg)
    }
    -> NativeHtml.Html msg
layout content =
    Html.toUnstyled <|
        Html.div [ css [ Tw.h_screen, Tw.min_h_screen ] ]
            [ Css.Global.global Tw.globalStyles
            , Html.div
                [ css
                    [ flex
                    ]
                ]
                [ Html.div
                    [ css
                        [ h_screen
                        , min_h_screen
                        , bg_color Tw.gray_50
                        , w_80
                        ]
                    ]
                    content.sidebar
                , Html.div
                    [ css
                        [ h_screen
                        , min_h_screen
                        , overflow_y_scroll
                        , w_full
                        ]
                    ]
                    content.body
                ]
            ]


sidebar =
    div [ css [ Tw.flex_1, Tw.p_3, Tw.space_y_1 ] ]
        [ h1 [ css [ Tw.font_bold, Tw.text_sm, Tw.px_2 ] ]
            [ text "Dan Bruder"
            ]
        , viewLinkGroup ""
            [ Link "Home" "/" ""
            , Link "Writing" "/writing" ""
            ]
        , viewLinkGroup "Me"
            [ Link "Bookmarks" "/bookmarks" ""
            , Link "AMA" "/ama" ""
            , Link "Stack" "/stack" ""
            ]
        , viewLinkGroup "Projects"
            [ Link "TWHN" "/twhn" ""
            , Link "Lifting" "/lifting" ""
            ]
        , viewLinkGroup "Online"
            [ Link "Twitter" "https://twitter.com/danbruder" ""
            , Link "Github" "https://github.com/danbruder" ""
            ]
        ]


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
