#import "supercharged-dhbw/2.1.0/acronym-lib.typ": *
#import "supercharged-dhbw/2.1.0/check-attributes.typ": *
#import "supercharged-dhbw/2.1.0/confidentiality-statement.typ": *
#import "supercharged-dhbw/2.1.0/declaration-of-authorship.typ": *
#import "supercharged-dhbw/2.1.0/lib.typ": *
#import "supercharged-dhbw/2.1.0/titlepage.typ": *
#import "acronyms.typ": acronyms

#show: supercharged-dhbw.with(
  title: "Projektbudget in SAP S/4HANA: Implementierung und Analyse eines Genehmigungsprozesses mithilfe des SAP Workflow Management Tools auf der Business Technology Platform",
  short-title: "Projektbuget-Genehmigung in SAP S/4HANA ",
  type-of-degree-specification: "Sales & Consulting",
  time-of-thesis: "29.07.2024 - 18.11.2024",
  authors: ((
    name: "Benjamin Will", 
    student-id: "5146364", 
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
      name: "Nico Rubach",
      mail-address: "nico.rubach@sap.com",
      phone-number: "+496227750273"), 
    university: (
      name: "Jens Bohrmann",
      mail-address: "bohrmann@zew.de",
      phone-number: "T.B.A")
    ),
  
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Mannheim",
  bib-style: "harvard-cite-them-right"
  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
)
//
// Edit this content to your liking
= Einleitung
//Besseren Einstieg 

Wird ein Einkauf eines Produktes, beispielsweise eines Autos, im Namen einer dritten Person getätigt, so ist zunächst die Höhe des zur Verfügung stehenden Budgets zu klären. Kommt es anschließend zu einer Verhandlung zwischen dem Verkäufer und dem Käufer (der das Auto für eine andere Person kaufen möchte), so muss der Käufer, sich zunächt den verhandelten Endpreis vom tatsächlichen Käufer bestätigen lassen. Einen ähnlichen Genehmigungsprozess findet man ebenfalls bei der 
Genehmigung von Projektbudgets im Unternehmenskontext. Dabei spielt die effiziente Verwaltung von Projekten innerhalb eines Unternehmens in einer zunehmend digitalisierten Gesellschaft eine immer höher Bedeutung.

