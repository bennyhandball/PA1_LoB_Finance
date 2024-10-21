#import "supercharged-dhbw/2.1.0/acronym-lib.typ": *
#import "supercharged-dhbw/2.1.0/check-attributes.typ": *
#import "supercharged-dhbw/2.1.0/confidentiality-statement.typ": *
#import "supercharged-dhbw/2.1.0/declaration-of-authorship.typ": *
#import "supercharged-dhbw/2.1.0/lib.typ": *
#import "supercharged-dhbw/2.1.0/titlepage.typ": *
#import "acronyms.typ": acronyms
#import "supercharged-dhbw/2.1.0/appendix.typ": appendix


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
  appendix: appendix,
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

"Ein Ziel ohne Plan ist nur ein Wunsch." - Antoine de Saint-Exupéry @Zitat_Einstieg.

Im dynamischen Umfeld moderner Unternehmen sind klare Prozesse und eine präzise Planbarkeit unerlässlich #cite(<Prozessmanagement_Book>, supplement: "S. 5"). Dies gilt z.B. für die Verwaltung von Mitarbeiterurlauben als auch für die Genehmigung von Projektbudgets.

Im Rahmen eines Urlaubsantragsprozesses beim Arbeitgeber wird meist ein Antrag an den Vorgesetzten gestellt, der diesen anschließend bewilligen oder ablehnen kann. Dabei wird in der Regel geprüft, ob der Mitarbeiter noch über ausreichende Urlaubstage verfügt.
Einen vergleichbarer Genehmigungsprozess bezogen auf das Projektbudget findet man ebenfalls bei der 
Genehmigung von Projektbudgets im Unternehmenskontext. 

