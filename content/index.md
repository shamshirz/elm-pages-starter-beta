---
title: Elm Pages Demo
type: page
---

# Why Elm-pages

The main objective was to compare it to the [Jekyll](https://jekyllrb.com/docs/github-pages/) experience and define for future blog ideas what would be the default answer. In that pursuit, **[`elm-pages`](https://github.com/dillonkearns/elm-pages) would be fantastic for small and simple static websites.** It was a pleasure to use and significantly easier than getting started with Jekyll, where the only path to success involved a lot of magic and copy-paste. For larger sites, or sites needing a more complex interaction between their markdown and the rest of the code, `elm-pages` didn't seem particularly suitable. Example, [the Sylver Studios Blog](https://sylverstudios.dev/) has a lot of pages that are glorified wrappers around embedded Unity apps, and frequently embed JS between lines of markdown. There wasn't an obvious, "easy" solution for that type of behavior within `elm-pages`.

## Compiler as a Guide

The most compelling element of `elm-pages` is the compiler support. The compiler clearly points out problems, describes the type mismatch, and even gives suggestions for what you may have meant. **The compiler guides elm code and static content like front matter and local assets.** Here's an example of fixing Front matter which always seemed like a debug nightmare in Jekyll.

```YAML
---
type: my-article
published: "2021-03-21-typo"
---
```

This typo above could be on any field in your front matter. This isn't elm code, it's part of your markdown and it's still compile time checked and supports the brilliant error messaging that you love to see.

```
I ran into a problem when parsing the metadata for the page with this path: /blog/new-article

Problem with the value at json.published:

    "2021-03-21-typo"

Expected a date only
```

## elm-ui
[elm-ui](https://github.com/mdgriffith/elm-ui) is the default tool for turning Elm into viewable Html and Css. As a first experience, it was excellent. There are great resources out there and here is a snippet of some code that would've needed some css `flex` work, but instead was dead simple.

```elm
artistInformation : Artist -> Element msg
artistInformation { genre, name } =
    Element.column []
        [ Element.el [ Font.bold, Font.size 16] (Element.text name)
        , Element.el [ Font.color white, Font.size 14] (Element.text genre)
        ]
```
![Styled Artist Name and Genre](images/artist-info-text.png)
