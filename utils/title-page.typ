#let title-page(title: none, subtitle: none, author: none, bottom-text: none) = [
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
    #place(
        bottom + center,
        [
            #align(center, text(
                size: 12pt,
                font: 黑体,
            )[
                #bottom-text
            ])
        ]
    )
    #pagebreak(weak: true)
]