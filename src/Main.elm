module Main exposing (main)

import Element exposing (Element)
import Feed
import Head
import Html exposing (Html)
import Json.Decode
import Markdown.Parser
import Markdown.Renderer
import MarkdownRenderer
import MimeType
import MySitemap
import Pages
import Pages.PagePath exposing (PagePath)
import Pages.Platform
import Pages.StaticHttp as StaticHttp
import Shared
import Site
import TemplateModulesBeta
import TemplateType exposing (TemplateType)


main : Pages.Platform.Program TemplateModulesBeta.Model TemplateModulesBeta.Msg TemplateType Shared.RenderedBody Pages.PathKey
main =
    TemplateModulesBeta.mainTemplate
        { documents = [ markdownDocument ]
        , site = Site.config
        }
        |> Pages.Platform.withFileGenerator generateFiles
        |> Pages.Platform.withGlobalHeadTags
            [ Head.appleTouchIcon (Just 180) (Site.cloudinaryIcon MimeType.Png 180)
            , Head.appleTouchIcon (Just 192) (Site.cloudinaryIcon MimeType.Png 192)
            , Head.icon [ ( 32, 32 ) ] MimeType.Png (Site.cloudinaryIcon MimeType.Png 32)
            , Head.icon [ ( 16, 16 ) ] MimeType.Png (Site.cloudinaryIcon MimeType.Png 16)
            , Head.rssLink "/blog/feed.xml"
            , Head.sitemapLink "/sitemap.xml"
            ]
        |> Pages.Platform.toProgram


generateFiles :
    List
        { path : PagePath Pages.PathKey
        , frontmatter : TemplateType
        , body : String
        }
    ->
        StaticHttp.Request
            (List
                (Result String
                    { path : List String
                    , content : String
                    }
                )
            )
generateFiles siteMetadata =
    StaticHttp.succeed
        [ Feed.fileToGenerate { siteTagline = Site.tagline, siteUrl = Site.canonicalUrl } siteMetadata |> Ok
        , MySitemap.build { siteUrl = Site.canonicalUrl } siteMetadata |> Ok
        ]


markdownDocument : { extension : String, metadata : Json.Decode.Decoder TemplateType, body : String -> Result String (List (Element msg)) }
markdownDocument =
    { extension = "md"
    , metadata = TemplateType.decoder
    , body = MarkdownRenderer.view
    }


commonHeadTags : List (Head.Tag Pages.PathKey)
commonHeadTags =
    [ Head.rssLink "/blog/feed.xml"
    , Head.sitemapLink "/sitemap.xml"
    ]
