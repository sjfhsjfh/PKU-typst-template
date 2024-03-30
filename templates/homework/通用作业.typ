#import "../../utils/fonts.typ": 黑体, 苹方
#import "../../utils/header.typ": set-header

#import "@preview/chic-hdr:0.4.0": *
#import "@local/linguify:0.4.0": *

#let supportedLanguages = (
  "zh",
  "en",
)

#let __template_db = eval(load_ftl_data("./L10n", supportedLanguages))

#let language = "zh"

#let title-page(title: none, subtitle: none, author: none) = [
    #v(40pt)
    #align(center, text(
        size: 28pt,
        font: 黑体,
        weight: "bold",
    )[
        #title
    ])
    #align(center, text(
        size: 18pt,
        font: 黑体,
    )[
        #subtitle
    ])
    #align(center, text(
        size: 12pt,
        font: 黑体,
    )[
        #author
    ])
    #pagebreak(weak: true)
]

#let problem(problem-title) = [
  = #problem-title
  #counter(math.equation).update(0)
]

#let solution = [
  == #text(linguify("solution", from: __template_db))
  #counter(math.equation).update(0)
]


#let conf(
  course-name: none,
  week-no: none,
  hw-no: none,
  student-no: none,
  faculty: none,
  student-name: none,
  doc
) = {
  let subtitle = [
    #if hw-no != none {
      linguify("homework-ord", args: (hw-no: hw-no), from: __template_db)
    } else if week-no != none {
      linguify("homework-week", args: (week-no: week-no), from: __template_db)
    } else {
      none
    }
  ]
  // Generate title page
  title-page(
    title: course-name,
    subtitle: subtitle,
    author: [
      #{if faculty != none [#faculty \ ]} #student-no \ #student-name
    ]
  )
  // Set header
  show: chic.with(
    chic-footer(),
    chic-header(
      left-side: text(course-name, size: 9pt),
      right-side: text(subtitle, size: 9pt),
    ),
    chic-separator(0.5pt),
    chic-offset(16pt),
    chic-height(64pt)
  )
  // Miscellanous settings
  set math.equation(numbering: "(1)")
  set list(indent: 2em)
  set enum(indent: 2em, spacing: 2em)
  set par(first-line-indent: 2em)
  set text(font: 苹方, style: "normal", weight: "regular")
  set table(stroke: (thickness: 0.5pt, paint: black))
  set heading(numbering: "1.1.")
  // show heading: (it) => [
  //   // #set align(center)
  //   #let p = {
  //     if it.level == 1 {
  //       1em
  //     } else {
  //       0.5em
  //     }
  //   }
  //   #pad(
  //     bottom: p,
  //     [
  //       // #counter(heading).display() #it.body
  //       #it.body
  //     ]
  //   )
  // ]
  doc
}
