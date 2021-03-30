module Template.AllElm exposing (Model, Msg, template)

import Data.Author as Author
import Date exposing (Date)
import Element exposing (Attribute, Element, mouseDown, mouseOver, padding, text)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Element.Region
import Head
import Pages
import Pages.ImagePath as ImagePath exposing (ImagePath)
import Pages.PagePath exposing (PagePath)
import Palette
import Platform.Sub
import Shared
import Spotify exposing (Artist)
import Template exposing (StaticPayload, TemplateWithState)
import TemplateMetadata exposing (AllElm)
import TemplateType exposing (TemplateType)


type alias Model =
    Int


type Msg
    = Dec
    | Inc
    | NoOp


type alias StaticData =
    List Artist


update : TemplateMetadata.AllElm -> Msg -> Model -> ( Model, Cmd Msg )
update meta msg model =
    case msg of
        Dec ->
            ( model - 1, Cmd.none )

        Inc ->
            ( model + 1, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


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
view model allMetadata static rendered =
    let
        renderedBody : List (Element Msg)
        renderedBody =
            rendered |> wrap |> List.map (Element.map (always NoOp))

        counterView : List (Element Msg)
        counterView =
            [ stateSection model ]

        headerView : List (Element Msg)
        headerView =
            [ Author.view [] static.metadata.author
            , Element.column [ Element.spacing 10, Element.width Element.fill ]
                [ Element.paragraph [ Font.bold, Font.size 24 ]
                    [ Element.text static.metadata.author.name
                    ]
                , Element.paragraph [ Font.size 16 ]
                    [ Element.text static.metadata.author.bio ]
                ]
            , publishedDateView static.metadata |> Element.el [ Font.size 16, Font.color (Element.rgba255 0 0 0 0.6) ]
            , Palette.blogHeading static.metadata.title
            , articleImageView static.metadata.image
            ]
                |> List.map (Element.map (always NoOp))
    in
    { title = static.metadata.title
    , body =
        [ Element.column [ Element.spacing 10 ]
            (headerView ++ (artistsView static.static :: renderedBody) ++ counterView)
        ]
    }


wrap : List (Element msg) -> List (Element msg)
wrap rendered =
    [ Element.column [ Element.width Element.fill ]
        [ Element.column
            [ Element.padding 30
            , Element.spacing 40
            , Element.Region.mainContent
            , Element.width (Element.fill |> Element.maximum 800)
            , Element.centerX
            ]
            rendered
        ]
    ]


artistsView : List Artist -> Element msg
artistsView artists =
    let
        spotifyGreen : Element.Color
        spotifyGreen =
            Element.fromRgb255
                { red = 29
                , green = 185
                , blue = 84
                , alpha = 1.0
                }

        white : Element.Color
        white =
            Element.fromRgb255
                { red = 255
                , green = 255
                , blue = 255
                , alpha = 1.0
                }

        spotifyFonts : Attribute msg
        spotifyFonts =
            Font.family
                [ Font.typeface "spotify-circular"
                , Font.typeface " spotify-circular-cyrillic"
                , Font.typeface " spotify-circular-arabic"
                , Font.typeface " spotify-circular-hebrew"
                , Font.typeface " Helvetica Neue"
                , Font.typeface " Helvetica"
                , Font.typeface " Arial"
                , Font.typeface " Hiragino Kaku Gothic Pro"
                , Font.typeface " Meiryo"
                , Font.typeface " MS Gothic"
                , Font.typeface " sans-serif;"
                ]

        nameStyle =
            [ Font.bold
            , spotifyFonts
            , Font.size 16
            ]

        genreStyle =
            [ Font.color white
            , spotifyFonts
            , Font.size 14
            ]

        spotifySectionStyle : List (Attribute msg)
        spotifySectionStyle =
            [ Background.color spotifyGreen
            , Element.padding 20
            , Border.roundEach
                { topLeft = 15
                , topRight = 50
                , bottomLeft = 50
                , bottomRight = 15
                }
            , Element.width Element.fill
            , Element.spaceEvenly
            ]

        artistColumn : Artist -> Element msg
        artistColumn { genres, name } =
            Element.column []
                [ Element.el nameStyle (Element.text name)
                , Element.el genreStyle (Element.text (genres |> List.head |> Maybe.withDefault ""))
                ]
    in
    Element.row spotifySectionStyle (List.map artistColumn artists)


publishedDateView : { a | published : Date } -> Element msg
publishedDateView metadata =
    Element.text (Date.format "MMMM ddd, yyyy" metadata.published)


articleImageView : ImagePath Pages.PathKey -> Element msg
articleImageView articleImage =
    Element.image [ Element.width Element.fill, Element.paddingXY 125 0 ]
        { src = ImagePath.toString articleImage
        , description = "Spotify Logo cover image"
        }


stateSection : Int -> Element Msg
stateSection value =
    Element.column [ Element.centerX ]
        [ Element.el [] (Element.text "🎉 Bonus Demo: We can even have internal state 🎉")
        , Element.row [ Element.centerX, Element.spacing 10 ]
            [ incrementButton
            , Element.text (String.fromInt value)
            , decrementButton
            ]
        ]


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
