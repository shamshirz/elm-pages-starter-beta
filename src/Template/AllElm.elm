module Template.AllElm exposing (Model, Msg, template)

import Data.Author as Author
import Date exposing (Date)
import Element exposing (Element, mouseDown, mouseOver, padding, text)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Head
import Index
import Pages
import Pages.ImagePath as ImagePath exposing (ImagePath)
import Pages.PagePath exposing (PagePath)
import Palette
import Platform.Sub
import Shared
import Spotify
import Template exposing (StaticPayload, Template, TemplateWithState)
import TemplateMetadata exposing (AllElm, BlogIndex)
import TemplateType exposing (TemplateType)


type alias Model =
    Int


type Msg
    = Dec
    | Inc


type alias StaticData =
    String


update : TemplateMetadata.AllElm -> Msg -> Model -> ( Model, Cmd Msg )
update meta msg model =
    case msg of
        Dec ->
            ( model - 1, Cmd.none )

        Inc ->
            ( model + 1, Cmd.none )


template : TemplateWithState AllElm StaticData Model Msg
template =
    Template.withStaticData { head = head, staticData = \_ -> Spotify.spotifyData }
        |> Template.buildWithLocalState
            { init = always ( 4, Cmd.none )
            , update = update
            , subscriptions = \meta key model -> Platform.Sub.none

            -- , subscriptions : templateMetadata -> PagePath Pages.PathKey -> templateModel -> Sub templateMsg
            , view = view
            }


head :
    StaticPayload AllElm StaticData
    -> List (Head.Tag Pages.PathKey)
head { metadata } =
    []


view :
    Int
    -> List ( PagePath Pages.PathKey, TemplateType )
    -> StaticPayload AllElm StaticData
    -> Shared.RenderedBody
    -> Shared.PageView Msg
view model allMetadata static _ =
    { title = static.metadata.title
    , body =
        [ Element.column [ Element.spacing 10 ]
            [ Element.row [ Element.spacing 10 ]
                [ Author.view [] static.metadata.author
                , Element.column [ Element.spacing 10, Element.width Element.fill ]
                    [ Element.paragraph [ Font.bold, Font.size 24 ]
                        [ Element.text static.metadata.author.name
                        ]
                    , Element.paragraph [ Font.size 16 ]
                        [ Element.text static.metadata.author.bio ]
                    ]
                ]
            ]
        , publishedDateView static.metadata |> Element.el [ Font.size 16, Font.color (Element.rgba255 0 0 0 0.6) ]
        , Palette.blogHeading static.metadata.title
        , articleImageView static.metadata.image
        , incrementButton
        , Element.text (String.fromInt model)
        , decrementButton
        , Element.text static.static
        ]
    }


publishedDateView : { a | published : Date } -> Element msg
publishedDateView metadata =
    Element.text
        (metadata.published
            |> Date.format "MMMM ddd, yyyy"
        )


articleImageView : ImagePath Pages.PathKey -> Element msg
articleImageView articleImage =
    Element.image [ Element.width Element.fill ]
        { src = ImagePath.toString articleImage
        , description = "Article cover photo"
        }


incrementButton : Element Msg
incrementButton =
    Input.button
        [ padding 10
        , Border.width 3
        , Border.rounded 6
        , Border.color Palette.color.primary
        , Background.color Palette.color.primary
        , Font.variant Font.smallCaps

        -- The order of mouseDown/mouseOver can be significant when changing
        -- the same attribute in both
        , mouseDown
            [ Background.color Palette.color.primary
            , Border.color Palette.color.primary
            , Font.color Palette.color.primary
            ]
        , mouseOver
            [ Background.color Palette.color.primary
            , Border.color Palette.color.primary
            ]
        ]
        { onPress = Just Inc, label = text "+" }


decrementButton : Element Msg
decrementButton =
    Input.button
        [ padding 10
        , Border.width 3
        , Border.rounded 6
        , Border.color Palette.color.primary
        , Background.color Palette.color.primary
        , Font.variant Font.smallCaps

        -- The order of mouseDown/mouseOver can be significant when changing
        -- the same attribute in both
        , mouseDown
            [ Background.color Palette.color.primary
            , Border.color Palette.color.primary
            , Font.color Palette.color.primary
            ]
        , mouseOver
            [ Background.color Palette.color.primary
            , Border.color Palette.color.primary
            ]
        ]
        { onPress = Just Dec, label = text "-" }
