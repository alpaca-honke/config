#import "@preview/js:0.1.3": *

#show: js.with(
  lang: "ja",
  seriffont-cjk: "Hiragino Mincho ProN",
  sansfont: "Source Sans 3",
  sansfont-cjk: "Hiragino Kaku Gothic ProN",
  paper: "a4",
  fontsize: 10pt,
  baselineskip: auto,
  textwidth: auto,
  lines-per-page: auto,
  book: false,
  cols: 1,
  non-cjk: regex("\u0000-\u2023"),
  cjkheight: 0.88,
)
