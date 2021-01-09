module TemplateMetadata exposing (Article, BlogIndex, Page)

import Data.Author
import Date exposing (Date)
import Pages
import Pages.ImagePath exposing (ImagePath)


type alias BlogIndex =
    ()


type alias Article =
    { title : String
    , description : String
    , published : Date
    , author : Data.Author.Author
    , image : ImagePath Pages.PathKey
    , draft : Bool
    }


type alias Page =
    { title : String }
