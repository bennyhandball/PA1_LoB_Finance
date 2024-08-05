#import "supercharged-dhbw/2.1.0/acronym-lib.typ": *
#import "supercharged-dhbw/2.1.0/check-attributes.typ": *
#import "supercharged-dhbw/2.1.0/confidentiality-statement.typ": *
#import "supercharged-dhbw/2.1.0/declaration-of-authorship.typ": *
#import "supercharged-dhbw/2.1.0/lib.typ": *
#import "supercharged-dhbw/2.1.0/titlepage.typ": *
#import "acronyms.typ": acronyms

#show: supercharged-dhbw.with(
  title: "Erstellung einer Applikation zur Verwaltung von Enterprise Architecture Engagements in der Cloud Transformation Advisory",
  type-of-degree-specification: "Sales & Consulting",
  time-of-thesis: "29.07.2024 - 18.11.2024",
  authors: ((
    name: "Julian Konz", 
    student-id: "3468097", 
    course: "WWI23SCB",
    course-advisor: "Prof. Dr. Frank Koslowski", 
    course-of-studies: "Wirtschaftsinformatik", company: ((
      name: "SAP SE", 
      address: "Dietmar-Hopp-Allee 16", 
      city: "69190 Walldorf")
    )),
  ),
  acronyms: acronyms, // displays the acronyms defined in the acronyms dictionary
  at-university: false, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("sources.bib"),
  date: datetime.today(),
  language: "de", // en, de
  supervisor: (
    company: (
      name: "Svetlana Rieb",
      mail-address: "svetlana.rieb@sap.com",
      phone-number: "+491708555565"), 
    university: (
      name: "T.B.A.",
      mail-address: "T.B.A",
      phone-number: "T.B.A")
    ),
  
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Mannheim",
  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
)

// Edit this content to your liking
= Einleitung

== Motivation & Problemstellung

== Ziel und Gang

= Theoretische Grundlage

== Enterprise Architecture

=== TOGAF

== Microsoft Power Platform

=== Microsoft Power Apps

= Methodik

== Anforderungsanalyse

=== Semistrukturierte Leitfadeninterviews

=== Fokusgruppeninterview

=== Brainstorming

== inkrementelle Entwicklung mit XP

= Anforderungsanalyse

== Durchführung der Interviews

=== Leitfadeninterviews

=== Fokusgruppeninterviews

== Architektur der Applikation

= Entwicklung der Applikation

== Festlegung der Increments

== Praktische Umsetzung

== Review & Feedback aus der Abteilung

= Zusammenfassung

== Fazit

== Ausblick

= Examples

#lorem(30)

== Acronyms

Use the `acr` function to insert acronyms, which looks like this #acr("HTTP").

#acrlpl("API") are used to define the interaction between different software systems.

#acrs("REST") is an architectural style for networked applications.

== Lists

Create bullet lists or numbered lists.

- These bullet
- points
- are colored

+ It also
+ works with
+ numbered lists!

== Figures and Tables

Create figures or tables like this:

=== Figures

#figure(caption: "Image Example", image(width: 4cm, "assets/ts.svg"))

=== Tables

#figure(caption: "Table Example", table(
  columns: (1fr, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [], [*Area*], [*Parameters*],
  ),
  text("cylinder.svg"),
  $ pi h (D^2 - d^2) / 4 $,
  [
    $h$: height \
    $D$: outer radius \
    $d$: inner radius
  ],
  text("tetrahedron.svg"),
  $ sqrt(2) / 12 a^3 $,
  [$a$: edge length]
))<table>

== Code Snippets

Insert code snippets like this:

#figure(caption: "Codeblock Example", sourcecode[```typ
#show "ArtosFlow": name => box[
  #box(image(
    "logo.svg",
    height: 0.7em,
  ))
  #name
]

This report is embedded in the
ArtosFlow project. ArtosFlow is a
project of the Artos Institute.
```])

== References

Cite like this #cite(form: "prose", <iso18004>).
Or like this @iso18004.

You can also reference by adding `<ref>` with the desired name after figures or headings.

For example this @table references the table on the previous page.

You can also generate footnotes #footnote[https://typst.app/docs/reference/model/footnote/] using #footnote [Text]

= Conclusion

#lorem(100)

#lorem(120)

#lorem(80)