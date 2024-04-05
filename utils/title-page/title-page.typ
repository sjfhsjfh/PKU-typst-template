#import "@preview/linguify:0.4.0": *

#let supported_languages = ("zh", "en")

#let __title-page-i18n = eval(load_ftl_data("./L10n", supported_languages))

/// Stretch function
/// Parameters:
/// - c (`str`): The text to be spaced
#let stretch(c) = if type(c) == str {
  stack(dir: ltr, spacing: 1fr, ..c.clusters())
} else if c.func() == text {
  stack(dir: ltr, spacing: 1fr, ..c.text.clusters())
} else {
  show regex(".{2,}"): stretch
  c
}

/// Proplist function
#let proplist(props, separator: ":") = [
  #let field_val(val) = [
    #set align(center + horizon)
    #set text(
      font: "STFangsong",
      weight: "bold",
    )
    #grid(rows: (auto, auto), row-gutter: 0.2em, [#val], line(length: 100%))
  ]
  #let l = ()
  #for item in props {
    l.push(
      grid(columns: (4em, auto, 8em), row-gutter: 1fr, [#stretch(item.at(0))], [#separator], [#field_val(item.at(1))]),
    )
  }
  #align(center)[
    #set text(size: 14pt)
    #stack(dir: ttb, spacing: 1fr, ..l)
    // #v(1fr)
  ]
]

/// Generate a title page
///
/// - `title`: The title of the document
/// - `subtitle`: The subtitle of the document
/// - `author`: The author of the document
/// - `logo`: Whether to include the logo in the title page
#let title-page(
  title: none,
  subtitle: none,
  name: none,
  student-no: none,
  faculty: none,
  time: none,
  logo: false,
  extra-items: (),
) = {
  context page(paper: "a4")[
    #v(2.5%)
    #align(
      center,
      grid(
        align: center + horizon,
        columns: (auto, auto),
        column-gutter: 2%,
        image("../school-logo.svg", height: 10%),
        image("../school-text.svg", height: 6%),
      ),
    )
    #align(center)[#text(title, size: 32pt, font: ("Bodoni", "Source Han Serif"))]
    #align(center)[#text(subtitle, size: 24pt, font: ("Bodoni", "Source Han Serif"))]
    
    #v(12%)
    
    #let items = ()
    #if name != none {
      items.push((linguify("name", from: __title-page-i18n), name))
    }
    #if student-no != none {
      items.push((linguify("student-no", from: __title-page-i18n), student-no))
    }
    #if faculty != none {
      items.push((linguify("faculty", from: __title-page-i18n), faculty))
    }
    #let items = (..items, ..extra-items)
    #align(center)[
      #box(height: 30%)[
        #proplist(items, separator: "：")
      ]
    ]
    
    #v(10%)
    
    #align(center)[
      #set text(
        size: 16pt,
        font: ("Bodoni", "Source Han Serif"),
      )
      #time
    ]
  ]
}