Eine präzise und transparente Budgetierung von Projekten ist hierbei essenziell. Unzureichende Kontrolle und ein fehlender Überblick über das Projektbudget können zu finanziellen Verlusten führen und die Performance des Unternehmens beeinträchtigen. Die Verwendung moderner Unternehmens-Anwendungssoftware (#acr("ERP")-Software), bietet hier eine entscheidende Unterstützung, um das Budget entsprechend verwalten und beplanen zu können #cite(<ERP-Systeme_Book_Gronau>, supplement: "S. 182"). Laut Dr. Siar Sarferaz (Chef Software Architekt bei SAP) versteht man unter dem Begriff #acr("ERP")
"eine Software die mit mehreren Modulen verknüpft ist, um eine Vielzahl von Geschäftsprozessen zu verwalten und zu steuern, die Unternehmen unterstützen. Lagerverwaltung, Produktplanung, Einkauf, Bestandskontrolle, Fertigung, Kundenservice und Auftragsverfolgung können von #acr("ERP")" unterstützt werden" #cite(<ERP-Systeme_Book_Sarferaz>, supplement: "S.3").


Obwohl Genehmigungsprozesse in verschiedenen Unternehmensbereichen, wie der Urlaubsverwaltung, standardisiert und effizient abgebildet werden können, stellt die Projektbudgetierung in SAP S/4HANA Public Cloud  eine spezielle Herausforderung dar, da im Standardumfang keine standardisierte Funktion zur Genehmigung von Projektbudgets vorhanden ist.
Durch diese derzeit fehlende Funktion ist die Verwaltung und Genehmigung von Projektbudgets nur beschränkt möglich.  
Die Genehmigung der Projektbudgtes muss daher manuell und systemfern durchgeführt werden, was zu einem erheblichen Arbeitsaufwand führt. 
Eine weitere Herausforderung stellt die eingeschränkte Anpassungsmöglichkeit der Public Cloud dar, wenn Unternehmen ihre spezifischen Geschäftsanforderungen abbilden möchten @ERP_Clean_Core. 

Durch eine Standarderweiterung auf der #acr("BTP") kann die Verwaltung und Genehmigung ermöglicht werden @SAP_Guide.
Dabei wird das SAP Build Tool auf der #acr("BTP")  genutzt um mithilfe des SAP Workflow Tools einen Workflow zu erstellen, der eine Genehmigungsprozessautomatisierung ermöglicht @ERP_Clean_Core.
Mithilfe von Workflows können Geschäftsprozesse automatisiert, standardisiert und effizienter gestaltet werden @SAP_Workflow_Overview. Dabei können Aufgaben, Benachrichtigungen oder Berechtigungen automatisch in einer zuvor definierten Reihenfolge ausgeführt werden @SAP_Workflow_Overview. Diese Lösung bietet eine maßgebliche Optimierung des Projektbudget-Genehmigungsprozesses hinsichtlich der Entlastung der Mitarbeiter und der Effizienz @Workflow_source. 
 
== Struktur der Arbeit
Die vorliegende Arbeit ist in sieben Hauptkapitel gegliedert. Nach der Einleitung, in der die Motivation und Problemstellung dargelegt, sowie der Aufbau und die Zielsetzung der Arbeit beschrieben werden, folgt in Kapitel 2 eine umfassende Darstellung der theoretischen Grundlagen. Hier werden zunächst die allgemeinen Konzepte der Projektbudgetierung erläutert, bevor auf die spezifischen Aspekte des SAP S/4HANA-Systems eingegangen wird. Dazu gehören sowohl die Grundlagen von SAP S/4HANA als auch das Projektsystem. Im Anschluss wird die Business Technology Platform (BTP) als relevante technologische Innovationsplattform für die Automatisierung und das Workflow-Management im Rahmen der Projektbudgetierung vorgestellt.

In Kapitel 3 werden die angewandten wissenschaftlichen Methoden diskutiert und begründet, warum die vorliegenden Methoden gewählt wurden. Nach der Auswahl der Methoden erfolgt die Durchführung von Experteninterviews, deren qualitative Auswertung nach der Methode von Mayring vorgenommen wird.

Im vierten Kapitel wird die Anforderungserhebung basierend auf den Experteninterviews behandelt. Die Ergebnisse werden analysiert und hinsichtlich ihrer Relevanz und Priorität eingeordnet.
Kapitel 5 beschreibt die Implementierung der im Rahmen dieser Arbeit vorgeschlagenen Standarderweiterung im SAP S/4HANA-System. Darauf aufbauend wird in Kapitel 6 eine Evaluierung der erzielten Ergebnisse vorgenommen, wobei der Fokus auf der Beurteilung der Effizienz und der Zielerreichung liegt.

Die Arbeit schließt mit einer Zusammenfassung in Kapitel 7 ab. Hier werden neben dem Fazit eine kritische Reflexion der durchgeführten Arbeit, sowie ein Ausblick gegeben.



== Abgrenzung der Arbeit
Gegenstand dieser Arbeit ist die Standarderweiterung hinsichtlich der Projektbudgetierung in SAP S/4HANA Public Cloud Version 2408. Darauffolgende Versionen können nicht berücksichtigt werden. Die beschriebenen Funktionaliäten sind bis auf kleinere Einschränkungen auf die SAP S/4HANA Private Cloud übertragbar.
== Ziel und Gang
Das Ziel dieser Arbeit ist es den Genehmigungsprozess von Projektbudgets in SAP S/4HANA Public Cloud detailliert zu analysieren und zu evaluieren. Dabei soll beurteilt werden, ob die Standarderweiterung den durch Experteninterviews und eine folgende qualitative Inhaltsanalyse nach Mayring erhobenen Anforderungen entspricht. 
Nach der Erhebung und Analyse der Anforderungen soll die Standarderweiterung dann implementiert werden und der Aufwand der Implementierung dokumentiert und dargestellt werden. Das Ergebnis der Arbeit soll der Finance-Beratungsabteilung dazu dienen, eine möglichst optimierte, auf die Kundenbedürfnisse abgestimmte Entscheidungsfindung bereitzustellen und zusätzlich ein Bewusstsein dafür zu schaffen, wie die Standarderweiterung der Projektbudgetgenehmigung bei Public-Cloud Kunden gewinnbringend eingesetzt werden kann.

= Theoretische Grundlagen
== Projektbudgetierung Grundlagen 
Betrachtet man die Grundlagen der Projektbudgetierung, so ist zunächst wichtig zu definieren, was man unter einem Projekt versteht. Dabei gibt es keine einheitliche Definition für den Projektbegriff. Deshalb ist es von großer Relevanz, mehrere Definitionen zu nennen und diese zu vergleichen. 

Ein Projekt ist ein Vorhaben, das im Wesentlichen durch Einmaligkeit der Rahmenbedingungen in seiner Gesamtheit und seinen Zusammenhängen gekennzeichnelt ist @Multiprojektmanagement. Die
Rahmenbedingungen sind nach @Multiprojektmanagement:
  - neuartige und komplexe Zielvorgaben 
  - definierter Zeit- und Kostenrahmen 
  - multidisziplinäre Aufgabenstellung 
  - Fachkenntnisse und Aufgabenbereiche 
  - Risikobehaftet

Das deutsche Institut für Normung (DIN) (zitiert nach @Projektmanagement) definiert ein Projekt als ein "Vorhaben, das im Wesentlichen durch Einmaligkeit der Bedingung in ihrer Gesamtheit gekennzeichnet ist." Die Einmaligkeit der Bedingung kann sich beziehen auf die "Zielvorgabe, zeitlich, finanzielle, personelle oder andere Begrenzungen, projektspezifische Organisation" (DIN 69901-5:2009-01,S.11).

Vergleicht man die Definitionen, so fällt auf, dass in beiden Definitionen ein Projekt als zeitlich befristete Vorhaben mit einem festen Kostenrahmen definiert wird. Im Gegensatz zu einer Kostenstelle, die dauerhaft anfallende Kosten, nach den Stellen an denen die Kosten anfallen ansammeln @Schnelleinstieg_Controlling. 

//Übergang zur Kostenstelle ?

Zu einem Projekt gehört ebenfalls das Projektbudget, welches ein wichtiges Element zur Steuerung von Projekten ist #cite(<Handbuch_Projektmanagement>, supplement: "S. 337").
Unter einem Budget ganz allgemein versteht man "wertmäßige Plangrößen (z.B. Einzahlungen/Auszahlungen, Einnahmen/Ausgaben, Aufwendungen/Erträge, der Kosten/Erlöse)" #cite(<Handbuch_Projektmanagement>,supplement: "S. 337"). 
Hingegen "die Budgetierung bezeichnet den Prozess der Erstellung, Verabschiedung und Kontrolle der Budgets sowie eventuelle Anpassungen" #cite(<Handbuch_Projektmanagement>,supplement: "S. 338").

//Hier fehlen die Quellen du Dummkopf

Im Rahmen der Projektbudgetierung werden für ein Projekt ein Gesamtbudget und Einzelbudgets aufgestellt, aufgeteilt, kontrolliert und evtl.  angepasst #cite(<Handbuch_Projektmanagement>,supplement: "S. 337").
Die Projektbudgetierung stellt einen zentralen Bestandteil der Projektplanung dar und spezifiziert den Projektplan im Hinblick auf die erforderlichen Ressourcen #cite(<Handbuch_Projektmanagement>,supplement: "S. 337"). Dabei wird zwischen variablen und fixen Budgetkosten sowie verschiedenen Budgetkostenarten differenziert #cite(<Handbuch_Projektmanagement>,supplement: "S. 337").  Die Umwandlung fixer in variable Projektkosten führt dabei zu einer gesteigerten Flexibilität während des Projektverlaufs #cite(<Handbuch_Projektmanagement>,supplement: "S. 337").

Unter fixen Kosten versteht man Kosten, die unabhängig von der Produktionsmenge anfallen. Ein Beispiel für fixe Kosten im Projektrahmen wäre die Miete für die benötigten Büroräume #cite(<Mikroökonomik>,  supplement: "S.204"). 

Unter variablen Kosten hingegen versteht man Kosten, die abhängig von der Produktionsmenge sind. Beispielsweise sind die Lohnkosten für projektbezogene Arbeitskräfte variabel #cite(<Mikroökonomik>, supplement: "S.204").
Zudem ermöglichen unterschiedliche Projektkostenarten, spezifische Schwerpunkte in der Steuerung des Projekts. Methoden wie die Budgetsimulation, der Soll-Ist-Vergleich und die Abweichungsanalyse sind wesentliche Instrumente, um das Projektbudget präzise zu planen und bei Bedarf anzupassen #cite(<Handbuch_Projektmanagement>,supplement: "S.337").


== SAP S/4HANA
=== Grundlagen S/4HANA 
Die SAP SE ist ein 1972 gegründetes deutsches Unternehmen mit dem Hauptsitz in Walldorf @SAP_1972, welches bezogen auf die Marktkapitalisierung das wertvollste deutsche DAX-Unternehmen ist (Stand: September 2024, @Marktkapitalisierung_SAP) und zudem Stand 2023 Marktführer bei ERP-Systemen ist #cite(<ERP-Systeme_Book_Sarferaz>, supplement: "S.7").
Mit der Einführung von S/4HANA im Jahr 2015 hat SAP einen bedeutenden Schritt in der Entwicklung von #acr("ERP")-Systemen gemacht @SAP_1972. SAP S/4HANA ist ein ERP-System, das zur Planung von Unternehmensressourcen dient und sämtliche Abläufe funktionsübergreifend unterstützt #cite(<ERP_System_Brugger>,supplement: "S.96"). S/4HANA steht für die Bezeichnung High-performance Analitic Appliance (HANA) @HANA_Abkürzung_Informationen. Als Nachfolger der SAP Business Suite aus dem Jahr 2004 und Ablösung von SAP R/3, das erstmals eine Client-Server-Technologie einsetzte, bietet S/4HANA eine Reihe von Innovationen @SAP_1972.
Das Herzstück eines S/4HANA-Systems ist die HANA Datenbank, eine spaltenbasierte In-Memory Datenbank, die im Vergleich zu herkömmlichen Datenbanken einen schnelleren Datenzugriff und bessere Analysezeiten ermöglicht @HANA_Abkürzung_Informationen. Durch diese Eigenschaft können Echtzeitanalysen und Berechnungen zur Laufzeit realisiert und ermöglicht werden @HANA_Abkürzung_Informationen. Dies ist insbesondere bei der Verarbeitung von Big Data Analysen von großer Bedeutung @S4HANA_Overview.

S/4HANA bietet ebenfalls eine neue veränderte Benutzeroberfläche, namens SAP Fiori, die die bisherigen SAP GUI-Oberflächen ablöst @SAP_Fiori_Informationen. SAP Fiori ist dabei browserbasiert, was bedeutet, dass keine spezielle Software lokal auf dem Gerät installiert werden muss @SAP_Fiori_Informationen. Nutzer können SAP Fiori plattformunabhängig und flexibel über gängige Browser wie Google Chrome, Mozialla Firefox oder Safari aufrufen @SAP_Fiori_Informationen. Durch die Nutzung von SAP-Fiori Werkzeugen und -Vorlagen können Apps schnell entwickelt und eine konsistente Benutzererfahrung in den Apps bereit gestellt werden @SAP_Fiori_Overview.

Grundsätzlich haben Unternehmen bei SAP S/4HANA verschiedene Bereitstellungsoptionen @SAP_Deployment_Options : On-Premise, Private Cloud oder Public Cloud.


Die SAP S/4HANA Public Cloud ist die #acr("SaaS")-Edition der SAP S/4HANA ERP-Systems, dabei handelt es sich um eine öffentliche Cloud, die von SAP gehostet und betrieben wird @SAP_Deployment_Options. Bei diesem Modell  wird die Software-Instanz mit anderen Kunden geteilt und über ein Abonnementsystem zur Verfügung gestellt @SAP_Deployment_Options.
Erweiterungen der SAP S/4HANA Cloud werden durch die SAP #acr("BTP")-Extension Suite mit von SAP freigegebenen und verwalteten Application Programming Interfaces ("whitelisted APIs") ermöglicht @SAP_Deployment_Options.

Die SAP S/4HANA Private Cloud ermöglicht den Kunden, ihre Deployment-Option genau auf ihre Bedürfnisse abzustimmen.  Diese Option basiert auf dem S/4 On-Premise Solution Stack, der in der private Cloud gehostet und von Hyperscalern verwaltet wird @SAP_Deployment_Options.

Bei der On-Premise Lösung hosten Unternehmen die Software auf eigenen Servern, während bei der Private-Cloud Lösung die Software auf Servern von Drittanbietern (Hyperscalern) als Single-Tenant betrieben wird @SAP_Deployment_Options. Single-Tentant beschreibt in diesem Kontext, eine dedizierte, isolierte Cloud Umgebung, die nur für den spezifischen Kunden bereitgestellt wird @Multi_Single_Tenant. Im Gegensatz zu einer Multi-Tenant-Umgebung, in der mehrere Kunden (Mandanten) die gleiche Software-Instanz teilen, hat der Kunde in einer Single-Tenant-Lösung seine eigene Instanz der SAP-Software @Multi_Single_Tenant. 

Die beiden eben beschriebenen Varianten bieten eine hohe Flexibilität für Unternehmen, um die Software an ihre individuellen Anforderungen und Geschäftsprozesse anzupassen @SAP_Private_Cloud. 
Im Gegensatz dazu müssen sich Unternehmen bei der Public-Cloud-Lösung weitesgehend an den Standard des Systems halten, da die Software in einer Multi-Tenant-Architektur läuft und nur bedingt modifiziert werden kann @SAP_Anpassungen_Standard_Public_Cloud. Die On-Premise Lösung hingegen wird als Product as a Service unterstützt, jedoch nur noch bedingt vermarktet @S4HANA_Deployment_Options.

Die bedingte Anpassbarkeit der Public Cloud stellt Unternehmen vor die Herausforderung ihre Prozesse an den Standard anzupassen @SAP_Anpassungen_Standard_Public_Cloud. 

SAP hat diese Problematik erkannt und bietet mit der Clean Core Strategie eine Lösung, welche sowohl die Vorteile der Standartisierung berücksichtigt, aber auch Flexibilität hinsichtlich der individuellen Anpassungen bietet @ERP_Clean_Core. 

//Hier weiter 

Die Clean Core Strategie von SAP verfolgt das Ziel, die Stabilität, Wartbarkeit und Updatesicherheit von SAP-Systemen zu verbessern @ERP_Clean_Core. Bei der Clean-Core Strategie geht es darum, den Kern (Core) des SAP-Systems standardisiert und unverändert zu erhalten @ERP_Clean_Core. Kundenspezifische Anpassungen und Erweiterungen sollen außerhalb des Kernsystems in seperaten Erweiterungsumgebungen, beispielsweise der #acr("BTP") durchgeführt werden @ERP_Clean_Core. Durch die Verwendung von definierten Schnittstellen, Erweiterungspunkten und #acr("API")s können Unternehmen ihre SAP-Systeme flexibel an Geschäftsanforderungen anzupassen, ohne den Kern zu verändern @ERP_Clean_Core. 

Dies ermöglicht eine bessere Wartbarkeit und schnellere Updates, da die Integrität des SAP-Cores erhalten bleibt @ERP_Clean_Core.
=== Grundlagen Projektsystem (PS)
// Was versteht man unter einem Projekt ?

Innerhalb des Projektmanagements unterscheidet man zwischen fremdfinanzierten (Kundenprojekte) und eigenfinanzierten Projekten (Gemeinkostenprojekte oder Investitionsprojekte). Unter Gemeinkosten allgemein versteht man Kosten , die nicht direkt einem Produkt zugeordnet werden können #cite(<Handbuch_Erfolgsrechnung_Wertsteigerung>, supplement: "S. 257").
Das #acr("PS") ist ein zentraler Bestandteil des #acr("ERP")-Systems von SAP und spielt eine wesentliche Rolle bei der Verwaltung von Projekten. Durch das Projektsystem PS der SAP können die Planung, die Steuerung und die Überwachung von komplexen Geschäftsprojekten erleichtert werden. Zudem können Module wie das #acr("FI"), das #acr("CO") und die #acr("MM") integriert werden. 

Der Ablauf eines Projekts im SAP PS kann in mehrere aufeinander aufbauende Phasen untergliedert werden. 
Die erste Phase umfasst die Projektinitialisierung, dabei wird das Projekt definiert und die ersten Planungsdaten erfasst. Dazu wird ein #acr("PSP") erstellt, der die zentralen Meilensteine und Arbeitsblöcke enthält. Die "Arbeitsblocke" sind die letzendlichen PSP-Elemente, die genuztz werden, um das Projekt zu strukturieren.
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
, image(width: 15cm,
"assets/BTP001_2406_U2L2_01.png"
))
<sap_portfolio_btp>

