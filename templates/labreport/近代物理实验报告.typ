#let 字号 = (

)

/// Setup the document
/// ### Parameters
/// - `title`: The title of the document
/// - `author`: The author of the document
/// - `authorId`: The author's student ID
/// - `abstract`: The abstract of the document
/// - `keywords`: The keywords of the document
/// ### Usage
/// ```Typst
/// #show: doc => conf(
///   title: "Title",
///   ...
///   doc
/// )
/// ```
#let conf(
  title: none,
  author: none,
  authorId: none,
  abstract: [],
  keywords: (),
  doc
) = {

  set page(
    paper: "a4",
    numbering: "1",
    margin:(
      top:2cm,
      bottom:1.6cm,
      x:2.5cm
    )
  )

  set text(
    font:(
      "Times New Roman",
      "SimSun"
    )
  )

  set par(
    first-line-indent: 2em,
    leading: 2em,
    justify: true
  )
  
  
  set align(center)

  //标题
  text(16pt, font:"SimHei")[
    #strong(title)\
  ]
  
  //作者
  text(14pt, font:"STFangsong")[
    #author\
  ]

  //院系学号
  text(12pt)[
    物理学院 学号：#authorId\
  ]
  
  //摘要和关键词
  set align(left)
  pad(left:2em,right:2em,
    par(
      leading: 1.5em,
    )[
      \
      #h(2em)
      #abstract \ \
      #text(font:"SimHei")[*关键词:*]
      #for keyword in keywords{
        keyword
        [, ]
      }\ 

    ]
  )
  

  set block(spacing: 2em)
  set heading(numbering: "I.1.1.")
  show heading:it =>[
    #set block(spacing: 2em)
    #set par(first-line-indent: 0em)
    #set text(if it.level == 1 {16pt} else {14pt},
    font:"STFangsong")
    #counter(heading).display(it.numbering)
    #it.body
  ]

  set text(12pt)
  doc
}
