// Waitig for custom element function

#let set-header(top-left: none, top-right: none, body) = {
    page(
        margin: (top: 32pt, bottom: 20pt),
        header: [
            #set text(8pt)
            #top-left
            #h(1fr) #top-right
        ],
        body
    )
}