Eine besondere Herausforderung stellt dabei die präzise und transparente Budgetierung von Projekten dar. Unzureichende Kontrolle und fehlende Übersicht über das Projektbudget können zu finanziellen Verlusten führen und die Performance des Unternehmens beeinträchtigen. Die Verwendung moderner Unternehmenssoftware (#acr("ERP")), bietet hier eine entscheidende Unterstützung, um das Budget entsprechend verwalten zu können.

Die SAP SE mit dem Hauptsitz in Walldorf (Deutschland) ist einer der weltweit führenden Anbieter von Unternehmenssoftware zur Steuerung von Geschäftsprozessen @SAP_Unternehmen. Der Zusatz SE #acr("SE") bezeichnet rechtlich eine Aktiengesellschaft nach EU-Recht @SAP_Unternehmen.
Die ERP (Enterprise Resource Planning) Unternehmenssoftware umfasst alle Kerngeschäftsrelevanten Bereiche wie Beschaffung, Produktion, Materialwirtschaft, Vertrieb, Marketing, Finanzwesen und Personalwesen.
SAP gehört zu den ersten Unternehmen, die standardisierte Softwarelösungen für Unternehmen entwickelt haben, und bietet bis heute moderne, führende ERP-Systeme an.


== Motivation & Problemstellung
//Struktur der Arbeit
Im SAP Standardpaket S/4HANA Public Cloud ist eine Projektbudget Genehmigung nicht inbegriffen. Wodurch die Verwaltung und Genehmigung von Projektbudgets nur beschränkt möglich ist. Die Verwaltung und Genehmigung von Projektbudgets kann jedoch durch eine Standarderweiterung ermöglicht werden. Dabei wird durch ein Workflow eine Automatisierung ermöglicht.Die Standarderweiterung erfolgt auf der #acr("BTP") durch das Workflow Management Tool. 

== Abgrenzung der Arbeit
Gegenstand dieser Arbeit ist die Standarderweiterung hinsichtlich der Projektbudgetierung in SAP S/4HANA Public Cloud. Darauffolgende Versionen können nicht berücksichtigt werden. Die beschriebenen Funktionaliäten sind bis auf kleinere Einschränkungen auf SAP S/4HANA Private Cloud übertragbar.
== Ziel und Gang
 

= Theoretische Grundlagen
== Projektbudgetierung Grundlagen 
Das deutsche Institut für Normung (DIN 6990101-5:2009:11, zitiert )
//Definition von Projekten ()
//ERP System nicht zwingend Erklären 
// SAP S/4 HANA -> ERP-System mit Schnittstellen 

== SAP S/4HANA
=== Grundlagen S/4HANA 
Mit der Einführung von S/4HANA im Jahr 2015 hat SAP einen bedeutenden Schritt in der Entwicklung von #acr("ERP")-Systemen gemacht. Als Nachfolger der SAP Business Suite aus dem Jahr 2004 und Ablösung von SAP R/3, das erstmals eine Client-Server-Technologie einsetzte, bietet S/4HANA eine Reihe von Innovationen.
Das Herzstück eines S/4HANA-Systems ist die HANA Datenbank, eine spaltenbasierte In-Memory Datenbank, die im Vergleich zu herkömmlichen Datenbanken einen schnelleren Datenzugriff und bessere Analysezeiten ermöglicht. Durch diese Eigenschaft können Echtzeitanalysen und Berechnungen zur Laufzeit realisiert und ermöglicht werden. Dies ist insbesondere bei der Verarbeitung von Big Data Analysen von großer Bedeutung.
S/4HANA bietet ebenfalls eine neue Benutzeroberfläche, namens SAP Fiori, die die bisherigen SAP GUI-Oberflächen ablöst. SAP Fiori ist dabei browserbasiert, was bedeutet, dass keine spezielle Software lokal auf dem Gerät installiert werden müssen. Nutzer können SAP Fiori plattformunabhängig und flexibel über gängige Browser wie Google Chrome, Mozialla Firefox oder Safari aufrufen. 
Unternehmen haben bei SAP S/4HANA verschiedene Bereitstellungsoptionen: On-Premise, Private Cloud oder Public Cloud.

Bei der On-Premise Lösung hosten Unternehmen die Software auf eigenen Servern, während bei der Private-Cloud Lösung die Software auf Servern von Drittanbietern als Single-Tenant betrieben wird. Single-Tentant beschreibt in diesem Kontext, eine dedizierte, isolierte Cloud Umgebung, die nur für den spezifischen Kunden bereitgestellt wird. Im Gegensatz zu einer Multi-Tenant-Umgebung, in der mehrere Kunden (Mandanten) die gleiche Software-Instanz teilen, hat der Kunde in einer Single-Tenant-Lösung seine eigene Instanz der SAP-Software. 

Die beiden eben beschriebenen Varianten bieten eine hohe Flexibilität für Unternehmen, um die Software an ihre individuellen Anforderungen und Geschäftsprozesse anzupassen. 
Im Gegensatz dazu müssen sich Unternehmen bei der Public-Cloud-Lösung weitesgehend an den Standard des Systems halten, da die Software in einer Multi-Tenant-Architektur läuft und nur bedingt modifiziert werden kann. SAP bietet sowohl die Public- als auch die Private-Cloud-Version als #acr("SAAS") an.
=== Grundlagen Projektsystem

// Grundlagen
//!  Muss gemacht werden
//? Frage ich nach
//* Highlight

== Business Technology Platform (BTP)

=== Grundlagen BTP //BTP Grafik in den Anhang 
// Grundlagen direkt darunter oder extra Kapitel 
Die #acr("BTP") der SAP ist eine Innovationsplattform im SAP-Ökosystem, welche für SAP-Anwendungen in der Cloud optimiert ist.@SAP_BTP Sie unterstützt Unternehmen bei digitalen Transformationsprozessen und hilft, innovative Geschäftsanwendungen zu entwicklen. Dabei stellt die #acr("BTP") eine Schnittstelle zwischen bestehenden Systemen und der Entwicklung neuer Technologien und Anwendungen da. Dabei können Geschäftsprozesse miteinander verbunden, erweitert geplant und integriert werden.@SAP_BTP Durch die Möglichkeit einer Low-Code und Pro-Code Anwendungsentwicklung bietet die #acr("BTP") eine intuitive Entwicklungsumgebung, um die Geschäftsprozesse des Zielunternehmens beschleunigt aber trotzdem kontrolliert (in einer Sicheren Umgebung) zu entwicklen.@SAP_BTP 
Die #acr("BTP") bietet vorkonfigurierte Datenmodelle, Integrationen von Workflows, APIs (#acr("API")) und #acr("KI") Services.@SAP_BTP Durch diese Dienste können neue Anwendungen bereitgestellt werden, Prozesse integriert, Aufgaben automatisiert, Anwenungen mit Chatbots versehen und Daten und deren Auswirkungen für das gesamte Unternehmen analysiert werden.@SAP_BTP Dadurch können Unternehmen ihre Prozesse optimieren, Innovationen vorantreiben und Wettbewerbsvorteile erlangen, da diese flexibel auf sich ändernde Marktanforderungen reagieren können.

Die #acr("BTP") basiert auf einem modularen Konzept und umfasst folgende Hauptbereiche in einer Zentralen Umgebung: Das Datenbank/Datenmanagement darunter auch die Echtzeitsichten von Daten, die Analytik, die Anwendungsentwicklung und Automatisierung, die Integration und Künstliche Intelligenz.@SAP_BTP 

=== SAP Workflow Management Tool
Der Begriff "Workflow Management" wird von der SAP wie folgt definiert.
Unter einem Workflow versteht man die Definition von aufeinanderfolgenden Prozessschritten, die abgearbeitet werden, sobald die Workflow-Instanz aufgerufen wird.@SAP_Workflow



=== SAP Build Process Automation



= Wissenschaftliche Methodiken
// Inhaltsananalyse nach Myring
// Inhaltsanalyse nach Kuckartz
// Wichtig: Warum wurden folgende Methoden gewählt 

// Gibt es eine wissenschaftliche Methode zur Implementierung 
//*Aufzählung möglicher Methoden 

== Auswahl der Methodiken 
Zur methodischen Erarbeitung des vorliegenden Themas kommen verschiedene Vorgehensweisen in Betracht.
Dazu gehören Experteninterviews, Umfragen, Qualitative Inhaltsanalyse nach Mayring, Literaturrecherche und die Evaluierung.

Ausgewählt wurden dabei die Durchführung von Experteninterviews zur Ermittlung von Informationen rund um die Projektbudgetierung in einem SAP S/4HANA Public Cloud System.  
Zusätzlich werden anhand von Literaturrecherche die theoretischen Grundlagen der Arbeit untersucht. 
//Auswahlkriterien -> quantitative
//Auswahlkapitel //Umsetzbarkeit Warum die Methode 
== Experteninterviews

//Aufbau einer Frage zeigen (Wie werden solche Fragen in einem Interview aufgebaut )

Für die Gewinnung der Informationen zu dieser Arbeit wurden verschiedene Interviews durchgeführt. Dabei wurden verschiedene Funktionsfelder befragt, um mehrere Sichtweisen und Perspektiven zu ermöglichen. Es wurden Experten der Entwicklung also der technischen Sicht der Projektbudgetierungsgenehmigung als auch Berater und Kunden für einen prozessualen Einblick befragt. 
Die Interviews wiesen dabei einen semistrukturierten Aufbau auf. Das bedeutet, dass die Interviews anhand der Leitfäden geführt wurden, jedoch von diesem je nach Gesprächsverlauf und Fachgebiet abgewichen werden kann.

//Semistrukturierte Leitfadeninterviews


== Qualitative Inhaltsanalyse nach Mayring





= Anforderungserhebung



== Auswertung der Experteninterviews
== Darstellung und Priorisierung der Experteninterviewergebnisse

= Implementierung der Standarderweiterung

= Evaluierung der Ergebnisse 




= Zusammenfassung

== Fazit

== Kritische Reflexion der Arbeit 

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

//Cite like this #cite(form: "prose", <iso18004>).
//Or like this @iso18004.

You can also reference by adding `<ref>` with the desired name after figures or headings.

For example this @table references the table on the previous page.

You can also generate footnotes #footnote[https://typst.app/docs/reference/model/footnote/] using #footnote [Text]
