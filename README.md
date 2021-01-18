# Elm Pages Trial
[![Netlify Status](https://api.netlify.com/api/v1/badges/c4522fc2-8924-417b-954e-d7c20cb4c70f/deploy-status)](https://app.netlify.com/sites/stoic-swartz-035459/deploys)

## Goals
* ✅ Understand the basics
* ✅ Try out beta deploy
* ✅ Timebox
* ✅ Try out [Cloudinary for hosting images](https://cloudinary.com/)
* ✅ Beta build features making sense
* ✅ Try out `elm-ui`
* ✅ embed arbitrary HTML
  * 1. A page type can be any elm that renders (or not) the markdown of the matching content page
  * 2. The markdown rendered can be extended to accept custom HTML tags
* ✅ Try out beta template types
* Can I embed arbitrary JS within the page (bundled unity)
* Test static requests (load Spotify data on deploy vs. real time)

### Questions
* Is `elm-pages` a suitable replacement for jekyll?
* Would that be worth the effort?
* ✅ Is `elm-pages` a suitable option for personal small projects?
 * > Yes


### If the project continues
* CI - lint, elm-review, elm-test
* Give feedback to Dillon


## Tips
* `npm start` == `elm-pages develop`
* `npm run build` == `elm-pages-beta` # AKA prod artifact, this is the new part
* `npm run serve` - host static files from ☝️ without watch

### How
I cloned DKs repo and checked out his [Template Modules branch](https://github.com/dillonkearns/elm-pages-starter/tree/template-modules)

### Getting Started Example
Started a new page `test.md` and followed the compiler

* frontmatter error on `published: "2020-12-30"` needed quotes around date
* author needed, add
  * > Problem with the value at json.author: "Aaron Votre"
* author image doesn't exist
  * > , avatar = Pages.images.author.aaron (does not have aaron field)
  * Slightly harder to find because that file is generated from the `image/X` directory
* built, but my page stinks
* Wondering how to add custom things inline
  * example - inject a bit of elm defined UI into my markdown
  * disovered in `MarkdownRenderer.elm` you can add custom tags and then it basically gets built like react with uppercase tags
  * `<BOX>` example and [this article on the elm markdown rendered](https://elm-pages.com/blog/extensible-markdown-parsing-in-elm)


### Resources
* [Beta Changes](https://github.com/dillonkearns/elm-pages/blob/master/docs/7.0.0-elm-package-upgrade-guide.md#2---beta-build-command)
* https://github.com/dillonkearns/elm-pages/issues/151
* [Remove Bundling from build](https://github.com/dillonkearns/elm-pages/issues/148)
* Documentation site: https://elm-pages.com
* [Elm Package docs](https://package.elm-lang.org/packages/dillonkearns/elm-pages/latest/)
* [`elm-pages` blog](https://elm-pages.com/blog)
