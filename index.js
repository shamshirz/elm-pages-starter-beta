/* This is used by the `elm-pages develop` command - not `elm-pages-beta`
   It uses the same styles, imported here because the develop command uses webpack
   The beta build does not use webpack, so it's setup a bit differently
*/
import "./beta-style.css";
// @ts-ignore
const { Elm } = require("./src/Main.elm");
const pagesInit = require("elm-pages");

pagesInit({
  mainElmModule: Elm.Main
});
