# Elm Pages Trial
[![Netlify Status](https://api.netlify.com/api/v1/badges/c4522fc2-8924-417b-954e-d7c20cb4c70f/deploy-status)](https://app.netlify.com/sites/stoic-swartz-035459/deploys)

## Goals
* Understand how it works
  * Change the main post
  * Add a second post
  * embed arbitrary HTML
* Try out `elm-ui`
* ✅ Try out beta deploy
* ✅ Timebox
  * Start at 10:30am -> Review progress at noon
  * Got it to run locally, decent understanding of how it works
  * Need a small example project to take it to the next step of "can I use this"
* Is `elm-pages` a suitable replacement for jekyll?
* Is `elm-pages` a suitable option for personal small projects?


## Tips
* `npm start` == `elm-pages develop`
* `npm run build` == `elm-pages-beta` # AKA prod artifact, this is the new part
* `npm run serve` - host static files from ☝️ without watch


## Using the Beta

```sh
> elm-pages-beta
```

### Why
Templates are a solution to make page types easier
No bundling with webpack because we don't need it.

### How
I cloned DKs repo and checked out his [Template Modules branch](https://github.com/dillonkearns/elm-pages-starter/tree/template-modules)

### Example
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


### Details
* [Beta Changes](https://github.com/dillonkearns/elm-pages/blob/master/docs/7.0.0-elm-package-upgrade-guide.md#2---beta-build-command)
* https://github.com/dillonkearns/elm-pages/issues/151
* [Remove Bundling from build](https://github.com/dillonkearns/elm-pages/issues/148)
* Documentation site: https://elm-pages.com
* [Elm Package docs](https://package.elm-lang.org/packages/dillonkearns/elm-pages/latest/)
* [`elm-pages` blog](https://elm-pages.com/blog)
