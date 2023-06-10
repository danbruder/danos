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
                [ Ui.sidebar
                ]
            , body =
                [ div [ css [ Tw.w_full, Tw.px_3, Tw.py_2 ] ]
                    [ text "main "
                    ]
                ]
            }
        ]
    }
