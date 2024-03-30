#import "@preview/unify:0.4.3": *
#import "@local/linguify:0.4.0": *
#import "@preview/oxifmt:0.2.0": strfmt

// #import "./title-page.typ": title-page
#import "../../utils/fonts.typ": 宋体, 黑体

#let supportedLanguages = ("zh", "en")

#let __template_db = eval(load_ftl_data("./L10n", supportedLanguages))

#let _objectives(content) = [
  = 实验目的
  #content
]

#let _principles(content) = [
  = 实验原理
  #content
]

#let _equipment(content) = [
  = 实验仪器与设备
  #content
]

#let _procedure(content) = [
  = 实验步骤
  #content
]

#let _data(content) = [
  = 实验数据
  #content
]

#let _analysis(content) = [
  = 结果分析
  #content
]

#let _raw-data(content) = [
  = 原始数据
  #content
]

#let title-page(title: none, subtitle: none, author: none, bottom-text: none) = [
  #v(40pt)
  #align(
    center,
    text(size: 28pt, font: 黑体, weight: "bold")[
      #title
    ],
  )
  #align(
    center,
    text(size: 18pt, font: 黑体)[
      #subtitle
    ],
  )
  #align(
    center,
    text(size: 12pt, font: 黑体)[
      #author
    ],
  )
  #place(
    bottom + center,
    [
      #align(
        center,
        text(size: 12pt, font: 黑体)[
          #bottom-text
        ],
      )
    ],
  )
  #pagebreak(weak: true)
]

#let conf(
  course-name: none,
  exper-name: none,
  exper-date: none,
  handin-date: none,
  week-no: none,
  exper-no: none,
  student-no: none,
  student-name: none,
  faculty: none,
) = {
  let subtitle = [
    #if hw-no != none {
      linguify("exper-ord", args: (exper-no: exper-no), from: __template_db)
    } else if week-no != none {
      linguify("exper-week", args: (week-no: week-no), from: __template_db)
    } else {
      none
    }
  ]
  // Generate title page
  title-page(
    title: course-name,
    subtitle: subtitle,
    author: [
      #{
        if faculty != none [#faculty \ ]
      } #student-no \ #student-name
    ],
    bottom-text: [
      #linguify("exper-date", args: (exper-date: exper-date), from: __template_db) \
      #linguify("handin-date", args: (handin-date: handin-date), from: __template_db)
    ],
  )
  // Set header
  show: chic.with(
    chic-footer(),
    chic-header(left-side: text(course-name, size: 9pt), right-side: text(subtitle, size: 9pt)),
    chic-separator(0.5pt),
    chic-offset(16pt),
    chic-height(64pt),
  )
  // Miscellanous settings
  set math.equation(numbering: "(1)")
  set list(indent: 2em)
  set enum(
    indent: 2em,
    spacing: 2em,
  )
  set par(first-line-indent: 2em)
  set text(
    font: 宋体,
    style: "normal",
    weight: "regular",
  )
  set table(stroke: (thickness: 0.5pt, paint: black))
  set heading(numbering: "1.1.")
}

// #let labreport(
//   course-name: none,
//   exper-name: none,
//   exper-date: none,
//   handin-date: none,
//   week-no: none,
//   exper-no: none,
// ) = {
//   (
//     objectives: none,
//     principles: none,
//     equipment: none,
//     procedure: none,
//     data: none,
//     analysis: none,
//     raw-data: none,
//   ) => [
//     #let order-str = []
//     #if week-no != none {
//       order-str = [第 #week-no 周实验]
//     }
//     #if exper-no != none {
//       order-str = [实验 \# #exper-no]
//     }
//     #let subtitle = [#order-str \ #exper-name]
//     #title-page(
//       title: course-name,
//       subtitle: subtitle,
//       author: [
//         #student-no \ #student-name
//       ],
//       bottom-text: [
//         实验日期: #exper-date \
//         报告日期: #handin-date
//       ],
//     )
//     // #set set-header(
//     //     top-left: [#course-name],
//     //     top-right: [#order-str #exper-name],
//     // )
//     #set page(
//       margin: (top: 6em, bottom: 20pt),
//       header: [
//         #set text(size: 9pt)
//         #course-name
//         #h(1fr) #order-str | #exper-name
//         #v(-0.85em)
//         #line(length: 100%, stroke: (thickness: 0.5pt, paint: black))
//       ],
//     )
//     #set heading(numbering: "1.1 ")
//     #show heading: it => [
//       #set align(center)
//       #let p = {
//         if it.level == 1 {
//           1em
//         } else {
//           0.5em
//         }
//       }
//       #pad(
//         bottom: p,
//         [
//           #counter(heading).display() #it.body
//         ],
//       )
//     ]
//     #set list(indent: 2em)
//     #set enum(
//       indent: 2em,
//       spacing: 2em,
//     )
//     #set enum(
//       numbering: x => {
//         grid(columns: (0em, auto), align: bottom, hide[一], numbering("1.", x))
//       },
//     )
//     #set par(first-line-indent: 2em)
//     #set text(
//       font: 苹方,
//       style: "normal",
//       weight: "regular",
//     )
//     #set table(stroke: (thickness: 0.5pt, paint: black))
//     #if objectives != none {
//       _objectives(objectives)
//     } else []
//     #if principles != none {
//       _principles(principles)
//     } else []
//     #if equipment != none {
//       _equipment(equipment)
//     } else []
//     #if procedure != none {
//       _procedure(procedure)
//     } else []
//     #if data != none {
//       _data(data)
//     } else []
//     #if analysis != none {
//       _analysis(analysis)
//     } else []
//     #if raw-data != none {
//       _raw-data(raw-data)
//     } else []
//   ]
// }