=== Grundlagen BTP //BTP Grafik in den Anhang 
// Grundlagen direkt darunter oder extra Kapitel 
Die #acr("BTP") der SAP ist eine Innovationsplattform im SAP-Ökosystem @SAP_BTP, welche für SAP-Anwendungen in der Cloud optimiert ist @SAP_BTP. Sie unterstützt Unternehmen bei digitalen Transformationsprozessen und hilft, innovative Geschäftsanwendungen zu entwicklen @SAP_BTP . Dabei stellt die #acr("BTP") eine Schnittstelle zwischen bestehenden Systemen und der Entwicklung neuer Technologien und Anwendungen dar (@sap_portfolio_btp). Dabei können Geschäftsprozesse miteinander verbunden, erweitert geplant und integriert werden @SAP_BTP. Durch die Möglichkeit einer Low-Code und Pro-Code Anwendungsentwicklung bietet die #acr("BTP") eine intuitive Entwicklungsumgebung, um die Geschäftsprozesse des Zielunternehmens beschleunigt aber trotzdem kontrolliert, in einer Sicheren Umgebung, zu entwicklen @SAP_BTP.

Die #acr("BTP") stellt das SAP Build Tool bereit, welches mit Hilfe von KI die Entwicklung und Automatisierung von Anwendungen beschleunigt @SAP_Build. 


