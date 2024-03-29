module Site exposing (canonicalUrl, cloudinaryIcon, config, tagline)

import Cloudinary
import Color
import MimeType
import Pages exposing (images, pages)
import Pages.ImagePath exposing (ImagePath)
import Pages.Manifest as Manifest
import Pages.Manifest.Category
import Pages.PagePath exposing (PagePath)
import Pages.StaticHttp as StaticHttp
import TemplateType exposing (TemplateType)


type alias SiteConfig =
    { canonicalUrl : String
    , manifest : Manifest.Config Pages.PathKey
    }


config : SiteConfig
config =
    { canonicalUrl = canonicalUrl
    , manifest = manifest
    }


type alias StaticData =
    ()


staticData :
    List ( PagePath Pages.PathKey, TemplateType )
    -> StaticHttp.Request StaticData
staticData siteMetadata =
    StaticHttp.succeed ()


canonicalUrl : String
canonicalUrl =
    "https://sham-elm-starter-beta.netlify.app"


manifest : Manifest.Config Pages.PathKey
manifest =
    { backgroundColor = Just Color.white
    , categories = [ Pages.Manifest.Category.education ]
    , displayMode = Manifest.Standalone
    , orientation = Manifest.Portrait
    , description = "aaron-elm-pages-demo - A statically typed site generatored with Elm."
    , iarcRatingId = Nothing
    , name = "Aaron's Landing Page Title"
    , themeColor = Just Color.white
    , startUrl = pages.index
    , shortName = Just "Aaron's Blog"
    , sourceIcon = images.sylverbar
    , icons =
        [ icon webp 192
        , icon webp 512
        , icon MimeType.Png 192
        , icon MimeType.Png 512
        ]
    }


tagline : String
tagline =
    "Such `elm-page`, wow"


webp : MimeType.MimeImage
webp =
    MimeType.OtherImage "webp"


icon :
    MimeType.MimeImage
    -> Int
    -> Manifest.Icon pathKey
icon format width =
    { src = cloudinaryIcon format width
    , sizes = [ ( width, width ) ]
    , mimeType = format |> Just
    , purposes = [ Manifest.IconPurposeAny, Manifest.IconPurposeMaskable ]
    }


cloudinaryIcon :
    MimeType.MimeImage
    -> Int
    -> ImagePath pathKey
cloudinaryIcon mimeType width =
    Cloudinary.urlSquare "v1609635308/simple-ag.png" (Just mimeType) width
