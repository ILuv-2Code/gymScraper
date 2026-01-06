#let raw_title = "The UConn Recreation Center Usage Trends"

// Sets the metadata on the pdf
#set document(
    title: [#raw_title],
    author: ("Emmet Spaeth", "David Matos"),
    description: [Abstract goes here],
    //keywords: ("informative", "keywords"),
    date: auto
)

#set page(
    paper: "us-letter",

    // Numbering the pages
    header: context [
        #smallcaps[#raw_title]
        #h(1fr)
        #counter(page).display(
            "1",
            //both: true,
        )
    ],
    //numbering: "1",
)

#set heading(numbering: "1.1.")
#set par(justify: true)
#set align(left)

#set text(
    font: "Libertinus Serif",
    style: "normal",
    size: 12pt,
)

// Function to create a title
#let title(main_title: none, subtitle: none) = {
    set text(
        size: 16pt,
        weight: "bold",
    )

    set par(
        justify: false 
    )

    set align(center)

    v(2em)

    if subtitle != none {
        block(main_title + ":")
    } else {
        block(main_title)
    }

    block(subtitle)
    v(1em)
}

// Function to create the abstract
#let abstract(body) = {

    set par(justify: false)
  
    set align(center)

    v(1em)
    // White space above the title
    block(
        height: 0.2em,
        ""
    )

    text(weight: "bold", size: 14pt)[_Abstract_]

    block(
        above: 1.2em,
        body
    )
    v(1em)
}

// =========================================
// ||     The start of the article        ||
// =========================================

// The title
#title(
    main_title: [#raw_title],
    subtitle: "A Student Led Statistical Anlysis"
)

// Authors
#grid(
    columns: (1fr, 1fr),
    align(center)[
        Emmet Spaeth \
        University of Connecticut\
        #link("mailto:emmet.spaeth@uconn.edu")
    ],
    align(center)[
        David Matos \
        University of Connecticut\
        #link("mailto:david.matos@uconn.edu")
    ]
)


// Abstract
#abstract([
    The aim of this paper is to determine trends in the UConn rec center usage.
    This paper will analyze the occupancy of the rec center both over the
    course of a day, broken into fifteen minute increments, and over a week,
    comparing each day. Then, we will to explain the trends in the data.
    Notably, the difference in usage between the days of the week and the
    periods of growth throughout a day. Finally, we will provide our
    explanations of these trends, advice to improve the quality of service and
    potential cost saving measures.
])

#outline()
#pagebreak()

= Introduction

What is the topic and why is it worth studying? – the first major section of
text in the paper, the Introduction commonly describes the topic under
investigation, summarizes or discusses relevant prior research (for related
details, please see the Writing Literature Reviews section of this website),
identifies unresolved issues that the current research will address, and
provides an overview of the research that is to be described in greater detail
in the sections to follow.

= Methods

What did you do? – a section which details how the research was performed. It
typically features a description of the participants/subjects that were
involved, the study design, the materials that were used, and the study
procedure. If there were multiple experiments, then each experiment may require
a separate Methods section. A rule of thumb is that the Methods section should
be sufficiently detailed for another researcher to duplicate your research.

== Data collection

The server, the script we used, how we found the site.

== Data filtering and cleaning

Removing failed pulls, timezone shift, day light savings time, in hours,
weekday vs weekend seperation.

= Results

What did you find? – a section which describes the data that was collected and
the results of any statistical tests that were performed. It may also be
prefaced by a description of the analysis procedure that was used. If there
were multiple experiments, then each experiment may require a separate Results
section.

== Weekly tapering

== Daily growth and stagnation periods

= Conclusion

What is the significance of your results? – the final major section of text in
the paper. The Discussion commonly features a summary of the results that were
obtained in the study, describes how those results address the topic under
investigation and/or the issues that the research was designed to address, and
may expand upon the implications of those findings. Limitations and directions
for future research are also commonly addressed.


== Findings

== Limitations

Problems with data collection, limited analysis (no std dev), don't know the
number on the app is perfect

== Future Research

Check if occupancy goes up with every time a person taps their IDs. Basically,
sit near the entrance to the rec with a counter and see if it matches up.
Interview students for a more qualitative approach/information. More data
points. Compare to commercial gym usage.

