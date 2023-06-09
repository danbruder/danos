module Ui exposing (layout)

import Css.Global
import Html as NativeHtml
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Tailwind.Breakpoints as Bp
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw exposing (..)


layout :
    { sidebar : List (Html.Html msg)
    , content : List (Html.Html msg)
    }
    -> NativeHtml.Html msg
layout { sidebar, content } =
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
                    sidebar
                , Html.div
                    [ css
                        [ h_screen
                        , min_h_screen
                        , overflow_y_scroll
                        , w_full
                        ]
                    ]
                    content
                ]
            ]
