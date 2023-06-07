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
layout body =
    Html.toUnstyled <|
        Html.div [ css [ Tw.h_screen ] ]
            [ Css.Global.global Tw.globalStyles
            , Html.div
                [ css []
                ]
                [ stuff
                ]
            ]


stuff =
    div
        [ css
            [ Tw.relative
            , Tw.flex
            , Tw.h_full
            , Tw.min_h_screen
            , Tw.w_full
            ]
        ]
        [ nav
            [ css
                [ Tw.absolute
                , Tw.neg_translate_x_full
                , Tw.z_30
                , Tw.flex
                , Tw.h_full
                , Tw.max_h_screen
                , Tw.min_h_screen
                , Tw.w_3over4
                , Tw.flex_none
                , Tw.transform
                , Tw.flex_col
                , Tw.overflow_y_auto
                , Tw.border_r
                , Tw.border_gray_150
                , Tw.bg_white
                , Tw.pb_10
                , Tw.transition
                , Tw.duration_200
                , Tw.ease_in_out
                , Bp.xxl [ Tw.w_72 ]
                , Bp.dark
                    [ Tw.border_gray_800
                    , Tw.bg_gray_900
                    ]
                , Bp.lg
                    [ Tw.relative
                    , Tw.z_auto
                    , Tw.w_56
                    , Tw.translate_x_0
                    , Tw.bg_gray_50
                    , Bp.lg
                        [ Tw.bg_gray_900
                        ]
                    ]
                , Bp.md
                    [ Tw.w_1over3
                    ]
                , Bp.sm
                    [ Tw.w_1over2
                    , Tw.pb_0
                    ]
                ]
            ]
            [ div
                [ Attr.style "background" "rgba(255,255,255,0)"
                , Attr.style "box-shadow" "0 1px 3px rgba(0,0,0,0)"
                , Attr.style "min-height" "48px"
                , css
                    [ Tw.filter_blur
                    , Tw.sticky
                    , Tw.top_0
                    , Tw.z_10
                    , Tw.flex
                    , Tw.flex_col
                    , Tw.justify_center
                    , Tw.px_3
                    , Tw.py_2
                    , Bp.dark
                        [ Tw.border_b
                        , Tw.border_gray_900
                        ]
                    ]
                ]
                [ div
                    [ css
                        [ Tw.flex
                        , Tw.items_center
                        , Tw.justify_between
                        , Tw.flex_none
                        ]
                    ]
                    [ span
                        [ css
                            [ Tw.flex
                            , Tw.items_center
                            , Tw.space_x_3
                            ]
                        ]
                        [ span
                            [ css
                                [ Tw.flex
                                , Tw.items_center
                                , Tw.justify_center
                                , Tw.p_2
                                , Tw.rounded_md
                                , Tw.cursor_pointer
                                , Bp.dark
                                    [ Css.hover
                                        [ Tw.bg_gray_800
                                        ]
                                    ]
                                , Css.hover
                                    [ Tw.bg_gray_200
                                    ]
                                , Bp.lg
                                    [ Tw.hidden
                                    ]
                                ]
                            ]
                            [ svg
                                [ SvgAttr.width "16"
                                , SvgAttr.height "16"
                                , SvgAttr.viewBox "0 0 24 24"
                                , SvgAttr.fill "none"
                                , SvgAttr.stroke "currentColor"
                                , SvgAttr.strokeWidth "2"
                                , SvgAttr.strokeLinecap "round"
                                , SvgAttr.strokeLinejoin "round"
                                , SvgAttr.css
                                    [ Tw.text_primary
                                    ]
                                ]
                                [ Svg.line
                                    [ SvgAttr.x1 "3"
                                    , SvgAttr.y1 "12"
                                    , SvgAttr.x2 "21"
                                    , SvgAttr.y2 "12"
                                    ]
                                    []
                                , Svg.line
                                    [ SvgAttr.x1 "3"
                                    , SvgAttr.y1 "6"
                                    , SvgAttr.x2 "21"
                                    , SvgAttr.y2 "6"
                                    ]
                                    []
                                , Svg.line
                                    [ SvgAttr.x1 "3"
                                    , SvgAttr.y1 "18"
                                    , SvgAttr.x2 "21"
                                    , SvgAttr.y2 "18"
                                    ]
                                    []
                                ]
                            ]
                        , h2
                            [ css
                                [ Tw.text_sm
                                , Tw.font_bold
                                , Tw.text_primary
                                , Tw.transform_gpu
                                , Tw.line_clamp_1
                                ]
                            ]
                            [ text "Brian Lovin" ]
                        ]
                    ]
                , div []
                    []
                ]
            , div
                [ css
                    [ Tw.flex_1
                    , Tw.px_3
                    , Tw.py_3
                    , Tw.space_y_1
                    ]
                ]
                [ ul
                    [ css
                        [ Tw.space_y_1
                        ]
                    ]
                    [ li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.bg_black
                                , Tw.text_white
                                , Bp.dark
                                    [ Tw.bg_gray_700
                                    , Tw.text_white
                                    , Css.hover
                                        [ Tw.bg_gray_700
                                        , Tw.text_white
                                        ]
                                    ]
                                , Css.hover
                                    [ Tw.bg_black
                                    , Tw.text_white
                                    ]
                                ]
                            , Attr.href "/"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Home" ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "/writing"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M2 5a2 2 0 012-2h8a2 2 0 012 2v10a2 2 0 002 2H4a2 2 0 01-2-2V5zm3 1h6v4H5V6zm6 6H5v2h6v-2z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M15 7h1a2 2 0 012 2v5.5a1.5 1.5 0 01-3 0V7z"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Writing" ]
                            ]
                        ]
                    ]
                , ul
                    [ css
                        [ Tw.space_y_1
                        ]
                    ]
                    [ h4
                        [ css
                            [ Tw.px_2
                            , Tw.pt_5
                            , Tw.pb_2
                            , Tw.text_xs
                            , Tw.font_semibold
                            , Tw.text_gray_1000
                            , Tw.text_opacity_40
                            , Bp.dark
                                [ Tw.text_white
                                ]
                            ]
                        ]
                        [ text "Me" ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "/bookmarks"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M5 4a2 2 0 012-2h6a2 2 0 012 2v14l-5-2.5L5 18V4z"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Bookmarks" ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "/ama"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "AMA" ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "/stack"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M7 3a1 1 0 000 2h6a1 1 0 100-2H7zM4 7a1 1 0 011-1h10a1 1 0 110 2H5a1 1 0 01-1-1zM2 11a2 2 0 012-2h12a2 2 0 012 2v4a2 2 0 01-2 2H4a2 2 0 01-2-2v-4z"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Stack" ]
                            ]
                        ]
                    ]
                , ul
                    [ css
                        [ Tw.space_y_1
                        ]
                    ]
                    [ h4
                        [ css
                            [ Tw.px_2
                            , Tw.pt_5
                            , Tw.pb_2
                            , Tw.text_xs
                            , Tw.font_semibold
                            , Tw.text_gray_1000
                            , Tw.text_opacity_40
                            , Bp.dark
                                [ Tw.text_white
                                ]
                            ]
                        ]
                        [ text "Projects" ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ Attr.target "_blank"
                            , Attr.rel "noopener noreferrer"
                            , css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "https://campsite.design"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "20"
                                    , SvgAttr.height "20"
                                    , SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.clipRule "evenodd"
                                        , SvgAttr.d "M2.14405 12.9446L6.0195 6.4855C6.20022 6.1843 6.52573 6 6.87699 6H13.0037C13.781 6 14.2611 6.84797 13.8612 7.5145L9.98574 13.9736C9.80502 14.2748 9.47951 14.4591 9.12824 14.4591H3.00155C2.22425 14.4591 1.74414 13.6111 2.14405 12.9446ZM12.72 14.4591H16.9129C17.6671 14.4591 18.1498 13.656 17.796 12.99L15.816 9.26301C15.4501 8.57411 14.4713 8.55087 14.0731 9.22163L11.8602 12.9486C11.4644 13.6152 11.9448 14.4591 12.72 14.4591Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Campsite" ]
                            , span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    , Tw.text_black
                                    , Tw.text_opacity_40
                                    , Bp.dark
                                        [ Tw.text_white
                                        ]
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "10"
                                    , SvgAttr.height "9"
                                    , SvgAttr.viewBox "0 0 10 9"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M9.00195 6.32617V0.824219C9.00195 0.490234 8.79102 0.267578 8.45117 0.267578L2.94922 0.279297C2.62109 0.279297 2.41016 0.519531 2.41016 0.794922C2.41016 1.07031 2.65039 1.30469 2.92578 1.30469H4.66602L7.45508 1.19922L6.39453 2.13672L1.16211 7.38086C1.05664 7.48633 0.998047 7.61523 0.998047 7.73828C0.998047 8.01367 1.24414 8.27734 1.53125 8.27734C1.66602 8.27734 1.78906 8.22461 1.89453 8.11914L7.13281 2.875L8.07617 1.81445L7.96484 4.48047V6.34961C7.96484 6.61914 8.19922 6.86523 8.48633 6.86523C8.76172 6.86523 9.00195 6.63672 9.00195 6.32617Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ Attr.target "_blank"
                            , Attr.rel "noopener noreferrer"
                            , css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "https://designdetails.fm"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M7 4a3 3 0 016 0v4a3 3 0 11-6 0V4zm4 10.93A7.001 7.001 0 0017 8a1 1 0 10-2 0A5 5 0 015 8a1 1 0 00-2 0 7.001 7.001 0 006 6.93V17H6a1 1 0 100 2h8a1 1 0 100-2h-3v-2.07z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Design Details" ]
                            , span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    , Tw.text_black
                                    , Tw.text_opacity_40
                                    , Bp.dark
                                        [ Tw.text_white
                                        ]
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "10"
                                    , SvgAttr.height "9"
                                    , SvgAttr.viewBox "0 0 10 9"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M9.00195 6.32617V0.824219C9.00195 0.490234 8.79102 0.267578 8.45117 0.267578L2.94922 0.279297C2.62109 0.279297 2.41016 0.519531 2.41016 0.794922C2.41016 1.07031 2.65039 1.30469 2.92578 1.30469H4.66602L7.45508 1.19922L6.39453 2.13672L1.16211 7.38086C1.05664 7.48633 0.998047 7.61523 0.998047 7.73828C0.998047 8.01367 1.24414 8.27734 1.53125 8.27734C1.66602 8.27734 1.78906 8.22461 1.89453 8.11914L7.13281 2.875L8.07617 1.81445L7.96484 4.48047V6.34961C7.96484 6.61914 8.19922 6.86523 8.48633 6.86523C8.76172 6.86523 9.00195 6.63672 9.00195 6.32617Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ Attr.target "_blank"
                            , Attr.rel "noopener noreferrer"
                            , css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "https://staff.design"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.viewBox "0 0 19 20"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.clipRule "evenodd"
                                        , SvgAttr.d "M16.5624 7.65024C15.3911 4.22834 13.9853 0.299954 10.3749 0.0277404C6.02993 -0.299865 1.80395 2.3005 0.442366 6.43482C-0.933043 10.6111 1.02411 15.0339 4.57906 17.6263C8.16191 20.239 13.1943 21.056 16.602 18.2191C19.4143 15.8778 18.023 11.8653 16.7983 8.33341C16.7186 8.10345 16.6396 7.87553 16.5624 7.65024ZM12.9543 11.6429C12.9543 13.4747 11.5233 14.6404 9.06857 14.6404C7.06405 14.6404 5.90451 13.9188 5.52211 13.0491C5.42959 12.8456 5.38642 12.6359 5.38642 12.4324C5.38642 11.8032 5.86133 11.3715 6.50895 11.3715C7.00237 11.3715 7.33543 11.5257 7.68699 12.0191C7.99538 12.457 8.51347 12.6359 9.09941 12.6359C9.88271 12.6359 10.3638 12.3152 10.3638 11.8773C10.3638 11.4578 10.0184 11.279 9.01923 11.1001L8.1249 10.9398C6.35475 10.6252 5.38642 9.73087 5.38642 8.34929C5.38642 6.56064 6.92836 5.43194 9.0439 5.43194C10.8079 5.43194 12.0723 6.05488 12.5349 7.16508C12.6089 7.34395 12.6459 7.51048 12.6459 7.71401C12.6459 8.30612 12.2141 8.70702 11.5603 8.71319C11.0052 8.71319 10.6537 8.52199 10.3391 8.04707C10.0492 7.60299 9.636 7.43646 9.07474 7.43646C8.34694 7.43646 7.97688 7.75719 7.97688 8.15809C7.97688 8.55899 8.35928 8.7502 9.24743 8.91056L10.1418 9.07092C12.0538 9.41631 12.9543 10.1996 12.9543 11.6429Z"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Staff Design" ]
                            , span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    , Tw.text_black
                                    , Tw.text_opacity_40
                                    , Bp.dark
                                        [ Tw.text_white
                                        ]
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "10"
                                    , SvgAttr.height "9"
                                    , SvgAttr.viewBox "0 0 10 9"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M9.00195 6.32617V0.824219C9.00195 0.490234 8.79102 0.267578 8.45117 0.267578L2.94922 0.279297C2.62109 0.279297 2.41016 0.519531 2.41016 0.794922C2.41016 1.07031 2.65039 1.30469 2.92578 1.30469H4.66602L7.45508 1.19922L6.39453 2.13672L1.16211 7.38086C1.05664 7.48633 0.998047 7.61523 0.998047 7.73828C0.998047 8.01367 1.24414 8.27734 1.53125 8.27734C1.66602 8.27734 1.78906 8.22461 1.89453 8.11914L7.13281 2.875L8.07617 1.81445L7.96484 4.48047V6.34961C7.96484 6.61914 8.19922 6.86523 8.48633 6.86523C8.76172 6.86523 9.00195 6.63672 9.00195 6.32617Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ Attr.target "_blank"
                            , Attr.rel "noopener noreferrer"
                            , css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "https://figma.com/@brian"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "14"
                                    , SvgAttr.height "15"
                                    , SvgAttr.viewBox "0 0 14 14"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M4.63338 14.8C5.25222 14.8 5.84571 14.5541 6.2833 14.1166C6.72088 13.679 6.96672 13.0855 6.96672 12.4666V10.1333H4.63338C4.01454 10.1333 3.42105 10.3791 2.98347 10.8167C2.54588 11.2543 2.30005 11.8478 2.30005 12.4666C2.30005 13.0855 2.54588 13.679 2.98347 14.1166C3.42105 14.5541 4.01454 14.8 4.63338 14.8V14.8Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M2.30005 7.39998C2.30005 6.78115 2.54588 6.18765 2.98347 5.75007C3.42105 5.31248 4.01454 5.06665 4.63338 5.06665H6.96672V9.73332H4.63338C4.01454 9.73332 3.42105 9.48748 2.98347 9.0499C2.54588 8.61231 2.30005 8.01882 2.30005 7.39998V7.39998Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M2.30005 2.33333C2.30005 1.71481 2.54563 1.12159 2.98282 0.684062C3.42001 0.246529 4.01304 0.000483221 4.63156 0L6.96489 0V4.66667H4.63338C4.01454 4.66667 3.42105 4.42083 2.98347 3.98325C2.54588 3.54566 2.30005 2.95217 2.30005 2.33333V2.33333Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M7.3999 0H9.73323C10.3521 0 10.9456 0.245833 11.3832 0.683417C11.8207 1.121 12.0666 1.71449 12.0666 2.33333C12.0666 2.95217 11.8207 3.54566 11.3832 3.98325C10.9456 4.42083 10.3521 4.66667 9.73323 4.66667H7.3999V0Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M11.9667 7.4034C11.9667 8.02224 11.7209 8.61573 11.2833 9.05332C10.8457 9.4909 10.2522 9.73673 9.63338 9.73673C9.01454 9.73673 8.42105 9.4909 7.98347 9.05332C7.54588 8.61573 7.30005 8.02224 7.30005 7.4034C7.30005 6.78456 7.54588 6.19107 7.98347 5.75349C8.42105 5.3159 9.01454 5.07007 9.63338 5.07007C10.2522 5.07007 10.8457 5.3159 11.2833 5.75349C11.7209 6.19107 11.9667 6.78456 11.9667 7.4034V7.4034Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Figma Plugins" ]
                            , span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    , Tw.text_black
                                    , Tw.text_opacity_40
                                    , Bp.dark
                                        [ Tw.text_white
                                        ]
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "10"
                                    , SvgAttr.height "9"
                                    , SvgAttr.viewBox "0 0 10 9"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M9.00195 6.32617V0.824219C9.00195 0.490234 8.79102 0.267578 8.45117 0.267578L2.94922 0.279297C2.62109 0.279297 2.41016 0.519531 2.41016 0.794922C2.41016 1.07031 2.65039 1.30469 2.92578 1.30469H4.66602L7.45508 1.19922L6.39453 2.13672L1.16211 7.38086C1.05664 7.48633 0.998047 7.61523 0.998047 7.73828C0.998047 8.01367 1.24414 8.27734 1.53125 8.27734C1.66602 8.27734 1.78906 8.22461 1.89453 8.11914L7.13281 2.875L8.07617 1.81445L7.96484 4.48047V6.34961C7.96484 6.61914 8.19922 6.86523 8.48633 6.86523C8.76172 6.86523 9.00195 6.63672 9.00195 6.32617Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "/security"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Security Checklist" ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "/hn"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Hacker News" ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "/app-dissection"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 20 20"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.d "M11.3 1.046A1 1 0 0112 2v5h4a1 1 0 01.82 1.573l-7 10A1 1 0 018 18v-5H4a1 1 0 01-.82-1.573l7-10a1 1 0 011.12-.38z"
                                        , SvgAttr.clipRule "evenodd"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "App Dissection" ]
                            ]
                        ]
                    ]
                , ul
                    [ css
                        [ Tw.space_y_1
                        ]
                    ]
                    [ h4
                        [ css
                            [ Tw.px_2
                            , Tw.pt_5
                            , Tw.pb_2
                            , Tw.text_xs
                            , Tw.font_semibold
                            , Tw.text_gray_1000
                            , Tw.text_opacity_40
                            , Bp.dark
                                [ Tw.text_white
                                ]
                            ]
                        ]
                        [ text "Online" ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ Attr.target "_blank"
                            , Attr.rel "noopener noreferrer"
                            , css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "https://twitter.com/brian_lovin"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 16 14"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "14"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M14.3617 3.35401C14.3687 3.49999 14.3713 3.64777 14.3713 3.79376C14.3713 8.29039 11.0696 13.4737 5.03217 13.4737C3.17739 13.4737 1.45304 12.9105 0 11.9445C0.859457 12.0522 1.73097 11.9833 2.56473 11.7418C3.39849 11.5003 4.17814 11.0908 4.85913 10.5369C4.17428 10.5235 3.51059 10.2886 2.96085 9.86516C2.41112 9.44169 2.00282 8.85078 1.79304 8.17505C2.28527 8.27044 2.79186 8.25042 3.27565 8.11647C2.53271 7.96035 1.8647 7.54285 1.38482 6.9347C0.904951 6.32655 0.642734 5.56518 0.642609 4.77959V4.73724C1.09843 5.00001 1.60823 5.14614 2.12957 5.16347C1.4338 4.6828 0.941284 3.94507 0.752536 3.10088C0.563788 2.25669 0.693041 1.36968 1.11391 0.620882C1.93808 1.67201 2.96639 2.53173 4.13207 3.14418C5.29774 3.75663 6.5747 4.10813 7.88 4.17584C7.82353 3.92137 7.79523 3.66107 7.79565 3.39996C7.79565 2.9534 7.88054 2.51121 8.04548 2.09865C8.21041 1.68609 8.45215 1.31124 8.7569 0.995511C9.06165 0.679784 9.42344 0.429363 9.82159 0.258552C10.2197 0.0877414 10.6465 -0.00011384 11.0774 4.51813e-06C11.5265 -0.000754465 11.9709 0.0941183 12.3832 0.278738C12.7954 0.463357 13.1667 0.733786 13.4739 1.07325C14.2088 0.922489 14.9136 0.643368 15.5583 0.247815C15.3131 1.03559 14.8001 1.70424 14.1148 2.12937C14.7654 2.04944 15.4009 1.86901 16 1.5941C15.5599 2.27755 15.005 2.87363 14.3617 3.35401V3.35401Z"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Twitter" ]
                            , span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    , Tw.text_black
                                    , Tw.text_opacity_40
                                    , Bp.dark
                                        [ Tw.text_white
                                        ]
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "10"
                                    , SvgAttr.height "9"
                                    , SvgAttr.viewBox "0 0 10 9"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M9.00195 6.32617V0.824219C9.00195 0.490234 8.79102 0.267578 8.45117 0.267578L2.94922 0.279297C2.62109 0.279297 2.41016 0.519531 2.41016 0.794922C2.41016 1.07031 2.65039 1.30469 2.92578 1.30469H4.66602L7.45508 1.19922L6.39453 2.13672L1.16211 7.38086C1.05664 7.48633 0.998047 7.61523 0.998047 7.73828C0.998047 8.01367 1.24414 8.27734 1.53125 8.27734C1.66602 8.27734 1.78906 8.22461 1.89453 8.11914L7.13281 2.875L8.07617 1.81445L7.96484 4.48047V6.34961C7.96484 6.61914 8.19922 6.86523 8.48633 6.86523C8.76172 6.86523 9.00195 6.63672 9.00195 6.32617Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ Attr.target "_blank"
                            , Attr.rel "noopener noreferrer"
                            , css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "https://www.youtube.com/channel/UC-esBYEUGQ6iK1wmw76f5MA"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.viewBox "0 0 16 16"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M0.734576 5.16761C0.805268 4.07928 1.68027 3.22636 2.76955 3.1724C4.34691 3.09425 6.60141 3 8.3001 3C9.99879 3 12.2533 3.09425 13.8306 3.1724C14.9199 3.22636 15.7949 4.07928 15.8656 5.16761C15.9333 6.21031 16.0001 7.49331 16.0001 8.5C16.0001 9.50669 15.9333 10.7897 15.8656 11.8324C15.7949 12.9207 14.9199 13.7736 13.8306 13.8276C12.2533 13.9058 9.99879 14 8.3001 14C6.60141 14 4.34691 13.9058 2.76955 13.8276C1.68027 13.7736 0.805268 12.9207 0.734576 11.8324C0.666848 10.7897 0.600098 9.50669 0.600098 8.5C0.600098 7.49331 0.666848 6.21031 0.734576 5.16761Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M6.6499 6.30005V10.7L11.0499 8.50005L6.6499 6.30005Z"
                                        , SvgAttr.fill "currentColor"
                                        , SvgAttr.css
                                            [ Tw.text_gray_50
                                            , Bp.dark
                                                [ Tw.text_gray_900
                                                ]
                                            ]
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "YouTube" ]
                            , span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    , Tw.text_black
                                    , Tw.text_opacity_40
                                    , Bp.dark
                                        [ Tw.text_white
                                        ]
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "10"
                                    , SvgAttr.height "9"
                                    , SvgAttr.viewBox "0 0 10 9"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M9.00195 6.32617V0.824219C9.00195 0.490234 8.79102 0.267578 8.45117 0.267578L2.94922 0.279297C2.62109 0.279297 2.41016 0.519531 2.41016 0.794922C2.41016 1.07031 2.65039 1.30469 2.92578 1.30469H4.66602L7.45508 1.19922L6.39453 2.13672L1.16211 7.38086C1.05664 7.48633 0.998047 7.61523 0.998047 7.73828C0.998047 8.01367 1.24414 8.27734 1.53125 8.27734C1.66602 8.27734 1.78906 8.22461 1.89453 8.11914L7.13281 2.875L8.07617 1.81445L7.96484 4.48047V6.34961C7.96484 6.61914 8.19922 6.86523 8.48633 6.86523C8.76172 6.86523 9.00195 6.63672 9.00195 6.32617Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ Attr.target "_blank"
                            , Attr.rel "noopener noreferrer"
                            , css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "https://github.com/brianlovin"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.viewBox "0 0 17 16"
                                    , SvgAttr.width "16"
                                    , SvgAttr.height "16"
                                    , SvgAttr.fill "currentColor"
                                    ]
                                    [ path
                                        [ SvgAttr.fillRule "evenodd"
                                        , SvgAttr.clipRule "evenodd"
                                        , SvgAttr.d "M8.06478 0C3.61133 0 0 3.6722 0 8.20248C0 11.8266 2.31081 14.9013 5.51518 15.9859C5.91823 16.0618 6.06622 15.808 6.06622 15.5913C6.06622 15.3957 6.05875 14.7496 6.05528 14.0642C3.81164 14.5604 3.3382 13.0963 3.3382 13.0963C2.97134 12.1483 2.44275 11.8961 2.44275 11.8961C1.71103 11.387 2.49791 11.3975 2.49791 11.3975C3.30775 11.4552 3.73417 12.2428 3.73417 12.2428C4.45347 13.4968 5.62083 13.1343 6.08103 12.9247C6.15342 12.3947 6.36245 12.0325 6.59305 11.8278C4.80178 11.6204 2.91872 10.9171 2.91872 7.77405C2.91872 6.87851 3.23377 6.14679 3.74966 5.57235C3.66593 5.36561 3.38987 4.53148 3.8278 3.40163C3.8278 3.40163 4.50501 3.18118 6.04619 4.24243C6.68951 4.0607 7.37942 3.96953 8.06478 3.96644C8.75018 3.96953 9.44062 4.0607 10.0851 4.24243C11.6244 3.18118 12.3007 3.40163 12.3007 3.40163C12.7397 4.53148 12.4635 5.36561 12.3798 5.57235C12.8969 6.14679 13.2098 6.87851 13.2098 7.77405C13.2098 10.9245 11.3231 11.6182 9.52728 11.8213C9.81657 12.0758 10.0743 12.575 10.0743 13.3403C10.0743 14.4377 10.065 15.321 10.065 15.5913C10.065 15.8096 10.2101 16.0653 10.6189 15.9848C13.8216 14.899 16.1294 11.8254 16.1294 8.20248C16.1294 3.6722 12.5187 0 8.06478 0Z"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "GitHub" ]
                            , span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    , Tw.text_black
                                    , Tw.text_opacity_40
                                    , Bp.dark
                                        [ Tw.text_white
                                        ]
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "10"
                                    , SvgAttr.height "9"
                                    , SvgAttr.viewBox "0 0 10 9"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M9.00195 6.32617V0.824219C9.00195 0.490234 8.79102 0.267578 8.45117 0.267578L2.94922 0.279297C2.62109 0.279297 2.41016 0.519531 2.41016 0.794922C2.41016 1.07031 2.65039 1.30469 2.92578 1.30469H4.66602L7.45508 1.19922L6.39453 2.13672L1.16211 7.38086C1.05664 7.48633 0.998047 7.61523 0.998047 7.73828C0.998047 8.01367 1.24414 8.27734 1.53125 8.27734C1.66602 8.27734 1.78906 8.22461 1.89453 8.11914L7.13281 2.875L8.07617 1.81445L7.96484 4.48047V6.34961C7.96484 6.61914 8.19922 6.86523 8.48633 6.86523C8.76172 6.86523 9.00195 6.63672 9.00195 6.32617Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    , li
                        [ css
                            [ Tw.flex
                            , Tw.items_stretch
                            , Tw.space_x_1
                            ]
                        ]
                        [ a
                            [ Attr.target "_blank"
                            , Attr.rel "noopener noreferrer"
                            , css
                                [ Tw.flex
                                , Tw.flex_1
                                , Tw.items_center
                                , Tw.space_x_3
                                , Tw.rounded_md
                                , Tw.px_2
                                , Tw.py_1_dot_5
                                , Tw.text_sm
                                , Tw.font_medium
                                , Tw.text_gray_700
                                , Bp.dark
                                    [ Tw.text_gray_200
                                    ]
                                , Bp.sm
                                    [ Css.hover
                                        [ Tw.bg_gray_200
                                        , Tw.text_gray_900
                                        ]
                                    ]
                                ]
                            , Attr.href "https://figma.com/@brian"
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "14"
                                    , SvgAttr.height "15"
                                    , SvgAttr.viewBox "0 0 14 14"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M4.63338 14.8C5.25222 14.8 5.84571 14.5541 6.2833 14.1166C6.72088 13.679 6.96672 13.0855 6.96672 12.4666V10.1333H4.63338C4.01454 10.1333 3.42105 10.3791 2.98347 10.8167C2.54588 11.2543 2.30005 11.8478 2.30005 12.4666C2.30005 13.0855 2.54588 13.679 2.98347 14.1166C3.42105 14.5541 4.01454 14.8 4.63338 14.8V14.8Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M2.30005 7.39998C2.30005 6.78115 2.54588 6.18765 2.98347 5.75007C3.42105 5.31248 4.01454 5.06665 4.63338 5.06665H6.96672V9.73332H4.63338C4.01454 9.73332 3.42105 9.48748 2.98347 9.0499C2.54588 8.61231 2.30005 8.01882 2.30005 7.39998V7.39998Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M2.30005 2.33333C2.30005 1.71481 2.54563 1.12159 2.98282 0.684062C3.42001 0.246529 4.01304 0.000483221 4.63156 0L6.96489 0V4.66667H4.63338C4.01454 4.66667 3.42105 4.42083 2.98347 3.98325C2.54588 3.54566 2.30005 2.95217 2.30005 2.33333V2.33333Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M7.3999 0H9.73323C10.3521 0 10.9456 0.245833 11.3832 0.683417C11.8207 1.121 12.0666 1.71449 12.0666 2.33333C12.0666 2.95217 11.8207 3.54566 11.3832 3.98325C10.9456 4.42083 10.3521 4.66667 9.73323 4.66667H7.3999V0Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    , path
                                        [ SvgAttr.d "M11.9667 7.4034C11.9667 8.02224 11.7209 8.61573 11.2833 9.05332C10.8457 9.4909 10.2522 9.73673 9.63338 9.73673C9.01454 9.73673 8.42105 9.4909 7.98347 9.05332C7.54588 8.61573 7.30005 8.02224 7.30005 7.4034C7.30005 6.78456 7.54588 6.19107 7.98347 5.75349C8.42105 5.3159 9.01454 5.07007 9.63338 5.07007C10.2522 5.07007 10.8457 5.3159 11.2833 5.75349C11.7209 6.19107 11.9667 6.78456 11.9667 7.4034V7.4034Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            , span
                                [ css
                                    [ Tw.flex_1
                                    ]
                                ]
                                [ text "Figma" ]
                            , span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.justify_center
                                    , Tw.w_4
                                    , Tw.text_black
                                    , Tw.text_opacity_40
                                    , Bp.dark
                                        [ Tw.text_white
                                        ]
                                    ]
                                ]
                                [ svg
                                    [ SvgAttr.width "10"
                                    , SvgAttr.height "9"
                                    , SvgAttr.viewBox "0 0 10 9"
                                    , SvgAttr.fill "none"
                                    ]
                                    [ path
                                        [ SvgAttr.d "M9.00195 6.32617V0.824219C9.00195 0.490234 8.79102 0.267578 8.45117 0.267578L2.94922 0.279297C2.62109 0.279297 2.41016 0.519531 2.41016 0.794922C2.41016 1.07031 2.65039 1.30469 2.92578 1.30469H4.66602L7.45508 1.19922L6.39453 2.13672L1.16211 7.38086C1.05664 7.48633 0.998047 7.61523 0.998047 7.73828C0.998047 8.01367 1.24414 8.27734 1.53125 8.27734C1.66602 8.27734 1.78906 8.22461 1.89453 8.11914L7.13281 2.875L8.07617 1.81445L7.96484 4.48047V6.34961C7.96484 6.61914 8.19922 6.86523 8.48633 6.86523C8.76172 6.86523 9.00195 6.63672 9.00195 6.32617Z"
                                        , SvgAttr.fill "currentColor"
                                        ]
                                        []
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            , div
                [ Attr.attribute "data-cy" "sign-in-button"
                , css
                    [ Tw.sticky
                    , Tw.bottom_0
                    , Tw.z_10
                    , Tw.flex
                    , Tw.items_center
                    , Tw.justify_between
                    , Tw.p_2
                    , Tw.space_x_3
                    , Tw.bg_white
                    , Tw.border_t
                    , Tw.filter_blur
                    , Tw.border_gray_150
                    , Tw.bg_opacity_80
                    , Bp.dark
                        [ Tw.border_gray_800
                        , Tw.bg_gray_900
                        , Tw.bg_opacity_60
                        ]
                    ]
                ]
                [ button
                    [ css
                        [ Tw.flex
                        , Tw.space_x_2
                        , Tw.flex_none
                        , Tw.items_center
                        , Tw.justify_center
                        , Tw.cursor_pointer
                        , Tw.leading_none
                        , Tw.transition_all
                        , Tw.font_semibold
                        , Tw.px_4
                        , Tw.py_2
                        , Tw.text_sm
                        , Tw.opacity_100
                        , Tw.rounded_md
                        , Tw.text_gray_700
                        , Tw.bg_gray_200
                        , Tw.bg_opacity_0
                        , Bp.dark
                            [ Tw.bg_gray_800
                            , Tw.text_gray_300
                            , Css.hover
                                [ Tw.text_white
                                ]
                            ]
                        , Css.hover
                            [ Tw.text_gray_1000
                            , Tw.bg_opacity_100
                            ]
                        ]
                    , Attr.style "width" "100%"
                    ]
                    [ text "Sign in" ]
                ]
            ]
        , div
            [ css
                [ Tw.fixed
                , Tw.inset_0
                , Tw.z_20
                , Tw.bg_black
                , Tw.bg_opacity_10
                , Tw.transition
                , Tw.duration_200
                , Tw.ease_in_out
                , Tw.pointer_events_none
                , Tw.opacity_0
                , Bp.dark
                    [ Tw.bg_opacity_50
                    ]
                ]
            ]
            []
        , div
            [ css
                [ Tw.flex
                , Tw.flex_1
                ]
            ]
            [ div
                [ css
                    [ Tw.flex
                    , Tw.w_full
                    ]
                ]
                [ div
                    [ Attr.id "main"
                    , css
                        [ Tw.relative
                        , Tw.flex
                        , Tw.max_h_screen
                        , Tw.w_full
                        , Tw.flex_col
                        , Tw.overflow_y_auto
                        , Tw.bg_white
                        , Bp.dark
                            [ Tw.bg_black
                            ]
                        ]
                    , Attr.attribute "data-cy" "home-intro"
                    ]
                    [ div
                        [ Attr.style "background" "rgba(255,255,255,0)"
                        , Attr.style "box-shadow" "0 1px 3px rgba(0,0,0,0)"
                        , Attr.style "min-height" "48px"
                        , css
                            [ Tw.filter_blur
                            , Tw.sticky
                            , Tw.top_0
                            , Tw.z_10
                            , Tw.flex
                            , Tw.flex_col
                            , Tw.justify_center
                            , Tw.px_3
                            , Tw.py_2
                            , Bp.dark
                                [ Tw.border_b
                                , Tw.border_gray_900
                                ]
                            ]
                        ]
                        [ div
                            [ css
                                [ Tw.flex
                                , Tw.items_center
                                , Tw.justify_between
                                , Tw.flex_none
                                ]
                            ]
                            [ span
                                [ css
                                    [ Tw.flex
                                    , Tw.items_center
                                    , Tw.space_x_3
                                    ]
                                ]
                                [ span
                                    [ css
                                        [ Tw.flex
                                        , Tw.items_center
                                        , Tw.justify_center
                                        , Tw.p_2
                                        , Tw.rounded_md
                                        , Tw.cursor_pointer
                                        , Bp.dark
                                            [ Css.hover
                                                [ Tw.bg_gray_800
                                                ]
                                            ]
                                        , Css.hover
                                            [ Tw.bg_gray_200
                                            ]
                                        , Bp.lg
                                            [ Tw.hidden
                                            ]
                                        ]
                                    ]
                                    [ svg
                                        [ SvgAttr.width "16"
                                        , SvgAttr.height "16"
                                        , SvgAttr.viewBox "0 0 24 24"
                                        , SvgAttr.fill "none"
                                        , SvgAttr.stroke "currentColor"
                                        , SvgAttr.strokeWidth "2"
                                        , SvgAttr.strokeLinecap "round"
                                        , SvgAttr.strokeLinejoin "round"
                                        , SvgAttr.css
                                            [ Tw.text_primary
                                            ]
                                        ]
                                        [ Svg.line
                                            [ SvgAttr.x1 "3"
                                            , SvgAttr.y1 "12"
                                            , SvgAttr.x2 "21"
                                            , SvgAttr.y2 "12"
                                            ]
                                            []
                                        , Svg.line
                                            [ SvgAttr.x1 "3"
                                            , SvgAttr.y1 "6"
                                            , SvgAttr.x2 "21"
                                            , SvgAttr.y2 "6"
                                            ]
                                            []
                                        , Svg.line
                                            [ SvgAttr.x1 "3"
                                            , SvgAttr.y1 "18"
                                            , SvgAttr.x2 "21"
                                            , SvgAttr.y2 "18"
                                            ]
                                            []
                                        ]
                                    ]
                                , h2
                                    [ Attr.style "transform" "translateY(200%)"
                                    , Attr.style "opacity" "0"
                                    , css
                                        [ Tw.text_sm
                                        , Tw.font_bold
                                        , Tw.text_primary
                                        , Tw.transform_gpu
                                        , Tw.line_clamp_1
                                        ]
                                    ]
                                    [ text "Home" ]
                                ]
                            ]
                        , div []
                            []
                        ]
                    , div
                        [ css
                            [ Tw.p_4
                            ]
                        ]
                        []
                    , div
                        [ css
                            [ Tw.mx_auto
                            , Tw.w_full
                            , Tw.max_w_3xl
                            , Tw.px_4
                            , Tw.py_12
                            , Tw.pb_10
                            , Bp.md
                                [ Tw.px_8
                                ]
                            ]
                        ]
                        [ div
                            [ css
                                [ Tw.pb_24
                                , Tw.space_y_8
                                , Bp.md
                                    [ Tw.space_y_16
                                    ]
                                ]
                            ]
                            [ div
                                [ css
                                    [ Tw.grid
                                    , Tw.items_start
                                    , Tw.grid_cols_1
                                    , Tw.gap_6
                                    , Bp.md
                                        [ Tw.grid_cols_12
                                        ]
                                    ]
                                ]
                                [ h4
                                    [ css
                                        [ Tw.col_span_2
                                        , Tw.pt_8
                                        , Tw.text_lg
                                        , Tw.font_extrabold
                                        , Tw.text_black
                                        , Bp.dark
                                            [ Tw.text_white
                                            ]
                                        , Bp.md
                                            [ Tw.pt_0
                                            , Tw.text_right
                                            , Tw.text_base
                                            , Tw.font_normal
                                            , Tw.text_opacity_40
                                            ]
                                        ]
                                    ]
                                    []
                                , div
                                    [ css
                                        [ Tw.col_span_10
                                        ]
                                    ]
                                    [ div
                                        [ css
                                            [ Tw.prose
                                            , Tw.text_primary
                                            ]
                                        ]
                                        [ p []
                                            [ text "Hey, I'm Brian. I'm a designer,"
                                            , {- -}
                                              a
                                                [ Attr.target "_blank"
                                                , Attr.rel "noopener noreferrer"
                                                , Attr.href "https://designdetails.fm"
                                                ]
                                                [ text "podcaster" ]
                                            , text ","
                                            , {- -}
                                              a
                                                [ Attr.href "/writing"
                                                ]
                                                [ text "writer" ]
                                            , text ", and"
                                            , {- -}
                                              a
                                                [ Attr.target "_blank"
                                                , Attr.rel "noopener noreferrer"
                                                , Attr.href "https://github.com/brianlovin"
                                                ]
                                                [ text "software tinkerer" ]
                                            , text ". I'm currently building"
                                            , {- -}
                                              a
                                                [ Attr.target "_blank"
                                                , Attr.rel "noopener noreferrer"
                                                , Attr.href "https://campsite.design"
                                                ]
                                                [ text "Campsite" ]
                                            , text ", a tool that helps teams share and collaborate on work-in-progress."
                                            ]
                                        , p []
                                            [ text "Before Campsite, I spent four years designing"
                                            , {- -}
                                              a
                                                [ Attr.target "_blank"
                                                , Attr.rel "noopener noreferrer"
                                                , Attr.href "https://github.com/mobile"
                                                ]
                                                [ text "native mobile apps at GitHub" ]
                                            , text "."
                                            ]
                                        , p []
                                            [ text "Before GitHub, I co-founded"
                                            , {- -}
                                              a
                                                [ Attr.target "_blank"
                                                , Attr.rel "noopener noreferrer"
                                                , Attr.href "https://spectrum.chat"
                                                ]
                                                [ text "Spectrum" ]
                                            , text ", a platform for large-scale communities to have better public conversations. Spectrum was acquired by GitHub in November, 2018."
                                            ]
                                        , p []
                                            [ text "Before Spectrum I designed payments experiences at Facebook, working across Facebook, Messenger, WhatsApp, and Instagram. I originally cut my teeth as the first product designer at"
                                            , {- -}
                                              a
                                                [ Attr.target "_blank"
                                                , Attr.rel "noopener noreferrer"
                                                , Attr.href "https://buffer.com"
                                                ]
                                                [ text "Buffer" ]
                                            , text "."
                                            ]
                                        , p []
                                            [ text "I also co-host the"
                                            , {- -}
                                              a
                                                [ Attr.target "_blank"
                                                , Attr.rel "noopener noreferrer"
                                                , Attr.href "https://designdetails.fm"
                                                ]
                                                [ text "Design Details Podcast" ]
                                            , text ", a weekly conversation about design process and culture. Design Details is part of"
                                            , {- -}
                                              a
                                                [ Attr.target "_blank"
                                                , Attr.rel "noopener noreferrer"
                                                , Attr.href "https://spec.fm"
                                                ]
                                                [ text "Spec.fm" ]
                                            , text ", a podcast network for designers and developers, which I co-founded in 2015."
                                            ]
                                        ]
                                    , div
                                        [ css
                                            [ Tw.flex
                                            , Tw.pt_6
                                            ]
                                        ]
                                        [ a
                                            [ Attr.href "https://changelog.brianlovin.com"
                                            , css
                                                [ Tw.flex
                                                , Tw.space_x_2
                                                , Tw.flex_none
                                                , Tw.items_center
                                                , Tw.justify_center
                                                , Tw.cursor_pointer
                                                , Tw.leading_none
                                                , Tw.transition_all
                                                , Tw.font_semibold
                                                , Tw.px_4
                                                , Tw.py_2
                                                , Tw.text_sm
                                                , Tw.opacity_100
                                                , Tw.rounded_md
                                                , Tw.text_gray_700
                                                , Tw.shadow_xs
                                                , Tw.bg_white
                                                , Tw.border
                                                , Tw.border_gray_400
                                                , Tw.border_opacity_30
                                                , Bp.dark
                                                    [ Tw.border_gray_700
                                                    , Tw.bg_white
                                                    , Tw.bg_opacity_10
                                                    , Tw.text_gray_200
                                                    , Css.hover
                                                        [ Tw.border_gray_600
                                                        , Tw.text_white
                                                        ]
                                                    ]
                                                , Css.hover
                                                    [ Tw.text_gray_1000
                                                    , Tw.border_opacity_50
                                                    , Tw.shadow_sm
                                                    ]
                                                ]
                                            ]
                                            [ text "View changelog" ]
                                        ]
                                    ]
                                ]
                            , div
                                [ css
                                    [ Tw.grid
                                    , Tw.items_start
                                    , Tw.grid_cols_1
                                    , Tw.gap_6
                                    , Bp.md
                                        [ Tw.grid_cols_12
                                        ]
                                    ]
                                ]
                                [ h4
                                    [ css
                                        [ Tw.col_span_2
                                        , Tw.pt_8
                                        , Tw.text_lg
                                        , Tw.font_extrabold
                                        , Tw.text_black
                                        , Bp.dark
                                            [ Tw.text_white
                                            ]
                                        , Bp.md
                                            [ Tw.pt_0
                                            , Tw.text_right
                                            , Tw.text_base
                                            , Tw.font_normal
                                            , Tw.text_opacity_40
                                            ]
                                        ]
                                    ]
                                    [ text "Online" ]
                                , div
                                    [ css
                                        [ Tw.col_span_10
                                        ]
                                    ]
                                    [ div
                                        [ css
                                            [ Tw.flex
                                            , Tw.flex_col
                                            , Tw.space_y_3
                                            ]
                                        ]
                                        [ a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "/twitter"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Twitter" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Follow" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "/youtube"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "YouTube" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Subscribe" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "/github"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "GitHub" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Follow" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "/figma"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Figma" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Follow" ]
                                            ]
                                        ]
                                    ]
                                ]
                            , div
                                [ css
                                    [ Tw.grid
                                    , Tw.items_start
                                    , Tw.grid_cols_1
                                    , Tw.gap_6
                                    , Bp.md
                                        [ Tw.grid_cols_12
                                        ]
                                    ]
                                ]
                                [ h4
                                    [ css
                                        [ Tw.col_span_2
                                        , Tw.pt_8
                                        , Tw.text_lg
                                        , Tw.font_extrabold
                                        , Tw.text_black
                                        , Bp.dark
                                            [ Tw.text_white
                                            ]
                                        , Bp.md
                                            [ Tw.pt_0
                                            , Tw.text_right
                                            , Tw.text_base
                                            , Tw.font_normal
                                            , Tw.text_opacity_40
                                            ]
                                        ]
                                    ]
                                    [ text "Where" ]
                                , div
                                    [ css
                                        [ Tw.col_span_10
                                        ]
                                    ]
                                    [ img
                                        [ Attr.alt "Map of San Francisco with blue location dot in the middle"
                                        , Attr.attribute "sizes" "100vw"
                                        , Attr.attribute "srcset" "/_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=640&q=100 640w, /_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=750&q=100 750w, /_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=828&q=100 828w, /_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=1080&q=100 1080w, /_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=1200&q=100 1200w, /_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=1920&q=100 1920w, /_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=2048&q=100 2048w, /_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=3840&q=100 3840w"
                                        , Attr.src "/_next/image?url=%2Fstatic%2Fimg%2Fsf.png&w=3840&q=100"
                                        , Attr.width 800
                                        , Attr.height 400
                                        , Attr.attribute "decoding" "async"
                                        , Attr.attribute "data-nimg" "1"
                                        , css
                                            [ Tw.rounded_2xl
                                            ]
                                        , Attr.style "color" "transparent"
                                        , Attr.style "width" "100%"
                                        , Attr.style "height" "auto"
                                        ]
                                        []
                                    , p
                                        [ css
                                            [ Tw.flex
                                            , Tw.items_center
                                            , Tw.justify_end
                                            , Tw.pt_2
                                            , Tw.space_x_2
                                            , Tw.text_sm
                                            , Tw.text_quaternary
                                            , Bp.md
                                                [ Tw.text_right
                                                ]
                                            ]
                                        ]
                                        [ svg
                                            [ SvgAttr.width "12"
                                            , SvgAttr.height "12"
                                            , SvgAttr.viewBox "0 0 24 24"
                                            , SvgAttr.fill "none"
                                            , SvgAttr.stroke "currentColor"
                                            , SvgAttr.strokeWidth "2"
                                            , SvgAttr.strokeLinecap "round"
                                            , SvgAttr.strokeLinejoin "round"
                                            ]
                                            [ path
                                                [ SvgAttr.d "M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"
                                                ]
                                                []
                                            , Svg.circle
                                                [ SvgAttr.cx "12"
                                                , SvgAttr.cy "10"
                                                , SvgAttr.r "3"
                                                ]
                                                []
                                            ]
                                        , span []
                                            [ text "San Francisco, CA" ]
                                        ]
                                    ]
                                ]
                            , div
                                [ css
                                    [ Tw.grid
                                    , Tw.items_start
                                    , Tw.grid_cols_1
                                    , Tw.gap_6
                                    , Bp.md
                                        [ Tw.grid_cols_12
                                        ]
                                    ]
                                ]
                                [ h4
                                    [ css
                                        [ Tw.col_span_2
                                        , Tw.pt_8
                                        , Tw.text_lg
                                        , Tw.font_extrabold
                                        , Tw.text_black
                                        , Bp.dark
                                            [ Tw.text_white
                                            ]
                                        , Bp.md
                                            [ Tw.pt_0
                                            , Tw.text_right
                                            , Tw.text_base
                                            , Tw.font_normal
                                            , Tw.text_opacity_40
                                            ]
                                        ]
                                    ]
                                    [ text "Work" ]
                                , div
                                    [ css
                                        [ Tw.col_span_10
                                        ]
                                    ]
                                    [ div
                                        [ css
                                            [ Tw.flex
                                            , Tw.flex_col
                                            , Tw.space_y_3
                                            ]
                                        ]
                                        [ a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://campsite.design"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Campsite" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Founder" ]
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "2022—" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://github.com/mobile"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "GitHub" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Product Designer" ]
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "2018—22" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://designdetails.fm"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Design Details Podcast" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Co-host" ]
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "2014—" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://github.com/withspectrum/spectrum"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Spectrum.chat" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Co-founder" ]
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "2017—18" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://facebook.com"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Facebook" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Product Designer" ]
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "2015—17" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://buffer.com"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Buffer" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.text_tertiary
                                                    ]
                                                ]
                                                [ text "Product Designer" ]
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "2013—15" ]
                                            ]
                                        ]
                                    ]
                                ]
                            , div
                                [ css
                                    [ Tw.grid
                                    , Tw.items_start
                                    , Tw.grid_cols_1
                                    , Tw.gap_6
                                    , Bp.md
                                        [ Tw.grid_cols_12
                                        ]
                                    ]
                                ]
                                [ h4
                                    [ css
                                        [ Tw.col_span_2
                                        , Tw.pt_8
                                        , Tw.text_lg
                                        , Tw.font_extrabold
                                        , Tw.text_black
                                        , Bp.dark
                                            [ Tw.text_white
                                            ]
                                        , Bp.md
                                            [ Tw.pt_0
                                            , Tw.text_right
                                            , Tw.text_base
                                            , Tw.font_normal
                                            , Tw.text_opacity_40
                                            ]
                                        ]
                                    ]
                                    [ text "Speaking" ]
                                , div
                                    [ css
                                        [ Tw.col_span_10
                                        ]
                                    ]
                                    [ div
                                        [ css
                                            [ Tw.flex
                                            , Tw.flex_col
                                            , Tw.space_y_3
                                            ]
                                        ]
                                        [ a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://fullstackwhatever.com/"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Full Stack Whatever" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Jan '22" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://artofproductpodcast.com/episode-202"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "The Art of Product" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Mar '22" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://museapp.com/podcast/51-personal-brand/"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Metamuse: Personal Brand" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Mar '22" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://maze.co/podcast/#brian-lovin"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "The Optimal Path Podcast" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Jan '22" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://uibreakfast.com/228-design-advisory-with-brian-lovin/"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "UI Breakfast" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Dec '21" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://designmba.show/episodes/brian-lovin"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Design MBA" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Nov '21" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://progressionapp.com/blog/podcast-26-brian-lovin-github-spectrum-design-details-on-the-rise-of-the-senior-ic/"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Progression Podcast" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Jun '21" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://layout.fm/episodes/194/"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Layout.fm" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Jan '21" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://softwareengineeringdaily.com/'20/07/15/github-mobile-with-brian-lovin-and-ryan-nystrom/"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Software Engineering Daily" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Jul '20" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://avocode.com/blog/brian-lovin-product-designer-github-interview"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "The Grit" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Jul '20" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://www.swiftbysundell.com/podcast/67/"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Swift by Sundell" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Feb '20" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://www.youtube.com/watch?v=SyS3h3kmBnY"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Figma Config" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Feb '20" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://www.loversmagazine.com/interviews/brian-lovin"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Lovers Magazine" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Jan '18" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://www.youtube.com/watch?v=6MBBTdu8v6E"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "GraphQL Summit" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Nov '17" ]
                                            ]
                                        , a
                                            [ Attr.target "_blank"
                                            , Attr.rel "noopener noreferrer"
                                            , Attr.href "https://designdetails.fm/episodes/3e342ac0"
                                            , css
                                                [ Tw.flex
                                                , Tw.items_center
                                                , Tw.space_x_4
                                                , Tw.group
                                                ]
                                            ]
                                            [ strong
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_medium
                                                    , Tw.text_gray_1000
                                                    , Bp.dark
                                                        [ Tw.text_gray_100
                                                        , Bp.dark
                                                            [ Tw.text_blue_500
                                                            ]
                                                        ]
                                                    , Bp.group
                                                        - hover
                                                            [ Tw.text_blue_600
                                                            , Tw.underline
                                                            ]
                                                    ]
                                                ]
                                                [ text "Design Details" ]
                                            , span
                                                [ css
                                                    [ Tw.w_full
                                                    , Tw.border_t
                                                    , Tw.border_gray_300
                                                    , Tw.border_dashed
                                                    , Tw.shrink
                                                    , Bp.dark
                                                        [ Tw.border_gray_800
                                                        ]
                                                    ]
                                                ]
                                                []
                                            , span
                                                [ css
                                                    [ Tw.flex_none
                                                    , Tw.font_mono
                                                    , Tw.text_quaternary
                                                    ]
                                                ]
                                                [ text "Aug '17" ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
