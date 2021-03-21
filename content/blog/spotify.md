---
type: all-elm
author: "Aaron Votre"
title: Using the Spotify API at build time
description: Using elm-pages to make dynamic data a compile-time constraint
image: v1616336071/Spotify_Logo_CMYK_Green_zilonk.png
published: "2021-03-21"
---

This blog post demonstrates a few cool pieces of tech that I wanted to experiment with and builds off of a project originally posted on [the SylverStudios website](https://sylverstudios.dev/blog/2020/01/25/my-favorite-artists.html) about sharing a summary of your listening history from the Spotify API in a blog post. There was a fun revamp using Netlify, and now another one to explore [`elm-pages`](https://github.com/dillonkearns/elm-pages) (A static site generator that allows the author to write elm and markdown together).

The most exciting piece of this project is being able to use the elm compiler to guide the creation of your static site. My experience with Jekyll was pretty annoying as I was continually looking up documentation and blog posts to try and understand what was going on. Also I had to constantly view the page to manually verify things were working, without any feedback when they weren't working as expected. Elm-pages is able to pull a ton of that logic into the type system and as a result the compiler can explain what it's expecting and what you're missing!

A great example of this is that elm-pages identifies your local images and compiles functions to access them. So if you use the function `Images.author.aaron` and there isn't an image file there, the compiler will tell you exactly that.

```
Compiling ...-- PROBLEM IN RECORD
> , avatar = Pages.images.author.aaron (does not have aaron field)
```

I found the dev experience to be really enjoyable, disclaimer - I write elm frequently.

The other big change I wanted to test was using elm-pages' `StaticData` pattern. This is a type for running your API calls at build time and storing them as local JSON so your pages can be build with "dynamic" data and still produce a static page! The Spotify data above was collected in the build environment, stored as part of the project, and the page can dynamically read from it. If I ever want to refresh that data, all I have to do is rebuild the project. Appearantly this isn't new for the Netlify community and they have their own tools for exactly this.

