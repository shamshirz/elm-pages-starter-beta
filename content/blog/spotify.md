---
type: all-elm
author: "Aaron Votre"
title: Calling Spotify at build time
description: Using elm-pages to make dynamic data a compile-time constraint
image: v1616336071/Spotify_Logo_CMYK_Green_zilonk.png
published: "2021-03-30"
---

👆 See this code in Github - [Shamshirz](https://github.com/shamshirz/elm-pages-starter-beta/blob/main/src/Spotify.elm)

When writing this page [on the SylverStudios website](https://sylverstudios.dev/blog/2020/01/25/my-favorite-artists.html) in Jekyll, the API data was wrapped in a Lambda in order to be called on every page view. `elm-pages` gives us a compelling alternative - request the data during build and store the result as a static asset along with the html. This changes a dynamic API call that requires deployed infrastructure into a truly static site. The part that blows my mind is the API call is strongly typed and compilation can require success before building!

## `StaticData`
Above, the Spotify artists listed are my most frequently listened to and that data was collected from Spotify during compilation. During compilation, a request goes out to Spotify to collect that data and it's stored in `/dist`, then read when building the page content as a static file rather than dynamic data. A bonus effect is that the only service that needs permission to access that data is CI when the site is being built rather than a public lambda that needs to only allow requests from a particular domain.

The author of `elm-pages`, [Dillon Kearns](https://github.com/dillonkearns), wrote a great intro to getting build time API data into your site in this Blog post - [Static Http Data post](https://elm-pages.com/blog/static-http).

## Everything is checkable with the compiler
With the API call happening during build, this gives us access to really nice compiler messaging around what's going wrong. Our API code requires environment variables and the compiler will give helpful information if something has gone wrong.

![Token env variable missing message](images/env-var-missing.png)

