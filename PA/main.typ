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
//Urlaubsantrag muss genehmigt werden
// Genehmigung einer Bestellung -> Approval 

== Motivation & Problemstellung
//Struktur der Arbeit

"Ein Ziel ohne Plan ist nur ein Wunsch." -Antoine de Saint-Exupéry.

Im dynamischen Umfeld moderner Unternehmen sind klare Prozesse und eine präzise Planbarkeit unerlässlich. Dies gilt sowohl für die Verwaltung von Mitarbeiterurlauben als auch für die Genehmigung von Projektbudgets.

Im Rahmen eines Urlaubsantrags beim Arbeitgeber wird meist ein Antrag an den Vorgesetzten gestellt, der diesen anschließend bewilligen oder ablehnen kann. Dabei wird in der Regel geprüft, ob der Mitarbeiter noch über ausreichende Urlaubstage verfügt.
Ein vergleichbarer Genehmigungsprozess bezogen auf das Projektbudget findet man ebenfalls bei der 
Genehmigung von Projektbudgets im Unternehmenskontext. 

Eine präzise und transparente Budgetierung von Projekten ist hierbei essenziell. Unzureichende Kontrolle und fehlende Übersicht über das Projektbudget können zu finanziellen Verlusten führen und die Performance des Unternehmens beeinträchtigen. Die Verwendung moderner Unternehmenssoftware (#acr("ERP")), bietet hier eine entscheidende Unterstützung, um das Budget entsprechend verwalten zu können.

In der heutzutage präsenten digitalen Transformation stehen viele Unternehmen vor der Umstellung ihrer Systemlandschaft von einem On-Premis auf ein Cloud-System, wie die SAP S/4HANA Public Cloud. Die Cloud-Lösung bietet dabei Vorteile, wie bespielsweise einen Echtzeit-Datenzugriff, was eine transparente und effiziente Datenverwaltung ermöglicht. Jedoch bring die Cloud-Lösung von SAP auch Herausforderungen und Schwierigkeiten mit sich. 
Im SAP Standardpaket S/4HANA Public Cloud ist ein Projektbudget Genehmigungsprozess nicht inbegriffen. Durch diese derzeit fehlende Funktion ist die Verwaltung und Genehmigung von Projektbudgets nur beschränkt möglich. Projektbudgtes müssen daher manuell und systemfern durchgeführt werden, was zu einem erheblichen Arbeitsaufwand führt. Des weiteren ist das Führen von Excel-Dateien aufwändig und inkonsistent.
Eine weitere Herausforderung stellt die eingeschränkte Möglichkeit der Systemanpassungen in der Public Cloud dar.

Die Verwaltung und Genehmigung von Projektbudgets kann jedoch durch eine Standarderweiterung ermöglicht werden. Dabei wird durch ein Workflow mit dem SAP Workflow Tool auf der #acr("BTP") erstellt, der eine Genehmigungsprozessautomatisierung ermöglicht. Mithilfe von Workflows können Geschäftsprozesse automatisiert, standardisiert und effizienter gestaltet werden. Dabei können Aufgaben, Benachrichtigungen oder Berechtigungen automatisch in einer zuvor definierten Reihenfolge ausgeführt werden. Diese Lösung bietet eine maßgebliche Optimierung des Projektbudget-Genehmigungsprozesses hinsichtlich der Entlastung der Mitarbeiter und der Effizienz. 
 
== Struktur der Arbeit
 Die vorliegende Arbeit ist in sieben Hauptkapitel gegliedert. Nach der Einleitung, in der die Motivation und Problemstellung dargelegt, sowie der Aufbau und die Zielsetzung der Arbeit beschrieben werden, folgt in Kapitel 2 eine umfassende Darstellung der theoretischen Grundlagen. Hier werden zunächst die allgemeinen Konzepte der Projektbudgetierung erläutert, bevor auf die spezifischen Aspekte des SAP S/4HANA-Systems eingegangen wird. Dazu gehören sowohl die Grundlagen von SAP S/4HANA als auch das Projektsystem. Im Anschluss wird die Business Technology Platform (BTP) als relevante technologische Plattform für die Automatisierung und das Workflow-Management im Rahmen der Projektbudgetierung vorgestellt.

In Kapitel 3 werden die angewandten wissenschaftlichen Methoden diskutiert und begründet, warum die vorleigenden Methoden gewählt wurden. Nach der Auswahl der Methoden erfolgt die Durchführung von Experteninterviews, deren qualitative Auswertung nach der Methode von Mayring vorgenommen wird.

Im vierten Kapitel wird die Anforderungserhebung basierend auf den Experteninterviews behandelt. Die Ergebnisse werden analysiert und hinsichtlich ihrer Relevanz und Priorität eingeordnet.

Kapitel 5 beschreibt die Implementierung der im Rahmen dieser Arbeit vorgeschlagenen Standarderweiterung im SAP S/4HANA-System. Darauf aufbauend wird in Kapitel 6 eine Evaluierung der erzielten Ergebnisse vorgenommen, wobei der Fokus auf der Beurteilung der Effizienz und der Zielerreichung liegt.

Die Arbeit schließt mit einer Zusammenfassung in Kapitel 7 ab. Hier werden neben dem Fazit eine kritische Reflexion der durchgeführten Arbeit, sowie ein Ausblick gegeben.



== Abgrenzung der Arbeit
Gegenstand dieser Arbeit ist die Standarderweiterung hinsichtlich der Projektbudgetierung in SAP S/4HANA Public Cloud. Darauffolgende Versionen können nicht berücksichtigt werden. Die beschriebenen Funktionaliäten sind bis auf kleinere Einschränkungen auf SAP S/4HANA Private Cloud übertragbar.
== Ziel und Gang
Das Ziel dieser Arbeit ist es, durch Experteninterviews und eine folgende qualitative Inhaltsanalyse nach Mayring Anforderungen für den Projektbudget-Genehmigung Workflow abzuleiten. Nach der Implementierung soll eine fundierte Evaluation durchgeführt werden, um zu beurteilen, ob die Standarderweiterung den Anforderungen gerecht wird. 

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
// Was versteht man unter einem Projekt ?
Das Projektsystem #acr("PS") ist ein zentraler Bestandteil des #acr("ERP")-Systems von SAP und spielt eine wesentliche Rolle bei der Verwaltung von Projekten. Durch das Projektsystem PS der SAP können die Planung, die Steuerung und die Überwachung von komplexen Geschäftsprojekten erleichtert werden. Zudem können Module wie das #acr("FI"), das #acr("CO") und die #acr("MM") integriert werden. 

Der Ablauf eines Projekts im SAP PS kann in mehrere aufeinander aufbauende Phasen untergliedert werden. 
Die erste Phase umfasst drei Projektinitialisierung, dabei wird das Projekt definiert und die ersten Planungsdaten erfasst. Dazu wird ein #acr("PSP") erstellt, der die zentralen Meilensteine und Arbeitsblöcke enthält. 
Anschließend folgt die Projektplanung, wobei der Detaillierungsgrad erhöht wird und mit Ressourcen, Terminen und Kosten kalkuliert wird. 
Der nächste Schritt umfasst die eigentliche Projektdurchführung. Dabei werden die zuvor erstellten Projektpläne operativ umgesetzt. Um eine effiziente Projektdurchführung zu ermöglichen, werden Aufgaben konkret zugewiesen und Fortschritte überwacht. 
Über die Gesamte Projektdauer ist das #acr("CO") unerlässlich, da das dieses dabei die Kosten, Termine und die Qualität überwacht. Zudem werden in dieser Phase Abweichungsanalysen und das Risikomanagement durchgeführt.
Der letzte Schritt ist der Projektabschluss. Dieser erfolgt nach der Fertigstellung des Projekts. In diesem Schritt erfolgt die letztendliche Kontrolle und Abrechnung. Zudem werden alle Ergebnisse dokumentiert und das Projekt wird formal beendet.

// Grundlagen
//!  Muss gemacht werden
//? Frage ich nach
//* Highlight

== Business Technology Platform (BTP)
#figure(caption:
"SAP cloud applications and SAP BTP"
, image(width: 10cm,
"assets/BTP001_2406_U2L2_01.png"
))
<sap_portfolio_btp>

