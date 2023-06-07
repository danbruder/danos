module Pages.Home_ exposing (page)

import Html.Styled exposing (..)
import Html.Styled.Attributes as Attr exposing (css)
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
                [ div
                    [ css
                        [ Tw.bg_color Tw.gray_50
                        , Tw.p_2
                        ]
                    ]
                    [ text "Hello, DanOs"
                    ]
                ]
            , content =
                [ div
                    [ css
                        [ Tw.w_full
                        , Tw.p_2
                        ]
                    ]
                    [ text "Hello, DanOs"
                    ]
                ]
            }
        ]
    }
