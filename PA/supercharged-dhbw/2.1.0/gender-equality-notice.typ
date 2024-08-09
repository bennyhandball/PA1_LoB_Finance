#let gender-equality-notice(authors, title, date, language, many-authors, at-university, city, date-format) = {
  pagebreak()
  v(2em)
  text(size: 20pt, weight: "bold", if (language == "de") {
    "Gleichstellungsvermerk"
  } else {
    "Gender Equality Notice"
  })

  v(1em)
    par(justify: true, leading: 18pt,[
      In der wissenscaftlichen Arbeit mit dem Titel
    ])
    v(1em)
    align(center,
      text(weight: "bold", title)
    )
    v(1em)
    par(justify: true, leading: 18pt,[
      wird aus Gründen der besseren Lesbarkeit auf die gleichzeitige Verwendung der Sprachformen männlich, weiblich und divers (m/w/d) verzichtet und das generische Maskulinum verwendet. Weibliche und andersweitige Geschlechteridentitäten werden dabei ausdrücklich mitgemeint, soweit es für die Aussage erforderlich ist.
    ])
}