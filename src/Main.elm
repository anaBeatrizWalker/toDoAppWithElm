module Main exposing (main)

import Browser
import Html.Styled exposing (Html, div, form, input, button, text)
import Html.Styled.Attributes exposing (type_, value)

type Msg = UpdateNewToDo String
type alias Model = {newToDo : String}

main : Program () Model Msg
main =
    Browser.sandbox { init = {newToDo = "Fazer atividade de SOA"}, update = update, view = view >> Html.Styled.toUnstyled }


update : Msg -> Model -> Model --o estado atual retorna um novo estado
update msg model =
    case msg of
        UpdateNewToDo toDo -> {model | newToDo = toDo} --injeta uma string no model e o atualiza


view : Model -> Html Msg
view model =
    div []
        [ Html.Styled.form [] [
            input [type_ "text", value model.newToDo] []
            , button [type_ "submit"] [text "Submit"]
        ]
        ]