=== Grundlagen BTP //BTP Grafik in den Anhang 
// Grundlagen direkt darunter oder extra Kapitel 
Die #acr("BTP") der SAP ist eine Innovationsplattform im SAP-Ökosystem, welche für SAP-Anwendungen in der Cloud optimiert ist.@SAP_BTP Sie unterstützt Unternehmen bei digitalen Transformationsprozessen und hilft, innovative Geschäftsanwendungen zu entwicklen. Dabei stellt die #acr("BTP") eine Schnittstelle zwischen bestehenden Systemen und der Entwicklung neuer Technologien und Anwendungen da (@sap_portfolio_btp). Dabei können Geschäftsprozesse miteinander verbunden, erweitert geplant und integriert werden.@SAP_BTP Durch die Möglichkeit einer Low-Code und Pro-Code Anwendungsentwicklung bietet die #acr("BTP") eine intuitive Entwicklungsumgebung, um die Geschäftsprozesse des Zielunternehmens beschleunigt aber trotzdem kontrolliert (in einer Sicheren Umgebung) zu entwicklen.@SAP_BTP 
Die #acr("BTP") bietet vorkonfigurierte Datenmodelle, Integrationen von Workflows, APIs (#acr("API")) und #acr("KI") Services.@SAP_BTP Durch diese Dienste können neue Anwendungen bereitgestellt werden, Prozesse integriert, Aufgaben automatisiert, Anwenungen mit Chatbots versehen und Daten und deren Auswirkungen für das gesamte Unternehmen analysiert werden.@SAP_BTP Dadurch können Unternehmen ihre Prozesse optimieren, Innovationen vorantreiben und Wettbewerbsvorteile erlangen, da diese flexibel auf sich ändernde Marktanforderungen reagieren können.

