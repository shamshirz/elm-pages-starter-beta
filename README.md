# Notes to self

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


### Details
* https://github.com/dillonkearns/elm-pages/blob/master/docs/7.0.0-elm-package-upgrade-guide.md
* https://github.com/dillonkearns/elm-pages/issues/151
* [Remove Bundling from build](https://github.com/dillonkearns/elm-pages/issues/148)



# elm-pages-starter

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/dillonkearns/elm-pages-starter)

This is an example repo to get you up and running with `elm-pages`.

The entrypoint file is `index.js`. That file imports `src/Main.elm`. The `content` folder is turned into your static pages. The rest is mostly determined by logic in the Elm code! Learn more with the resources below.

## Setup Instructions
Click "Use this template" on this Github page to fork the repo.

Or git clone it:

```
git clone git@github.com:dillonkearns/elm-pages-starter.git
```

Then install and run the dev server

```
cd elm-pages-starter
npm install
npm start # starts a local dev server using `elm-pages develop`
```

From there you can tweak the `content` folder or change the `src/Main.elm` file.


## Learn more about `elm-pages`

- Documentation site: https://elm-pages.com
- [Elm Package docs](https://package.elm-lang.org/packages/dillonkearns/elm-pages/latest/)
- [`elm-pages` blog](https://elm-pages.com/blog)
