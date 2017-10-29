import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Json.Decode exposing (field)


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = always Sub.none
    }


-- MODEL


type alias Model =
  { emails : List String
  }


init =
  ( Model
  , getEmailList
  )



-- UPDATE


type Msg
    = GetEmails
    -- | Res (Result Http.Error String)

update msg model =
    case msg of
      GetEmails ->
          (model, getEmailList)

      -- Res (Ok newUrl) ->
      --     (Model model.emails, Cmd.none)
      --
      -- Res (Err _) ->
      --     (model, Cmd.none)


-- VIEW


view model =
    div [ class "content" ]
        [ viewHeader
        , ul [ class "results" ] ( List.map viewEmailResult model.emails )
        ]


viewHeader =
    header []
        [ h1 [] [ text "Email Test" ]
        , span [ class "tagline" ] [ text "Http test and list filtering in Elm" ]
        ]


viewEmailResult email =
    li []
        [ p [] [ text email ]
        ]


-- HTTP


getEmailList =
    let
      url =
        "https://gist.githubusercontent.com/Brian11f/76832748487900aff1bc833719302072/raw/f32c7a440db1e5e38e9dfa732fc47ec8879f8eba/emails"
    in
      Http.get url decodeEmailUrl


type alias Emails =
    { emails : List String
    }


decodeEmailUrl =
    Json.Decode.map Emails
        (field "emails" Json.Decode.string)