Die #acr("BTP") basiert auf einem modularen Konzept und umfasst folgende Hauptbereiche in einer Zentralen Umgebung: Das Datenbank/Datenmanagement darunter auch die Echtzeitsichten von Daten, die Analytik, die Anwendungsentwicklung und Automatisierung, die Integration und Künstliche Intelligenz (@sap_portfolio_btp).@SAP_BTP 

=== SAP Workflow Management Tool
Der Begriff "Workflow" wird von der SAP wie folgt definiert.
Unter einem Workflow versteht man die "Abfolge von miteinander verbundenen Aktivitäten oder Aufgaben, die ausgeführt werden, um ein bestimmtes Ergebnis zu erzielen." Definition von aufeinanderfolgenden Prozessschritten, die abgearbeitet werden, sobald die Workflow-Instanz aufgerufen wird.@SAP_Workflow

Man unterscheidet zwischen drei unterschiedlichen Arten von Workflows. 
Die erste Variante beschreibt einen vollständig manuellen Workflow. Dabei werden die einzelnen Schritte händisch abgearbeitet. Beispielsweise wird ein Blatt mit 

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




//Das Ziel von Workflows, insbesondere in einem SAP-System wie S/4HANA, ist es, Geschäftsprozesse zu automatisieren, standardisieren und effizienter zu gestalten. Durch Workflows können bestimmte Aufgaben, Genehmigungen oder Benachrichtigungen automatisch in einer vordefinierten Reihenfolge an die richtigen Personen oder Abteilungen weitergeleitet werden.