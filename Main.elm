module Main exposing (..)
import Html exposing (..)
import Http
import Json.Decode as Decode exposing (field)
import Html.Events exposing (onClick)


-- MAIN
main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }


-- MODEL


type alias Email =
  { email : String
  }

type alias Model =
  List Email

type Msg
  = LoadEmails
  | LoadedEmails (Result Http.Error (List Email))



-- INIT


init : (Model, Cmd Msg)
init =
  ([], loadEmails)

loadEmails : Cmd Msg
loadEmails =
  Http.send LoadedEmails
    (Http.get "https://raw.githubusercontent.com/Brian11f/List-Emails-with-Elm/master/ListOfEmails.json" decodeEmailList)
decodeEmail : Decode.Decoder Email
decodeEmail =
    Decode.map Email
        (field "email" Decode.string)
decodeEmailList : Decode.Decoder (List Email)
decodeEmailList =
    Decode.list decodeEmail


-- UPDATE


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    LoadEmails ->
      (model, loadEmails)
    LoadedEmails (Ok emails) ->
      (emails, Cmd.none)
    LoadedEmails (Err _) ->
      (model, Cmd.none)


-- VIEW


view : Model -> Html Msg
view model =
  let
    result =
      if ((List.isEmpty model)) then
        div [][ text "Currently no  emails." ]
      else
        div [] (List.map  emailRow model)
  in
    div []
      [ h1 [] [ text "Emails" ]
      , result
      ]

emailRow : Email -> Html Msg
emailRow email =
  div [] [ text email.email ]


  -- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
