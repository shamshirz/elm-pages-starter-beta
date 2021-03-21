module Template.Page exposing (Model, Msg, template)

import Cloudinary
import Element exposing (Element, mouseDown, mouseOver, padding, text)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
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
        , siteName = "elm-pages-starter"
        , image =
            { url = cloudinaryIcon
            , alt = "elm-pages logo"
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
        [ rendered
        , Element.column [ Element.padding 20, Element.centerX ] [ Index.view allMetadata ]
        ]
    }


cloudinaryIcon : ImagePath pathKey
cloudinaryIcon =
    Cloudinary.urlRectangular "v1603234028/elm-pages/elm-pages-icon" (Just MimeType.Png) ( 300, 157 )
