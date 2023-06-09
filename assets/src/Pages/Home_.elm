module Pages.Home_ exposing (page)

import Css
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attr exposing (css, href)
import Tailwind.Breakpoints as Breakpoints
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw
import Ui
import View exposing (View)


page : View msg
page =
    { title = "Homepage"
    , body =
        [ Ui.layout
            { sidebar =
                [ div [ css [ Tw.flex_1, Tw.p_3, Tw.space_y_1 ] ]
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
                ]
            , content =
                [ div [ css [ Tw.w_full, Tw.px_3, Tw.py_2 ] ]
                    [ text "main "
                    ]
                ]
            }
        ]
    }


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
