# Aaron's Elm-Pages Demo [![Netlify Status](https://api.netlify.com/api/v1/badges/c4522fc2-8924-417b-954e-d7c20cb4c70f/deploy-status)](https://app.netlify.com/sites/sham-elm-starter-beta/deploys) (👈 click me)

## Elm-pages Compelling Features
* Elm type safety plus even more!
* Missing Env variables as compiler warning
* Build time API data as compiler warning
* SEO as compiler warning


## Remaining
* Replace all of the default values with mine to full brand it
  * Document how much time that takes and if it's easy to miss etc (in PR)
  * ✅ Browser title (tiny)
  * ✅ Remove extra blog posts (tiny)
  * ✅ Create landing page (med)
  * ✅ Update header links (small)
  * ✅ Code syntax highlighting (hard - 3hr)
  * Spotify Page
    * ✅ Load Data
    * ✅ Style Data (med - elm-ui, took 2 hours)
    * Write content (big)
      * ✅ First Draft
      * ✅ 2nd Version
      * Get Feedback
      * Final Edit
  * release on github
  * Image in Readme
  * Favicon is missing

## Learnings
* ✅ [Cloudinary for hosting static images](https://cloudinary.com/)
* ✅ `elm-ui` > css
* ✅ Static requests (load API data on deploy vs. real time)

### Questions
* Is `elm-pages` a suitable replacement for jekyll?
  * [compiler + signature > docs example PR](https://github.com/shamshirz/elm-pages-starter-beta/pull/2)
* Would that be worth the effort?
* ✅ Is `elm-pages` a suitable option for personal small projects?
  * > Yes


### If the project continues
* CI - lint, elm-review, elm-test
* Give feedback to Dillon


## Dev Experience
`npm start` == `elm-pages develop`

`npm run build` == `elm-pages-beta` # AKA prod artifact, this is the new part

`npm run serve` - host static files from ☝️ without watch

<details>
  <summary>Development Example for others trying out `elm-pages`</summary>

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
  * discovered in `MarkdownRenderer.elm` you can add custom tags and then it basically gets built like react with uppercase tags
  * `<BOX>` example and [this article on the elm markdown rendered](https://elm-pages.com/blog/extensible-markdown-parsing-in-elm)
</details>


## Resources
* [Beta Changes](https://github.com/dillonkearns/elm-pages/blob/master/docs/7.0.0-elm-package-upgrade-guide.md#2---beta-build-command)
* https://github.com/dillonkearns/elm-pages/issues/151
* [Remove Bundling from build](https://github.com/dillonkearns/elm-pages/issues/148)
* Documentation site: https://elm-pages.com
* [Elm Package docs](https://package.elm-lang.org/packages/dillonkearns/elm-pages/latest/)
* [`elm-pages` blog](https://elm-pages.com/blog)
