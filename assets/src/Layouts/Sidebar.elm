module Layouts.Sidebar exposing (Model, Msg, Settings, layout)

import Auth
import Css
import Css.Global
import Effect exposing (Effect)
import Html as NativeHtml
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events
import Layout exposing (Layout)
import Route exposing (Route)
import Route.Path
import Shared
import Tailwind.Breakpoints as Bp
import Tailwind.Theme as Tw
import Tailwind.Utilities as Tw exposing (..)
import View exposing (View)


type alias Settings =
    { title : String
    , user : Auth.User
    }


layout : Settings -> Shared.Model -> Route () -> Layout Model Msg mainMsg
layout settings shared route =
    Layout.new
        { init = init
        , update = update
        , view = view settings route
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    {}


init : () -> ( Model, Effect Msg )
init _ =
    ( {}
    , Effect.none
    )



-- UPDATE


type Msg
    = UserClickedSignOut


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        UserClickedSignOut ->
            ( model
            , Effect.signOut
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Settings -> Route () -> { fromMsg : Msg -> mainMsg, content : View mainMsg, model : Model } -> View mainMsg
view settings route { fromMsg, model, content } =
    { title = content.title ++ " | DanOS"
    , body =
        [ Html.toUnstyled <|
            Html.div [ css [ Tw.h_screen, Tw.min_h_screen ] ]
                [ Css.Global.global Tw.globalStyles
                , Html.div [ css [ flex ] ]
                    [ Html.div
                        [ css
                            [ h_screen
                            , min_h_screen
                            , bg_color Tw.gray_50
                            , w_80
                            ]
                        ]
                        [ viewSidebar
                            { user = settings.user
                            , route = route
                            }
                            |> Html.map fromMsg
                        ]
                    , Html.div
                        [ css
                            [ h_screen
                            , min_h_screen
                            , overflow_y_scroll
                            , w_full
                            ]
                        ]
                        [ viewMainContent
                            { title = settings.title
                            , content = content
                            }
                        ]
                    ]
                ]
        ]
    }


viewSidebar : { user : Auth.User, route : Route () } -> Html Msg
viewSidebar { user, route } =
    Html.aside
        [ class "is-flex is-flex-direction-column p-2"
        , style "min-width" "200px"
        , style "border-right" "solid 1px #eee"
        ]
        [ viewSidebarLinks route
        , viewSignOutButton user
        ]


viewSignOutButton : Auth.User -> Html Msg
viewSignOutButton user =
    Html.button
        [ class "button is-text is-fullwidth"
        , Events.onClick UserClickedSignOut
        ]
        [ Html.div [ class "is-flex is-align-items-center" ]
            [ Html.figure [ class "image is-24x24" ]
                [ Html.img
                    [ class "is-rounded"
                    , src ""
                    , alt user.name
                    ]
                    []
                ]
            , Html.span [ class "pl-2" ] [ Html.text "Sign out" ]
            ]
        ]


viewMainContent : { title : String, content : View msg } -> Html msg
viewMainContent { title, content } =
    div []
        (content.body
            |> List.map Html.fromUnstyled
        )


viewSidebarLinks route =
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
