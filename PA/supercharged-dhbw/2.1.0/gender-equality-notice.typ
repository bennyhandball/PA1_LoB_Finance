#let gender-equality-notice(authors, title, date, language, many-authors, at-university, city, date-format) = {
  pagebreak()
  v(2em)
  text(size: 20pt, weight: "bold", if (language == "de") {
    "Disclaimer"
  } else {
    "Disclaimer"
  })
 
  v(1em)
    par(justify: true, leading: 18pt,[
      In der wissenschaftlichen Arbeit mit dem Titel
    ])
    v(1em)
    align(center,
      text(weight: "bold", title)
    )
    v(1em)
    show par: set block(spacing: 2em)
    par(justify: true, leading: 18pt,[
      wird aus Gründen der besseren Lesbarkeit auf die gleichzeitige Verwendung der Sprachformen männlich, weiblich und divers (m/w/d) verzichtet und das generische Maskulinum verwendet. Weibliche und andersweitige Geschlechteridentitäten werden dabei ausdrücklich mitgemeint, soweit es für die Aussage erforderlich ist.
      
      Abbildungen,die den Lesefluss stören, befinden sich im Anhang. Ist dies der Fall, wird im Text zusätzlich auf den Anhang verwiesen.
 
      
    ])
}