Die #acr("BTP") bietet vorkonfigurierte Datenmodelle, Integrationen von Workflows, #acr("API")s und #acr("KI") Services @SAP_BTP. Durch diese Dienste können neue Anwendungen bereitgestellt werden, Prozesse integriert, Aufgaben automatisiert, Anwendungen mit Chatbots versehen und Daten und deren Auswirkungen für das gesamte Unternehmen analysiert werden @SAP_BTP. Dadurch können Unternehmen ihre Prozesse optimieren, Innovationen vorantreiben und Wettbewerbsvorteile erlangen, da diese flexibel auf sich ändernde Marktanforderungen reagieren können.

Die #acr("BTP") basiert auf einem modularen Konzept und umfasst folgende Hauptbereiche in einer zentralen Umgebung: Das Datenbank/Datenmanagement darunter auch die Echtzeitsichten von Daten, die Analytik, die Anwendungsentwicklung und Automatisierung, die Integration und Künstliche Intelligenz (@sap_portfolio_btp)@SAP_BTP. 

=== SAP Build Process Automation
SAP Build bietet unterschiedliche Tools und Werkzeuge auf der #acr("BTP") an, die den Anwender bei der Entwicklung und Automatisierung von Anwendungen unterstützen @SAP_Build.
Ein zentrales Element ist die Build Process Automation, die als SAP-Lösung zur Prozessautomatisierung dient. Sie unterstützt dabei Workflows und Bots, sowohl für SAP- als auch für Fremdsysteme @SAP_Build. Die Plattform ermöglicht es, Prozesse grafisch darzustellen und über einen KI-gestützten Editor, der Drag-and-Drop-Funktionalitäten bietet, Automatisierungen ohne Programmierkenntnisse zu erstellen und anzupassen @SAP_Build.

