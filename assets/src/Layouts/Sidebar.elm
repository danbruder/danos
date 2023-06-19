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
import Ui.Sidebar exposing (Link, LinkGroup)
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
            div []
                [ Css.Global.global Tw.globalStyles
                , Ui.Sidebar.view
                    { widthClass = Tw.w_64
                    , title = "Dan Bruder"
                    , content = List.map Html.fromUnstyled content.body
                    , linkGroups = linkGroups
                    , footer =
                        [ viewSignOutButton settings.user
                            |> Html.map fromMsg
                        ]
                    }
                ]
        ]
    }


linkGroups : List Ui.Sidebar.LinkGroup
linkGroups =
    [ LinkGroup ""
        [ Link "Home" "/" ""
        , Link "Writing" "/blog" ""
        ]
    , LinkGroup "Me"
        [ Link "Bookmarks" "/bookmarks" ""
        , Link "AMA" "/ama" ""
        , Link "Stack" "/stack" ""
        ]
    , LinkGroup "Projects"
        [ Link "TWHN" "/twhn" ""
        , Link "Lifting" "/lifting" ""
        ]
    , LinkGroup "Online"
        [ Link "Twitter" "https://twitter.com/danbruder" ""
        , Link "Github" "https://github.com/danbruder" ""
        ]
    ]


viewSignOutButton : Auth.User -> Html Msg
viewSignOutButton user =
    Html.button
        [ Events.onClick UserClickedSignOut
        ]
        [ Html.div [ class "" ]
            [ Html.figure [ class "" ]
                [ Html.img
                    [ class ""
                    , src ""
                    , alt user.name
                    ]
                    []
                ]
            , Html.span [ class "" ] [ Html.text "Sign out" ]
            ]
        ]
