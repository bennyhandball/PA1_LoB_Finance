#let titlepage(
  authors,
  date,
  heading-font,
  language,
  left-logo-height,
  logo-left,
  logo-right,
  many-authors,
  right-logo-height,
  supervisor,
  title,
  type-of-degree,
  type-of-degree-specification,
  type-of-thesis,
  time-of-thesis,
  university,
  university-location,
  at-university,
  date-format,
  show-confidentiality-statement,
  confidentiality-marker,
) = {
  if (many-authors) {
    v(-1.5em)
  } else {
    v(-1em)
  }

  // logos (optional)
  stack(dir: ltr,
    spacing: 1fr,
   // Logo at top left if given
    align(horizon,
      if logo-left != none {
        set image(height: left-logo-height)
        logo-left
      }
    ),

    // Logo at top right if given
    align(horizon,
      if logo-right != none {
        set image(height: right-logo-height)
        logo-right
      }
    )
  )
  v(-3em)
  
  if (many-authors) {
    v(1fr)
  } else {
    v(1.5fr)
  }
   // university
  align(center, text(1.5em, 
  [#university \ #university-location]))

  // type of thesis (optional)
  if (type-of-thesis != none and type-of-thesis.len() > 0) {
    align(center, text(weight: "bold", 2em, type-of-thesis))
    v(0em)
  }

  // title
  align(center, text(weight: "bold", font: heading-font, 1.4em, title))

  v(0em)

  // confidentiality marker (optional)
  if (confidentiality-marker.display) {
    let display = false
    let x-offset = 0pt
    let y-offset = 0pt
    let size = 7em
    let title-spacing = 2em

    if (type-of-degree == none and type-of-thesis == none) {
      title-spacing = 0em
    }

    if ("display" in confidentiality-marker) {
      display = confidentiality-marker.display
    }
    if ("offset-x" in confidentiality-marker) {
      x-offset = confidentiality-marker.offset-x
    }
    if ("offset-y" in confidentiality-marker) {
      y-offset = confidentiality-marker.offset-y
    }
    if ("size" in confidentiality-marker) {
      size = confidentiality-marker.size
    }
    if ("title-spacing" in confidentiality-marker) {
      confidentiality-marker.title-spacing
    }

    v(title-spacing)

    let color = if (show-confidentiality-statement) {
      red
    } else {
      green.darken(5%)
    }

    place(
      right,
      dx: 35pt + x-offset,
      dy: -70pt + y-offset,
    )[
      #circle(radius: size / 2, fill: color)
    ]
  }

  

  // type of degree (optional)
  if (type-of-degree != none and type-of-degree.len() > 0) {
    align(center, text(1em, [#if (language == "de") {
      [für den Erwerb des]
    } else {
      [for the]
    }]))

    v(-0.25em)
    align(center, text(weight: "semibold", 1.25em, type-of-degree))
  }
  // v(1.5em)

  // course of studies
  align(center, text(weight: "bold", 2em, [ Studiengang #authors.map(author => author.course-of-studies).dedup().join(" | ")]
  ))
  align(center, text(1.2em, [Studienrichtung: #type-of-degree-specification \ Bearbeitungszeitraum: #time-of-thesis]))

  // align(center, text(1em, if (language == "de") {
  //   "von"
  // } else {
  //   "by"
  // }))
  
  //   if (many-authors) {
  //   v(0.8em)
  // } else {
  //   v(2em)
  // }

  // // authors
  // grid(
  //   columns: 100%,
  //   gutter: if (many-authors) {
  //     14pt
  //   } else {
  //     18pt
  //   },
  //   ..authors.map(author => align(center, {
  //     text(weight: "medium", 1.25em, [#author.name])
  //   }))
  // )

  // if (many-authors) {
  //   v(0.8em)
  // } else {
  //   v(2em)
  // }

  // // date
  // align(center, text(1.2em, if (type(date) == datetime) {
  //   date.display(date-format)
  // } else {
  //   [#date.at(0).display(date-format) -- #date.at(1).display(date-format)]
  // }))

  v(2em)

  // author information
  align(center, grid(
    align: left,
    columns: (150pt, auto),
    gutter: 15pt,
    // students
    text(if (language == "de") {
      [Verfasser: \ Matrikelnummer]
    } else {
      [Student: \ Student ID: ]
    }),
    stack(
      dir: ttb,
      for author in authors {
        text([#author.name \ #author.student-id])
        linebreak()
      }
    ),

    // course information
    text(if (language == "de") {
      [Kurs: \ Studiengangsleiter]
    } else {
      [Course: \ Course-Advisor ]
    }),
    stack(
      dir: ttb,
      for author in authors {
        text([#author.course \ #author.course-advisor])
        linebreak()
      }
    ),
    // university-supervisor
    if (not at-university) {
      text(if (language == "de") {
        "Wissenschaftlicher Betreuer:"
      } else {
        "Scientific Supervisor:"
      })
    },
    if (not at-university) {
      stack(
        dir: ttb,
        for author in authors {
          let university-supervisor = ""

          // company name
          if (
            "name" in supervisor.university and
            supervisor.university.name != none and
            supervisor.university.name != ""
            ) {
            university-supervisor+= supervisor.university.name
          } else {
            panic("Author '" + author.name + "' is missing a company name. Add the 'name' attribute to the company object.")
          }

          // company address (optional)
          if (
            "mail-address" in supervisor.university and
            supervisor.university.mail-address != none and
            supervisor.university.mail-address != ""
            ) {
            university-supervisor+= text([\ #supervisor.university.mail-address])
          }

          // company city
          if (
            "phone-number" in supervisor.university and
            supervisor.university.phone-number != none and
            supervisor.university.phone-number != ""
            ) {
            university-supervisor+= text([\ #supervisor.university.phone-number])
          } else {
            panic("Author '" + author.name + "' is missing the city of the company. Add the 'city' attribute to the company object.")
          }
          
          university-supervisor
          linebreak()
        }
      )
    },

    // company
    if (not at-university) {
      text(if (language == "de") {
        "Ausbildungsbetrieb:"
      } else {
        "Company:"
      })
    },
    if (not at-university) {
      stack(
        dir: ttb,
        for author in authors {
          let company-address = ""

          // company name
          if (
            "name" in author.company and
            author.company.name != none and
            author.company.name != ""
            ) {
            company-address+= author.company.name
          } else {
            panic("Author '" + author.name + "' is missing a company name. Add the 'name' attribute to the company object.")
          }

          // company address (optional)
          if (
            "address" in author.company and
            author.company.address != none and
            author.company.address != ""
            ) {
            company-address+= text([\ #author.company.address])
          }

          // company city
          if (
            "city" in author.company and
            author.company.city != none and
            author.company.city != ""
            ) {
            company-address+= text([\ #author.company.city])
          } else {
            panic("Author '" + author.name + "' is missing the city of the company. Add the 'city' attribute to the company object.")
          }

          // company country (optional)
          if (
            "country" in author.company and
            author.company.country != none and
            author.company.country != ""
            ) {
            company-address+= text([, #author.company.country])
          }
          
          company-address
          linebreak()
        }
      )
    },

    // supervisor
    // company
    if ("company" in supervisor) {
      text(if (language == "de") {
        "Firmenbetreuer:"
      } else {
        "Supervisor in the Company:"
      })
    },
    if (not at-university) {
      stack(
        dir: ttb,
        for author in authors {
          let company-supervisor = ""

          // company name
          if (
            "name" in supervisor.company and
            supervisor.company.name != none and
            supervisor.company.name != ""
            ) {
            company-supervisor+= supervisor.company.name
          } else {
            panic("Author '" + author.name + "' is missing a company name. Add the 'name' attribute to the company object.")
          }

          // company address (optional)
          if (
            "mail-address" in supervisor.company and
            supervisor.company.mail-address != none and
            supervisor.company.mail-address != ""
            ) {
            company-supervisor+= text([\ #supervisor.company.mail-address])
          }

          // company city
          if (
            "phone-number" in supervisor.company and
            supervisor.company.phone-number != none and
            supervisor.company.phone-number != ""
            ) {
            company-supervisor+= text([\ #supervisor.company.phone-number])
          } else {
            panic("Author '" + author.name + "' is missing the city of the company. Add the 'city' attribute to the company object.")
          }

          company-supervisor
          linebreak()
        }
      )
    },

    
  ))
  v(5em)
}