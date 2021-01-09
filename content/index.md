---
title: The new aaronvotre.com?
type: page
---

With `elm-pages`, we can have different elm view code per type of page.
Then, the markdown is rendered within the body of the page.


## How can we make custom elm UI?
I don't think there is an easy way to embed it here, but I can easy tag it before or after the markdown
See above 👆

## How can I embed an `Element msg` within the Markdown
The demo site looks like Dillon make a custom renderer to accept custom HTML tags, example

```markdown
this is a paragraph
<div>html is valid markdown</div>
<CUSTOM param="x">and now this element can call to some elm code</CUSTOM>
```

## I want to embed arbitrary html into the markdown, how?
html is valid markdown, but I want to embed basically an entire unity app. What will happen?
Let's find out!
<!--
<ul>
  <li>A</li>
  <li>B</li>
</ul>
 -->

Experiment did not work