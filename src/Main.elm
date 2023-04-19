module Main exposing (main)

import Browser
import Html exposing (Html, div, img)
import Html.Attributes exposing (src, style)

type Msg = NoOp

main : Program () Int Msg
main =
    Browser.sandbox { init = 0, update = update, view = view }


update : Msg -> number -> number
update msg model =
    case msg of
        NoOp -> model


view : Int -> Html Msg
view model =
    div []
        [ img [ src "/src/assets/logo.png", style "width" "300px" ] []
        ]