#figure(caption:
"SAP Business Process Automation Editor"
, image(width: 15cm,
"assets/Business Process Automation.jpg"
))
<Business_Process_Automation>

Durch die geringe Komplexität werden keine spezialisierten Entwickler benötigt, um Prozesse zu automatisieren, da dies durch die Low-Code/No-Code Entwicklung durch die entsprechenden Fachbereiche entwickelt werden kann (@Business_Process_Automation). Zudem werden vorkonfigurierte Szenarien bereitgestellt, um Standardabläufe automatisieren zu können @SAP_Build.

=== SAP Workflow Management Tool
Ein weiteres Feature der SAP Business Process Automation ist das SAP Workflow Management Tool @SAP_Build_Workflow. 


#figure(caption:
[SAP Workflow Management #cite(<Workflow_Management_Abbildung>)]
, image(width: 15cm, "assets/workflow-management.png"
))<workflow_management>

Der Begriff "Workflow" wird von der SAP wie folgt definiert:
Unter einem Workflow versteht man die "Abfolge von miteinander verbundenen Aktivitäten oder Aufgaben, die ausgeführt werden, um ein bestimmtes Ergebnis zu erzielen" @SAP_Workflow. Aufeinanderfolgende zu bearbeitende Prozessschritten werden sobald die Workflow-Instanz aufgerufen wird abgearbeitet @SAP_Workflow.

