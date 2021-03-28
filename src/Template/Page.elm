module Template.Page exposing (Model, Msg, template)

import Cloudinary
import Element exposing (Element, mouseDown, mouseOver, padding, text)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Element.Region
import Head
import Head.Seo as Seo
import Index
import MimeType
import Pages
import Pages.ImagePath exposing (ImagePath)
import Pages.PagePath exposing (PagePath)
import Palette
import Shared
import Site
import Template exposing (StaticPayload, Template)
import TemplateMetadata exposing (Page)
import TemplateType exposing (TemplateType)


type alias Model =
    ()


type alias Msg =
    Never


type alias StaticData =
    ()


template : Template Page StaticData
template =
    Template.noStaticData { head = head }
        |> Template.buildNoState { view = view }


head :
    StaticPayload Page StaticData
    -> List (Head.Tag Pages.PathKey)
head { metadata } =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Aaron's elm-page Blog"
        , image =
            { url = cloudinaryIcon
            , alt = "sylver studios icon"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = Site.tagline
        , locale = Nothing
        , title = metadata.title
        }
        |> Seo.website


view :
    List ( PagePath Pages.PathKey, TemplateType )
    -> StaticPayload Page StaticData
    -> Shared.RenderedBody
    -> Shared.PageView Never
view allMetadata static rendered =
    { title = static.metadata.title
    , body =
        [ Element.column [ Element.width Element.fill ]
            [ Element.column
                [ Element.padding 30
                , Element.spacing 40
                , Element.Region.mainContent
                , Element.width (Element.fill |> Element.maximum 800)
                , Element.centerX
                ]
                (rendered ++ [ Element.column [ Element.padding 20, Element.centerX ] [ Index.view allMetadata ] ])
            ]
        ]
            |> List.map (Element.map never)
    }


cloudinaryIcon : ImagePath pathKey
cloudinaryIcon =
    Cloudinary.urlSquare "v1609635308/simple-ag.png" (Just MimeType.Png) 150
