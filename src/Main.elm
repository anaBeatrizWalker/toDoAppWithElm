module Main exposing (main)

import Browser
import Html.Styled exposing (Html, div, form, input, button, text, ul, li)
import Html.Styled.Attributes exposing (type_, value, css)
import Html.Styled.Events exposing (onInput, onSubmit)
import Css
import Html.Styled.Events exposing (onClick)

type Msg = UpdateNewToDo String | SubmitToDo | RemoveToDo Int
type alias Model = {newToDo : String, toDos: List ToDo}
type alias ToDo = {task: String, completed: Bool, id: Int}

main : Program () Model Msg
main =
    Browser.sandbox { init = {newToDo = "Fazer atividade de SOA", toDos = []}, update = update, view = view >> Html.Styled.toUnstyled }


update : Msg -> Model -> Model --o estado atual retorna um novo estado
update msg model =
    case msg of
        UpdateNewToDo toDo -> {model | newToDo = toDo} --injeta uma string no model e o atualiza
        SubmitToDo -> {model | toDos =( model.toDos ++ [{ task = model.newToDo, completed = False, id = List.length model.toDos }]), newToDo = ""}
        RemoveToDo id -> {model | toDos = (List.filter (.id >> (/=) id) model.toDos)}



view : Model -> Html Msg
view model =
    div [ css [Css.maxWidth (Css.px 280)] ] --tamanho 280px
        [ Html.Styled.form [onSubmit SubmitToDo] [
            input [type_ "text", value model.newToDo, onInput UpdateNewToDo] []
            , button [type_ "submit"] [text "Submit"]
        ]
        , ul []
            (List.map (\ toDo -> li [] [text toDo.task, button [onClick (RemoveToDo toDo.id)] [text "Feito"]]) model.toDos)
        ]