Betrachtet man den Begriff Workflow-Mangement so wird dieser als "Prozess der Digitalisierung einzelner Prozesse und die Verwaltung der Ergebnisse definiert" @SAP_Workflow. Die @workflow_management zeigt das Potential des Workflow Managements auf. Dabei stehen auf der linken Seite die Applicationen für welche Workflows zur automatisierung verwendet werden können. Auf der rechten Seite der Abbildung werden die nutzbaren #acr("API")s gezeigt, und welche "Aufgaben" durch Workflows automatisiert werden können (@workflow_management).

Das Feature ermöglicht die Prozessautomatisierung durch die einfache Erstellung eines Workflows mit Hilfe von Drag and Drop - Funktionalitäten (siehe @workflow_editor). Dabei können Formulare verwaltet, eine Entscheidungslogik verwaltet und Prozessabläufe erstellt, angepasst und organisiert werden @SAP_Build_Workflow. 

//Link/Quelle einfügen
#figure(caption:
"SAP Workflow Editor"
, image(width: 15cm,
"assets/Workflow-2.png"
))
<workflow_editor>

= Wissenschaftliche Methodiken
// Inhaltsananalyse nach Myring
// Inhaltsanalyse nach Kuckartz
// Wichtig: Warum wurden folgende Methoden gewählt 

// Gibt es eine wissenschaftliche Methode zur Implementierung 
//*Aufzählung möglicher Methoden 

== Auswahl der Methodiken 
Zur methodischen Erarbeitung des vorliegenden Themas kommen verschiedene Vorgehensweisen in Betracht.
Dazu gehören Experteninterviews, Umfragen, Qualitative Inhaltsanalyse nach Mayring, Literaturrecherche und die Evaluierung.

Ausgewählt wurden dabei die Durchführung von Experteninterviews zur Ermittlung von Informationen und Anforderungen rund um die Projektbudgetierung in einem SAP S/4HANA Public Cloud System. Die qualitative Inhaltsanalyse nach Mayring soll zur Ableitung der Anforerungen an die Standarderweiterung dienen. 
Zusätzlich werden anhand von Literaturrecherche die theoretischen Grundlagen der Arbeit untersucht. 


Das erste Auswahlkriterium war die Frage nach einer qualitativen Vorgehensweise, da eine quantitative Vorgehensweise bei einer sehr neuen Standraderweiterung nur wenig Grundlage findet. 

Die Literaturrecherche eignet sich im Grundlagenteil der Arbeit dazu, relevante Informationen an die Standarderweiterung zu erarbeiten. Als weiterer methodischer Ansatz wurden die 
//Auswahlkriterien -> quantitative
//Auswahlkapitel //Umsetzbarkeit Warum die Methode 
== Experteninterviews

//Aufbau einer Frage zeigen (Wie werden solche Fragen in einem Interview aufgebaut )

Für die Gewinnung der Informationen zu dieser Arbeit wurden verschiedene Interviews durchgeführt. Dabei wurden verschiedene Funktionsfelder befragt, um mehrere Sichtweisen und Perspektiven zu ermöglichen. Es wurden Experten der Entwicklung also der technischen Sicht der Projektbudgetierungsgenehmigung als auch Berater und Kunden für einen prozessualen Einblick befragt. 
Die Interviews wiesen dabei einen semistrukturierten Aufbau auf. Das bedeutet, dass die Interviews anhand der Leitfäden geführt wurden, jedoch von diesem je nach Gesprächsverlauf und Fachgebiet abgewichen werden kann.
 
//Semistrukturierte Leitfadeninterviews


== Qualitative Inhaltsanalyse nach Mayring





= Anforderungserhebung


== Interviewleitfäden
*Interviewleitfaden Berater*

+ Können Sie bitte Ihre berufliche Rolle und Aufgabe beschreiben ?

+ Welche Relevanz hat ein Projektgenehmigungstool bei den Kunden ? 

+ Gibt es viele Kunden die Nachfrage nach einem Projektgenehmigungstool haben ?

+ Welche Anforderungen haben Sie das Projektbudgetgenehmigungstool ?

+ Welche Vorteile bietet ein Projektgenehmigungstool für Ihre Kunden ?


*Interviewleitfaden Kunde*

+ Können Sie bitte Ihre berufliche Rolle und Aufgabe beschreiben ?

+ Nutzt ihr Unternehmen ein Projektgenehmigungstool um Budgets zu genehmigen ? 

+ Welche Herausforderungen haben Sie aktuell im Genehmigungsprozess für Projektbudgets in Ihrem Unternehmen?

+ Welche Vorteile bietet ein Projektgenehmigungstool Ihrer Meinung nach für Ihr Unternehmen ?

+ Welche Anforderungen haben Sie an das Projektbudgetgenehmigungstool ?
== Auswertung der Experteninterviews
== Darstellung und Priorisierung der Experteninterviewergebnisse

= Implementierung der Standarderweiterung
Um die Standarderweiterung implementieren zu können, stellt die SAP einen Configuration & User Guide auf dem Business Accelerator Hub zur verfügung @SAP_Guide. 
In der Webanwendung "Business Accelerator Hub" der SAP findet man alle #acr("API")s, die für die S/4HANA Cloud öffentlich verfügbar sind @SAP_Accelorrator_Hub. Diese können dabei ermittelt, erkundet und getestet werden @SAP_Accelorrator_Hub. 

== Überblick SAP S/4HANA Extension - Budget Approval 
#figure(caption:
[SAP S/4HANA Extension - Budget Approval #cite(<SAP_Guide>)],
image(width: 10cm,
"assets/BudgetApproval.png"
))
<budget_approval>



Die Abbildung zeigt eine Übersicht über den Genehmigungsprozess (@budget_approval). Der Budgetgenehmigungsprozess ermöglicht Kunden Genehmigungen oder Überprüfungen des geplanten Budgets zu automatisieren. //Quelle User Guide 
Dabei greift der Enduser auf das Fiori Launchpad zu. Das Fiori Launchpad ist der allgemeine Einstiegspunkt zu SAP Fiori-Anwendungen auf mobilden und Dektop-Geräten @SAP_Fiori_Launchpad. 

Der erste Schritt des Budgetgenehmigungsprozesses ist der Geschäftsanwender (Antragssteller) welcher eine Budgetvorlage in Excel hoch lädt und die Genehmigung des Budgets beantragt. //Quelle 

Dabei werden die Genehmigungsgruppen anhand des Genehmigungsbudgets und der Währung bestimmt (siehe )

//ASXRgrQRAPXlMk>VXTfida9scAoXJtgAunyAvRmc
//https://my300470-api.s4hana.ondemand.com



= Evaluierung der Ergebnisse 

= Zusammenfassung

== Fazit

== Kritische Reflexion der Arbeit 

== Ausblick

