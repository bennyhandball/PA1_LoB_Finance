#import "supercharged-dhbw/2.1.0/acronym-lib.typ": *
#import "supercharged-dhbw/2.1.0/check-attributes.typ": *
#import "supercharged-dhbw/2.1.0/confidentiality-statement.typ": *
#import "supercharged-dhbw/2.1.0/declaration-of-authorship.typ": *
#import "supercharged-dhbw/2.1.0/lib.typ": *
#import "supercharged-dhbw/2.1.0/titlepage.typ": *
#import "acronyms.typ": acronyms
#import "supercharged-dhbw/2.1.0/appendix.typ": appendix
#import "abstract.typ": abstract


#show: supercharged-dhbw.with(
  title: "Projektbudget in SAP S/4HANA: Implementierung und Analyse eines Genehmigungsprozesses mithilfe des SAP Build Process Automation Tools auf der Business Technology Platform",
  short-title: "Projektbudget-Genehmigung in SAP S/4HANA ",
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
  abstract: abstract,
  date: datetime.today(),
  language: "de", // en, de
  supervisor: (
    company: (
      name: "Nico Rubach",
      mail-address: "nico.rubach@sap.com",
      phone-number: "+496227750273"), 
    university: (
      name: "Jens Bohrmann",
      mail-address: "jens.bohrmann@zew.de",
      phone-number: "T.B.A"
      )
    ),
  
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Mannheim",
  bib-style :"ieee",

  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
)
//
// Edit this content to your liking
= Einleitung

== Motivation & Problemstellung

//FORSCHUNGSFRAGE

"Ein Ziel ohne Plan ist nur ein Wunsch." - Antoine de Saint-Exupéry @Zitat_Einstieg.

Im dynamischen Umfeld moderner Unternehmen sind klare Prozesse und eine präzise Planbarkeit unerlässlich #cite(<Prozessmanagement_Book>, supplement: "S. 5"). Dies gilt zum Beispiel für die Verwaltung von Mitarbeiterurlauben sowie für die Genehmigung von Projektbudgets.

Im Rahmen eines Urlaubsantragsprozesses beim Arbeitgeber wird meist ein Antrag an den Vorgesetzten gestellt, der diesen anschließend bewilligen oder ablehnen kann. Dabei wird in der Regel geprüft, ob der Mitarbeiter noch über ausreichende Urlaubstage verfügt.
Einen vergleichbaren Genehmigungsprozess in Bezug auf das Projektbudget findet man ebenfalls bei der Genehmigung von Projektbudgets im Unternehmenskontext. In der vorliegenden Arbeit wird solch ein Projektbudgetgenehmigungsprozess analysiert.
//Absatz kontrolliert
\

Eine präzise und transparente Budgetierung von Projekten ist essenziell, da eine unzureichende Kontrolle und ein fehlender Überblick über das Projektbudget zu finanziellen Verlusten führen und die Performance des Unternehmens beeinträchtigen können. Die Verwendung moderner Unternehmens-Anwendungssoftware (#acr("ERP")-Software), bietet hier eine entscheidende Unterstützung, um das Budget entsprechend verwalten und beplanen zu können #cite(<ERP-Systeme_Book_Gronau>, supplement: "S. 182"). Laut Dr. Siar Sarferaz, Chief Software Architekt bei SAP, versteht man unter dem Begriff #acr("ERP") eine Software, die aus mehreren Modulen besteht und dazu dient, Unternehmen zu unterstützen, indem sie eine Vielzahl von Geschäftsprozessen verwalten und steuern. Dabei können Module wie die Lagerverwaltung, die Produktplanung, der Einkauf, die Bestandskontrolle, die Fertigung, der Kundenservice und die Auftragsverfolgung in #acr("ERP")-Systemen integriert werden #cite(<ERP-Systeme_Book_Sarferaz>, supplement: "S.3").
//Absatz kontrolliert

#pagebreak()

Obwohl Genehmigungsprozesse in verschiedenen Unternehmensbereichen, wie der Urlaubsverwaltung, standardisiert sind und effizient abgebildet werden können, stellt die Projektbudgetierung in SAP S/4HANA Public Cloud eine spezielle Herausforderung dar, da im Standardumfang keine standardisierte Funktion zur Genehmigung von Projektbudgets vorhanden ist. Durch diese derzeit fehlende Funktion ist die Verwaltung und Genehmigung von Projektbudgets nur beschränkt möglich. Die Genehmigung des Projektbudgets muss daher manuell und systemfern durchgeführt werden, was zu einem erheblichen Arbeits- und Zeitaufwand führt (@Interview_Nico_Rubach, @Interview_Aysegül_Sinik, @Interview_Kunde_Anonymisiert). Eine weitere Herausforderung stellt die eingeschränkte Anpassungsmöglichkeit des SAP-Systems (SAP S/4HANA Public Cloud) dar, wenn Unternehmen ihre spezifischen Geschäftsanforderungen abbilden möchten @ERP_Clean_Core. 
//Absatz kontrolliert


Diese Herausforderung, die eingeschränkte Anpassbarkeit des SAP-Systems, kann durch eine Standarderweiterung auf der #acr("BTP") gelöst werden. Die Standarderweiterung erweitert den Standard, sodass die Verwaltung und Genehmigung von Projektbudgets ermöglicht werden kann @SAP_Guide.
Dabei wird das SAP Build Process Automation Tool auf der #acr("BTP") genutzt, um mithilfe eines Workflows eine Genehmigungsprozessautomatisierung zu ermöglichen @ERP_Clean_Core. Dafür ist zunächst relevant zu verstehen, was man unter einem Workflow versteht.
//Absatz kontrolliert


Mithilfe von Workflows können Geschäftsprozesse automatisiert, standardisiert und effizienter gestaltet werden @SAP_Workflow_Overview. Dabei können Aufgaben, Benachrichtigungen oder Berechtigungen automatisch in einer zuvor definierten Reihenfolge ausgeführt werden @SAP_Workflow_Overview. Diese Lösung bietet eine maßgebliche Optimierung des Projektbudget-Genehmigungsprozesses hinsichtlich der Entlastung der Mitarbeiter und der Effizienz, da die zuvor manuell ausgeführten Projektbudgetgenehmigungen automatisiert werden können @Workflow_source. 
Um diese Themen im Detail zu analysieren, wird im nächsten Kapitel die Struktur der Arbeit erläutert.
//Absatz kontrolliert

 
== Struktur der Arbeit

Nach der bereits behandelten Einleitung, in der die Motivation, Problemstellung sowie der Aufbau und die Zielsetzung der Arbeit erläutert wurden, folgt im zweiten Kapitel eine umfassende Darstellung der theoretischen Grundlagen

Die vorliegende Arbeit ist in sieben Kapitel gegliedert. Nach der bereits behandelten Einleitung, in der die Motivation und Problemstellung behandelt wurden, folgt nach diesem Abschnitt die Abgrenzung und Zielsetzung der Arbeit.

Im Kapitel zwei folgt eine umfassende Darstellung der theoretischen Grundlagen. Hier werden zunächst die allgemeinen Konzepte der Projektbudgetierung erläutert, bevor auf die spezifischen Aspekte des SAP S/4HANA-Systems eingegangen wird. Dazu gehören sowohl die Grundlagen von SAP S/4HANA als auch das Projektsystem. Im Anschluss wird die Business Technology Platform (BTP) als relevante technologische Innovationsplattform für die Automatisierung und das Workflow-Management im Rahmen der Projektbudgetierung vorgestellt.

In Kapitel drei werden die angewandten wissenschaftlichen Methoden diskutiert und begründet, warum die vorliegenden Methoden gewählt wurden. Nach der Auswahl der Methoden erfolgt die Durchführung von Experteninterviews. Die Experteninterviews werden geführt, um Anforderungen an die Standarderweiterung zu erheben. 

Im vierten Kapitel wird die Anforderungserhebung, basierend auf den Experteninterviews, behandelt. Die Ergebnisse werden analysiert und hinsichtlich ihrer Relevanz und Priorität eingeordnet.
Kapitel 5 beschreibt die Implementierung der im Rahmen dieser Arbeit vorgeschlagenen Standarderweiterung im SAP S/4HANA-System. 

Darauf aufbauend wird in Kapitel 6 eine Auswertung der erzielten Ergebnisse vorgenommen. Dabei wird analysiert, ob die erhobenen Anforderungen an die Standarderweiterung erfüllt werden. Die Beurteilung basiert auf der zuvor durchgeführten Implementierung. 

Die Arbeit schließt mit einer Zusammenfassung in Kapitel 7 ab. Hier werden neben dem Fazit eine kritische Reflexion der durchgeführten Arbeit, sowie ein Ausblick gegeben.
#pagebreak()
//Abschnitt kontrolliert 

== Abgrenzung der Arbeit
Gegenstand dieser Arbeit ist die Standarderweiterung zur Projektbudgetierung in der SAP S/4HANA Public Cloud Version 2408. Nachfolgende Versionen können nicht berücksichtigt werden. Die beschriebenen Funktionaliäten sind bis auf kleinere Einschränkungen auf die SAP S/4HANA Private Cloud übertragbar. Laut dem User Guide wird für die Implementierung der Standarderweiterung das Package mit den ready-to-use Komponenten genutzt, weshalb sich diese Arbeit auf dieses Package bezieht. Andere Packages können dabei nicht berücksichtigt werden.
//Abschnitt kontrolliert.
== Ziel und Gang
Das Ziel dieser Arbeit ist es, den Genehmigungsprozess von Projektbudgets in der SAP S/4HANA Public Cloud detailliert zu analysieren und zu evaluieren. Dabei soll beurteilt werden, ob die Standarderweiterung den Anforderungen, die zuvor durch die Experteninterviews erhoben wurden, entspricht.
Um die Forschungsfrage, hinsichtlich der Anforderungen, zu beantworten und eine Handlungsempfehlung abgeben zu können, soll nach der Erhebung und Analyse der Anforderungen die Standarderweiterung implementiert und die Implementierung dokumentiert und dargestellt werden. 

\
Das Ergebnis der Arbeit soll der Finance-Beratungsabteilung dazu dienen, eine möglichst optimierte, auf die Kundenbedürfnisse abgestimmte Entscheidungsfindung bereitzustellen und zusätzlich ein Bewusstsein dafür zu schaffen, wie die Standarderweiterung der Projektbudgetgenehmigung bei Public-Cloud-Kunden gewinnbringend eingesetzt werden kann. Um die Forschungsfrage fundiert beantworten zu können, ist es notwendig, zunächst ein tiefgehendes Verständnis der theoretischen Grundlagen zu entwickeln, die für die Implementierung und Evaluation der Standarderweiterung von Bedeutung sind. Daher wird im folgenden Kapitel auf die theoretischen Grundlagen eingegangen.
//Abschnitt kontrolliert

= Theoretische Grundlagen
== Projektbudgetierung Grundlagen 
Betrachtet man die Grundlagen der Projektbudgetierung, ist es zunächst wichtig, zu definieren, was man unter einem Projekt versteht. Da es keine einheitliche Definition gibt, ist es relevant, mehrere Definitionen zu nennen und diese zu vergleichen. 

\
Ein Projekt ist ein Vorhaben, das im Wesentlichen durch Einmaligkeit der Rahmenbedingungen in seiner Gesamtheit und in seinen Zusammenhängen gekennzeichnet ist #cite(<Multiprojektmanagement>, supplement: "S.113"). Die
Rahmenbedingungen sind nach A.Frick #cite(<Multiprojektmanagement>, supplement: "S.113"):
  - neuartige und komplexe Zielvorgaben 
  - definierter Zeit- und Kostenrahmen 
  - multidisziplinäre Aufgabenstellung 
  - Fachkenntnisse und Aufgabenbereiche 
  - Risikobehaftung

Diese Rahmenbedingungen werden mit der Definition des Deutschen Instituts für Normung verglichen. Das Deutsche Institut für Normung (DIN) (zitiert nach Helga Meyer #cite(<Projektmanagement>, supplement: "S.2")) definiert ein Projekt als ein "Vorhaben, das im Wesentlichen durch Einmaligkeit der Bedingung in ihrer Gesamtheit gekennzeichnet ist". Die Einmaligkeit der Bedingung kann sich dabei auf die "Zielvorgabe, zeitlich, finanzielle, personelle oder andere Begrenzungen, projektspezifische Organisation" beziehen (DIN 69901-5:2009-01, S.11).

Vergleicht man die Definitionen, so fällt auf, dass in beiden Definitionen ein Projekt als zeitlich befristetes Vorhaben mit einem festen Kostenrahmen definiert wird.
//Absatz kontrolliert

\
In der Praxis stellt sich die Frage, wie Projekte und die damit verbundenen finanziellen Ressourcen innerhalb eines Unternehmens organisiert und abgerechnet werden. In diesem Kontext ist die Unterscheidung zwischen einem Projekt und einer Kostenstelle von großer Bedeutung. Während Projekte durch ihre zeitliche Befristung und den fest definierten Kostenrahmen klare Anfangs- und Endpunkte haben, folgt die Kostenstellenrechnung einem anderen Ansatz. Dabei geht es nicht um einmalige Vorhaben, sondern um die kontinuierliche Erfassung und Kontrolle von Kosten, die dauerhaft innerhalb bestimmter Unternehmensbereiche oder Abteilungen anfallen #cite(<Schnelleinstieg_Controlling>, supplement: "S.58"). Diese Unterscheidung verdeutlicht, wie Kosten in der Unternehmensstruktur sowohl projektbezogen als auch über langfristige, laufende Kostenstellen abgebildet werden können. 
//Absatz kontrolliert

\

Zu einem Projekt gehört ebenfalls das Projektbudget, welches ein wichtiges Element zur Steuerung von Projekten ist #cite(<Handbuch_Projektmanagement>, supplement: "S. 337").
Unter einem Budget versteht man allgemein wertmäßige Plangrößen wie Einzahlungen oder Auszahlungen, Einnahmen oder Ausgaben, Aufwendungen oder Erträge, sowie Kosten oder Erlöse #cite(<Handbuch_Projektmanagement>,supplement: "S. 337"). 


Während das Projektbudget die wertmäßigen Plangrößen festlegt, die für die Projektfinanzierung von Bedeutung sind, umfasst die Budgetierung den gesamten Prozess der Erstellung, Genehmigung und Überwachung von Budgets sowie deren mögliche Anpassung #cite(<Handbuch_Projektmanagement>, supplement: "S. 338"). Somit bildet die Budgetierung den operativen Rahmen, um das Budget im Verlauf des Projekts effektiv zu steuern #cite(<Handbuch_Projektmanagement>,supplement: "S. 338").

\
Im Rahmen der Projektbudgetierung werden für ein Projekt ein Gesamtbudget sowie Einzelbudgets aufgestellt, aufgeteilt, kontrolliert und gegebenenfalls angepasst #cite(<Handbuch_Projektmanagement>, supplement: "S. 337").
Die Projektbudgetierung stellt einen zentralen Bestandteil der Projektplanung dar, da sie den Projektplan im Hinblick auf die erforderlichen Ressourcen spezifiziert #cite(<Handbuch_Projektmanagement>,supplement: "S. 337"). Dabei wird zwischen variablen und fixen Budgetkosten unterschieden, ebenso wie zwischen verschiedenen Arten von Budgetkosten #cite(<Handbuch_Projektmanagement>,supplement: "S. 337").  Die Umwandlung fixer in variable Projektkosten führt dabei zu einer gesteigerten Flexibilität während des Projektverlaufs #cite(<Handbuch_Projektmanagement>,supplement: "S. 337").
#pagebreak()
Unter fixen Kosten versteht man Kosten, die unabhängig von der Produktionsmenge anfallen. Ein Beispiel für fixe Kosten im Projektrahmen wäre die Miete für die benötigten Büroräume #cite(<Mikroökonomik>,  supplement: "S.204"). Unter variablen Kosten hingegen versteht man Kosten, die abhängig von der Produktionsmenge sind. Beispielsweise sind die Lohnkosten für projektbezogene Arbeitskräfte variabel #cite(<Mikroökonomik>, supplement: "S.204").
Zudem ermöglichen unterschiedliche Projektkostenarten, spezifische Schwerpunkte in der Steuerung des Projekts #cite(<Handbuch_Projektmanagement>,supplement: "S.337"). Methoden wie die Budgetsimulation, der Soll-Ist-Vergleich und die Abweichungsanalyse sind wesentliche Instrumente, um das Projektbudget präzise zu planen und bei Bedarf anzupassen #cite(<Handbuch_Projektmanagement>,supplement: "S.337"). Nachdem in diesem Kapitel die Grundlagen eines Projektes und der damit verbundenen Projektbudgetierung erläutert wurden, wird im Kapitel 2.2.2. Grundlagen Projektsystem, die praktische Umsetzung der theoretischen Grundlagen erklärt.
//Abschnitt kontrolliert

== SAP S/4HANA
=== Grundlagen S/4HANA 
Die SAP SE ist ein 1972 gegründetes deutsches Unternehmen mit Hauptsitz in Walldorf @SAP_1972, welches bezogen auf die Marktkapitalisierung das wertvollste deutsche DAX-Unternehmen ist (Stand: September 2024, @Marktkapitalisierung_SAP) und zudem, Stand 2023, Marktführer bei ERP-Systemen ist #cite(<ERP-Systeme_Book_Sarferaz>, supplement: "S.7").

\
Mit der Einführung von S/4HANA im Jahr 2015 hat SAP einen bedeutenden Schritt in der Entwicklung von #acr("ERP")-Systemen gemacht @SAP_1972. SAP S/4HANA ist ein ERP-System, das zur Planung von Unternehmensressourcen dient und sämtliche Abläufe funktionsübergreifend unterstützt #cite(<ERP_System_Brugger>,supplement: "S.96"). S/4HANA steht für die Bezeichnung "High-Performance Analytic Appliance (HANA) @HANA_Abkürzung_Informationen. Als Nachfolger der SAP Business Suite aus dem Jahr 2004 und als Ablösung von SAP R/3, das erstmals eine Client-Server-Technologie einsetzte, bietet S/4HANA eine Reihe von Innovationen @SAP_1972. Das Herzstück eines S/4HANA-Systems ist die HANA-Datenbank, eine spaltenbasierte In-Memory Datenbank, die im Vergleich zu herkömmlichen Datenbanken einen schnelleren Datenzugriff und bessere Analysezeiten ermöglicht @HANA_Abkürzung_Informationen. Durch diese Eigenschaft können Echtzeitanalysen und Berechnungen zur Laufzeit realisiert werden @HANA_Abkürzung_Informationen. Dies ist insbesondere bei der Verarbeitung von Big-Data-Analysen von großer Bedeutung @S4HANA_Overview. S/4HANA bietet ebenfalls eine neue veränderte Benutzeroberfläche, genannt SAP Fiori, die die bisherigen SAP-GUI-Oberflächen ablöst @SAP_Fiori_Informationen. SAP Fiori ist dabei browserbasiert, was bedeutet, dass keine spezielle Software lokal auf dem Gerät installiert werden muss @SAP_Fiori_Informationen. Nutzer können SAP Fiori plattformunabhängig und flexibel über gängige Browser wie Google Chrome, Mozilla Firefox oder Safari aufrufen @SAP_Fiori_Informationen. Durch die Nutzung von SAP-Fiori-Werkzeugen und -Vorlagen können Apps schnell entwickelt und eine konsistente Benutzererfahrung bereitgestellt werden @SAP_Fiori_Overview.

\
Grundsätzlich haben Unternehmen bei SAP S/4HANA verschiedene Bereitstellungsoptionen @SAP_Deployment_Options : On-Premise, Private Cloud oder Public Cloud. Die SAP S/4HANA Public Cloud ist die #acr("SaaS")-Edition des SAP S/4HANA #acr("ERP")-Systems, wobei es sich um eine öffentliche Cloud handelt, die von SAP gehostet und betrieben wird @SAP_Deployment_Options. Bei diesem Modell  wird die Software-Instanz mit anderen Kunden geteilt und über ein Abonnementsystem zur Verfügung gestellt @SAP_Deployment_Options. Erweiterungen der SAP S/4HANA Cloud werden durch die SAP #acr("BTP")-Extension Suite mit von SAP freigegebenen und verwalteten Application Programming Interfaces ("whitelisted APIs") ermöglicht @SAP_Deployment_Options. Die SAP S/4HANA Private Cloud ermöglicht den Kunden, ihre Deployment-Option genau auf ihre Bedürfnisse abzustimmen.  Diese Option basiert auf dem S/4-On-Premise-Solution- Stack, der in der Private Cloud gehostet und von Hyperscalern verwaltet wird @SAP_Deployment_Options. Bei der On-Premise Lösung hosten Unternehmen die Software auf eigenen Servern, während bei der Private-Cloud Lösung die Software auf Servern von Drittanbietern (Hyperscalern) als Single-Tenant betrieben wird @SAP_Deployment_Options. "Single-Tentant" beschreibt in diesem Kontext, eine dedizierte, isolierte Cloud-Umgebung, die nur für den spezifischen Kunden bereitgestellt wird @Multi_Single_Tenant. Im Gegensatz zu einer Multi-Tenant-Umgebung, in der mehrere Kunden (Mandanten) die gleiche Software-Instanz teilen, hat der Kunde in einer Single-Tenant-Lösung seine eigene Instanz der SAP-Software @Multi_Single_Tenant. 

\
Die beiden eben beschriebenen Varianten bieten eine hohe Flexibilität für Unternehmen, um die Software an ihre individuellen Anforderungen und Geschäftsprozesse anzupassen @SAP_Private_Cloud. 
Im Gegensatz dazu müssen sich Unternehmen bei der Public-Cloud-Lösung weitgehend an den Standard des Systems halten, da die Software in einer Multi-Tenant-Architektur läuft und nur bedingt modifiziert werden kann @SAP_Anpassungen_Standard_Public_Cloud. Die On-Premise Lösung hingegen wird als Product as a Service unterstützt, jedoch nur noch bedingt vermarktet @S4HANA_Deployment_Options. Die eingeschränkte Anpassbarkeit der Public Cloud stellt Unternehmen vor die Herausforderung, ihre Prozesse an den Standard anzupassen @SAP_Anpassungen_Standard_Public_Cloud. 

\
SAP hat diese Problematik erkannt und bietet mit der Clean-Core-Strategie eine Lösung, die sowohl die Vorteile der Standardisierung berücksichtigt, als auch Flexibilität hinsichtlich der individuellen Anpassungen ermöglicht @ERP_Clean_Core. 

\
Die Clean-Core-Strategie von SAP verfolgt das Ziel, die Stabilität, Wartbarkeit und Updatesicherheit von SAP-Systemen zu verbessern @ERP_Clean_Core. Bei der Clean-Core-Strategie geht es darum, den Kern (Core) des SAP-Systems standardisiert und unverändert zu erhalten @ERP_Clean_Core. Kundenspezifische Anpassungen und Erweiterungen sollen außerhalb des Kernsystems in separaten Erweiterungsumgebungen, beispielsweise der #acr("BTP") durchgeführt werden @ERP_Clean_Core. Durch die Verwendung von definierten Schnittstellen, Erweiterungspunkten und #acr("API")s können Unternehmen ihre SAP-Systeme flexibel an Geschäftsanforderungen anpassen, ohne den Kern zu verändern @ERP_Clean_Core. Dies ermöglicht eine bessere Wartbarkeit und schnellere Updates, da die Integrität des SAP-Cores erhalten bleibt @ERP_Clean_Core.
#pagebreak()
//Abschnitt kontrolliert

=== Grundlagen Projektsystem (PS)
// Was versteht man unter einem Projekt ?
In diesem Kapitel soll die praktische Umsetzung eines Projekts im SAP-Projektsystem erläutert werden. Dazu werden zunächst die nötigen Grundlagen erklärt, bevor dann auf die praktische Umsetzung eingegangen wird.

\
Innerhalb des Projektmanagements unterscheidet man zwischen fremdfinanzierten (Kundenprojekten) und eigenfinanzierten Projekten (Gemeinkostenprojekten oder Investitionsprojekten) @Projektsystem_SAP_Help. Unter Gemeinkosten versteht man allgemein Kosten, die nicht direkt einem Produkt zugeordnet werden können #cite(<Handbuch_Erfolgsrechnung_Wertsteigerung>, supplement: "S. 257"). Gemeinkostenprojekte sind dabei nur für interne Projekte bestimmt @Gemeinkostenprojekte. Zusammen mit den Kostenstellen ermöglichen Gemeinkostenprojekte die Verwaltung und Zuordnung von Gemeinkosten @Gemeinkostenprojekte. Wie der Name "Investitionsprojekte" schon andeutet, handelt es sich dabei um langfristige Investitionsprojekte, die Auswirkungen auf die zukünftige Leistung und das Wachstum eines Unternehmens haben @Investitionsprojekte.
//Abschnitt kontrolliert

Das #acr("PS") ist ein zentraler Bestandteil des #acr("ERP")-Systems von SAP und spielt eine wesentliche Rolle bei der Verwaltung von Projekten @Projektsystem_SAP_Help. Durch das Projektsystem PS der SAP können die Planung, die Steuerung und die Überwachung von komplexen Geschäftsprojekten erleichtert werden @Projektsystem_SAP_Help. Zudem können Module wie das #acr("FI"), das #acr("CO") und die #acr("MM") integriert werden @Projektsystem_Integration. Ein Projekt in SAP ERP-Systemen besteht aus einer Projektdefinition, einem Projektstrukturplan und Netzplänen #cite(<SAP_ERP-Praxishandbuch_Projektmanagement>, supplement: "S.95"). Dabei bildet die Projektdefinition den allgemeinen organisatorischen Rahmen ab, der Projektstrukturplan bildet den Aufbau des Projekts ab und die Netzpläne den Ablauf ab #cite(<SAP_ERP-Praxishandbuch_Projektmanagement>, supplement: "S.95"). Die Projektdefinition besteht aus keinem, einem oder beliebig vielen Teilprojekten, den sogenannten PSP-Elementen #cite(<SAP_ERP-Praxishandbuch_Projektmanagement>, supplement: "S.95").
//Abschnitt kontrolliert

Die gerade genannten Strukturen sollen in der Abbildung (@Projektsystem_PSP-Elemente) veranschaulicht werden. Dabei ist ein Projekt mit dem Projektnamen "SAP Implementierung" dargestellt. Dieses Projekt ist in mehrere #acr("PSP")-Elemente untergliedert und strukturiert. Die einzelnen #acr("PSP")-Elemente werden dann budgetiert. Der Ablauf eines Projekts im SAP PS kann in mehrere aufeinander aufbauende Phasen untergliedert werden, die im folgenden Abschnitt erläutert werden.

\
//Abschnitt kontrolliert

*1. Projektinitialisierung*

Die erste Phase umfasst die Projektinitialisierung, dabei wird das Projekt definiert und die ersten Planungsdaten erfasst @Projektsystem_1NT_Process_Navigator. Dazu wird ein #acr("PSP") erstellt, der die zentralen Meilensteine und Arbeitsblöcke enthält @Projektsystem_1NT_Process_Navigator. Die "Arbeitsblöcke" sind die letztendlichen PSP-Elemente, die genutzt werden, um das Projekt zu strukturieren @Projektsystem_1NT_Process_Navigator.
//Abschnitt kontrolliert

\
*2. Projektplanung*

Anschließend folgt die Projektplanung, wobei der Detaillierungsgrad erhöht wird und mit Ressourcen, Terminen und Kosten kalkuliert wird. 

@Projektsystem_1NT_Process_Navigator. 
//Abschnitt kontrolliert

\
*3. Projektdurchführung*


Der nächste Schritt umfasst die eigentliche Projektdurchführung. Dabei werden die zuvor erstellten Projektpläne operativ umgesetzt @Projektsystem_1NT_Process_Navigator. Um eine effiziente Projektdurchführung zu ermöglichen, werden Aufgaben konkret zugewiesen und Fortschritte überwacht @Projektsystem_1NT_Process_Navigator. 
Über die gesamte Projektdauer ist das #acr("CO") unerlässlich, da dieses dabei die Kosten, Termine und die Qualität überwacht @Projektsystem_1NT_Process_Navigator. Zudem werden in dieser Phase Abweichungsanalysen und das Risikomanagement durchgeführt.

\
//Abschnitt kontrolliert
*4. Projektabschluss*

Der letzte Schritt ist der Projektabschluss @Projektsystem_1NT_Process_Navigator. Dieser erfolgt nach der Fertigstellung des Projekts @Projektsystem_1NT_Process_Navigator. In diesem Schritt erfolgt die letztendliche Kontrolle und Abrechnung. Zudem werden alle Ergebnisse dokumentiert und das Projekt wird formal beendet @Projektsystem_1NT_Process_Navigator. 
//Abschnitt kontrolliert
#pagebreak()

// Grundlagen
//!  Muss gemacht werden
//? Frage ich nach
//* Highlight

== Business Technology Platform (BTP)
#figure(caption:
[SAP cloud applications and SAP BTP @BTP_Sonne]
, image(width: 11cm,
"assets/Überblick_SAP_Sonne.jpg" 
))
<sap_portfolio_btp>

=== Grundlagen BTP 

Die #acr("BTP") der SAP ist eine Innovationsplattform im SAP-Ökosystem @SAP_BTP, die für SAP-Anwendungen in der Cloud optimiert ist @SAP_BTP. Sie unterstützt Unternehmen bei digitalen Transformationsprozessen und hilft, innovative Geschäftsanwendungen zu entwickeln @SAP_BTP.

Dabei stellt die #acr("BTP") eine Schnittstelle zwischen bestehenden Systemen und der Entwicklung neuer Technologien und Anwendungen dar (@sap_portfolio_btp). Des Weiteren können Geschäftsprozesse miteinander verbunden, erweitert, geplant und integriert werden @SAP_BTP. Durch die Möglichkeit einer Low-Code und Pro-Code Anwendungsentwicklung bietet die #acr("BTP") eine intuitive Entwicklungsumgebung, um die Geschäftsprozesse des Zielunternehmens beschleunigt aber trotzdem kontrolliert, in einer sicheren Umgebung, zu entwickeln @SAP_BTP.
//Abschnitt kontrolliert

Die #acr("BTP") stellt das SAP Build Tool bereit, das mit Hilfe von KI die Entwicklung und Automatisierung von Anwendungen beschleunigt @SAP_Build. Zudem bietet die #acr("BTP") vorkonfigurierte Datenmodelle, Integrationen von Workflows, #acr("API")s und #acr("KI") Services @SAP_BTP. Durch diese Dienste können neue Anwendungen bereitgestellt werden, Prozesse integriert, Aufgaben automatisiert, Anwendungen mit Chatbots versehen und Daten und deren Auswirkungen für das gesamte Unternehmen analysiert werden @SAP_BTP. Dadurch können Unternehmen ihre Prozesse optimieren, Innovationen vorantreiben und Wettbewerbsvorteile erlangen, da diese flexibel auf sich ändernde Marktanforderungen reagieren können @SAP_BTP.
//Abschnitt kontrolliert

\
Die #acr("BTP") basiert auf einem modularen Konzept und umfasst folgende Hauptbereiche in einer zentralen Umgebung: Das Datenbank-/Datenmanagement darunter auch die Echtzeitsichten von Daten, die Analytik, die Anwendungsentwicklung und Automatisierung, die Integration und Künstliche Intelligenz (@sap_portfolio_btp)@SAP_BTP. 
//Abschnitt kontrolliert

=== SAP Build Process Automation
Das SAP Build Tool auf der eben beschriebenen #acr("BTP") bietet unterschiedliche Tools und Werkzeuge an, die den Anwendern bei der Entwicklung und Automatisierung von Anwendungen unterstützen @SAP_Build. Ein zentrales Element des SAP Build Tools ist die Build Process Automation, die als SAP-Lösung zur Prozessautomatisierung dient. Das SAP Build Process Automation Tool unterstützt dabei Workflows und Bots, sowohl für SAP- als auch für Fremdsysteme @SAP_Build. Die Standarderweiterung wird ebenfalls über das SAP Build Process Automation Tool umgesetzt.
//Abschnitt kontrolliert

\
Das Vorgängertool zu der SAP Build Process Automation war das Workflow-Management Tool auf der #acr("BTP"). Die Funktionen des Workflow-Management Tools wurden dann in den Funktionsumfang des SAP Build Process Automation Tools übernommen. Da die Standarderweiterung auf dem SAP Workflow Management Tool basiert und seitdem nicht mehr aktualisiert und angepasst wurde, können Funktionen wie das neue SAP Build Process Automation UI, bei dem eigentlichen Projektbudgetgenehmigungsprozess, nicht genutzt werden, weshalb auf das ältere Workflow-Management UI zurückgegriffen werden muss. Um die veralteten, nicht mehr unterstützten Funktionen zu ersetzen, wäre eine Weiterentwicklung und Aktualisierung des genutzten Packages der Standarderweiterung notwendig. 
//Abschnitt kontrolliert

\
Da im gerade beschriebenen Abschnitt auf die Grundlagen und Herausforderungen des SAP Build Process Automation und Workflow Tools eingegangen wurde, folgt eine Betrachtung des Begriffs "Workflow" und der Funktionsweise von Workflows im Kontext der SAP Build Process Automation, die in der vorliegenden Arbeit eine zentrale Rolle spielen. 

\
Der Begriff "Workflow" wird von der SAP wie folgt definiert:
Unter einem Workflow versteht man die "Abfolge von miteinander verbundenen Aktivitäten oder Aufgaben, die ausgeführt werden, um ein bestimmtes Ergebnis zu erzielen" @SAP_Workflow. Aufeinanderfolgende zu bearbeitende Prozessschritte werden sobald die Workflow-Instanz aufgerufen wird, abgearbeitet @SAP_Workflow. Betrachtet man den Begriff Workflow-Management, so wird dieser als der Prozess der Digitalisierung einzelner Prozesse und die Verwaltung der Ergebnisse definiert @SAP_Workflow. 

\
Durch das SAP Build Process Automation Tool auf der #acr("BTP") können Workflows erstellt werden @SAP_Build_Workflow. Dabei können Formulare verwaltet, eine Entscheidungslogik verwaltet und Prozessabläufe erstellt, angepasst und organisiert werden @SAP_Build_Workflow. Da sich diese Arbeit auf das im User Guide beschriebene "ready-to-use" Package bezieht, können dabei die Prozessabläufe nur bedingt angepasst und organisiert werden @SAP_Guide.
//Abschnitt kontrolliert



= Wissenschaftliche Methodiken
//*Aufzählung möglicher Methoden 

== Auswahl der Methodiken 
Zur methodischen Erarbeitung des Themas "Projektbudget-Genehmigung in einem SAP S/4HANA-System" kommen verschiedene Vorgehensweisen in Betracht. Ausgewählt wurden dabei die Literaturrecherche, Experteninterviews, die Anforderungserhebung durch die Experteninterviews, die Implementierung und die Auswertung der Anforderungen. 
//Abschnitt kontrolliert

\
Die theoretischen Grundlagen der Arbeit wurden anhand einer systematischen Literaturrecherche ermittelt. Die Literaturrecherche eignet sich im Theorieteil der Arbeit dazu, relevante Grundlagen für die Standarderweiterung zu erarbeiten. Dabei unterscheidet man zwischen der unsystematischen Literaturrecherche und der systematischen Literaturrecherche. Bei der unsystematischen Literaturrecherche ist das Ziel, sich einen Überblick über ein Thema zu verschaffen, wenn noch keine konkrete Fragestellung entwickelt wurde @Literaturrecherche. Im Gegensatz dazu eignet sich die systematische Literaturrecherche bei einer bereits entwickelten Fragestellung und damit bei einer Suche nach spezifischer Literatur zu einem konkreten Thema @Literaturrecherche. 
//Abschnitt kontrolliert

\
Des Weiteren wurde eine Methodik für die eigentlichen Anforderungserhebung benötigt.
Das erste Auswahlkriterium war die Frage nach einer qualitativen Vorgehensweise, da eine quantitative Vorgehensweise bei einer spezifischen, wenig verbreiteten, Standarderweiterung nur wenig Grundlage findet. 
Ausgewählt wurde dabei die Durchführung von Experteninterviews zur Ermittlung von Anforderungen rund um die Projektbudgetierung in einem SAP S/4HANA Public Cloud System. Experteninterviews zählen dabei zu den qualitativen Forschungsmethoden #cite(<Experteninterviews>, supplement : "S.23").
//Abschnitt kontrolliert

Experteninterviews lassen sich in drei Typen gliedern: strukturiert, semistrukturiert und unstrukturiert @Experteninterviews_Semistrukturiert. 
Nach Sandra Wasssermann #cite(<Experteninterview_Wassermann>) ist ein semistrukturiertes, also leitfadengestütztes offenes Interview als Erhebungsinstrument zu empfehlen, da die zuvor definierten Fragen beantwortet werden können, jedoch die Freiheit und Flexibilität besteht, weitere Nachfragen stellen zu können #cite(<Experteninterview_Wassermann>, supplement: "S.57"). 
Hieran orientiert sich auch diese wissenschaftliche Arbeit. Dabei wurden Interviewleitfäden zur Orientierung definiert, von denen während des Gesprächs abgewichen werden kann. Die Interviewleitfäden sind dem Anhang zu entnehmen.
//Abschnitt kontrolliert

Für die Gewinnung der Informationen zu dieser Arbeit wurden verschiedene Interviews durchgeführt. Dabei wurden zwei verschiedene Funktionsfelder befragt, um multiple Sichtweisen und Perspektiven zu ermöglichen. 
Es wurden Experten der Beratung für einen betriebswirtschaftlichen prozessualen Einblick und Kunden für eine Kundenperspektive befragt. Für diesen Zweck wurden zwei unterschiedliche Interviewleitfäden erstellt, die eine Schnittmenge haben, jedoch einen unterschiedlichen Fokus legen. Alle Fragen dienen dabei zur Unterstützung der Beantwortung der Forschungsfrage. 
//Abschnitt kontrolliert
Vor den Interviews wurden die Experten via E-Mail kontaktiert und nach ihrem Interesse, an einem Experteninterview, zum Thema dieser Arbeit befragt. Die Fragen wurden den Experten erst während des Interviews gestellt und waren im Vorhinein unbekannt. Die eigentliche Durchführung der Interviews wurde über die Kommunikationsplattform Microsoft Teams abgehalten. Die Interviews wurden für eine anschließende Transkription des Dialogs aufgezeichnet. 

//Abschnitt kontrolliert
Experten zeichnen sich dabei durch ein detailliertes und spezialisiertes Sonderwissen in bestimmten Wissensgebieten und einzelnen Realitätsausschnitten aus #cite(<Experteninterview_Wassermann>, supplement: "S.16"). Deshalb kann gesagt werden, dass es sich bei den befragten Personen um Experten handelt, da diese über ein detailliertes und spezialisiertes Sonderwissen im Bereich Finance und Controlling verfügen.
#pagebreak()
//Abschnitt kontrolliert

Zur besseren Lesbarkeit der Interviewtexte wurden Füllwörter entfernt und unstrukturierte Aussagen in ganze Sätze überführt, wobei der Inhalt unverändert bleibt. Da bei der SAP das "Duzen" innerhalb und oftmals auch auf den Projekten verbreitet ist, wurden auch die Interviewpartner/Interviewpartnerinnen per "Du" angesprochen. Die Interviewleitfäden befinden sich dabei im Anhang.
//Abschnitt kontrolliert

\
 Die gewonnenen Anforderungen werden anschließend mit Hilfe einer Anforderungserhebung herausgearbeitet (Kapitel 4.1. Auswertung der Experteninterviews). Die herausgearbeiteten Anforderungen sollen im folgenden Schritt durch die Implementierung überprüft werden. Dabei soll ausgewertet werden, ob die Standarderweiterung den Anforderungen der Berater und Kunden entspricht. Auf dieser Grundlage soll dann eine Handlungsempfehlung gegeben werden. 
 //Abschnitt kontrolliert




= Anforderungserhebung
Um eine Anforderungserhebung durchführen zu können, ist zunächst relevant zu definieren, was man unter einer Anforderung versteht. Nach Klaus Pohl und Chris Rupp #cite(<pohl2015basiswissenRE>, supplement: "Kapitel 1.1.2" ) versteht man unter einer Anforderung "eine Bedingung oder Fähigkeit, die von einem Benutzer (Person oder System) zur Lösung eines Problems oder zur Erreichung eines Ziels benötigt wird". 

Um im Folgenden auswerten zu können, ob die Standarderweiterung den Anforderungen der Kunden und Berater entspricht, um dann eine Handlungsempfehlung geben zu können, werden in diesem Kapitel Anforderungen aus den Experteninterviews abgeleitet und nach Relevanz priorisiert.
//Abschnitt kontrolliert

== Auswertung der Experteninterviews
In diesem Kapitel sollen, die durch die Experteninterviews erhobenen Anforderungen, dargestellt und priorisiert werden.

\
 Grundsätzlich sehen alle Experten eine hohe Relevanz in der Standarderweiterung durch den Projektbudgetgenehmigungsprozess, da sie den manuellen, zeitintensiven Aufwand beschreiben, welcher sowohl für die Berater als auch den Kunden zu Herausforderungen in den Unternehmen führt (siehe @Interview_Aysegül_Sinik, @Interview_Nico_Rubach, @Interview_Kunde_Anonymisiert). 
Deshalb sind sich alle Experten, sowohl Berater als auch der Kunde, einig, dass an oberster Stelle die Anforderung steht, den manuellen komplett durch den digitalen Prozess im SAP-System abzudecken. Dabei sollen keine Nachteile im Zuge der digitalen Umsetzung des Genehmigungsprozesses entstehen und eine Zeitersparnis durch Steigerung der Effizienz und Abschaffung des manuellen Aufwands erreicht werden (siehe @Interview_Aysegül_Sinik, @Interview_Nico_Rubach, @Interview_Kunde_Anonymisiert).
#pagebreak() 

Eine weitere Anforderung an die Standarderweiterung ist die 
Anpassbarkeit und Flexibilität des Projektbudgetgenehmigungsprozesses (siehe @Interview_Aysegül_Sinik, @Interview_Nico_Rubach, @Interview_Kunde_Anonymisiert). Dabei soll der digitale Prozess, nach Nico Rubach (@Interview_Nico_Rubach) an die Bedürfnisse des Kunden anpassbar sein, sodass dieser den eigenen Genehmigungsprozess abbilden kann. Eine weitere Anforderung stellt die Transparenz des Prozesses dar (@Interview_Aysegül_Sinik, @Interview_Nico_Rubach, @Interview_Kunde_Anonymisiert). Auch hierbei sind sich alle Experten einig, dass dies eine zentrale Anforderung darstellt. Durch die Transparenz des Prozesses kann dieser einerseits dem Kunden veranschaulicht werden, andererseits kann der Kunde dann den Prozess auch überwachen und mögliche Fehler beheben. Hinsichtlich der Transparenz ist eine weitere Anforderung die Anpassbarkeit der verantwortlichen Genehmigungsgruppen oder Personen (@Interview_Aysegül_Sinik, @Interview_Nico_Rubach, @Interview_Kunde_Anonymisiert). Dabei soll der Kunde die Verantwortlichen zuordnen können und somit auch einen Überblick über diese haben. Nach Rubach und Asyegül Sinik stellt die Dokumentation eine weitere Anforderung an die Standarderweiterung dar (@Interview_Nico_Rubach, @Interview_Aysegül_Sinik). Dabei ist laut Rubach eine eindeutige Dokumentation wichtig, um klar zu wissen, welche Systemanforderungen gegeben sein müssen, um die Standarderweiterung implementieren zu können (@Interview_Nico_Rubach). Nach Sinik ist die Dokumentation relevant, um dem Kunden eine Anleitung zu bieten, sodass der Kunde Genehmigungen erstellen kann und welche Personen für diesen Prozess von besonders hoher Relevanz sind (@Interview_Aysegül_Sinik). Für die Berater Rubach und Sinik stellt ein standardisiertes Tool eine weitere Anforderung dar,
da somit nach Rubach die Heterogenität hinsichtlich der Wege der Genehmigung und die Heterogenität der Dateiformate im Genehmigungsprozess verhindert wird und es somit eine zentrale Zugriffsfläche für den Projektbudgetgenehmigungsprozess gibt (@Interview_Nico_Rubach). Für Frau  Sinik ist ebenfalls die einfache Umsetzung und damit verbunden auch die einfache Benutzung durch beispielsweise Funktionsbausteine eine Anforderung an die Standarderweiterung (@Interview_Aysegül_Sinik). Für den Kunden ist das Umbuchen von einem PSP-Element auf ein anderes PSP-Element ebenfalls eine Anforderung an die Standarderweiterung, um nicht genutzes Budget weiter zu verbuchen (@Interview_Kunde_Anonymisiert).
//Abschnitt kontrolliert

 Die letzte Anforderung stellt nach Rubach die Kostentransparenz dar, damit der Kunde eine Kosten-Nutzen-Abwägung erstellen und somit eine Handlungsempfehlung ableiten kann (@Interview_Nico_Rubach). 
#figure(caption:
[Priorisierte Anforderungen - Budget Approval (Eigene Darstellung)],
image(width: 18cm,
"assets/Anforderungen_Priorisiert.png"
))
<Anforderungen>
Die Abbildung (@Anforderungen) zeigt die aus den Experteninterviews resultierenden Anforderungen an die Standarderweiterung. Dabei werden vier Anforderungen mit hoher Priorität festgestellt, da diese  durch alle Experten genannt werden. Die Dokumentationsanforderung wird mit einer mittleren Priorität erhoben, da sich die beiden Berater für diese Anforderung aussprechen. Des Weiteren werden vier Anforderungen festgestellt, die von jeweils einem Experten oder einer Expertin genannt werden. 

Da es sich bei der vorliegenden Erweiterung um eine Erweiterung auf dem Business Accelerator Hub handelt, ist diese Erweiterung nicht für die breite Masse an Kunden bestimmt. Aus diesem Grund stehen für diese Standarderweiterung keine konkreten Preise zur Verfügung, weshalb die Anforderung hinsichtlich der Kostentransparenz nicht analysiert werden kann. Dies gilt ebenfalls für die Standardisierung der Erweiterung. Die Anforderung "Einfachheit der Benutzung" ist subjektiv und bedarf einer individuellen Beurteilung. Zudem kann diese Anforderung nicht anhand der Implementierung beurteilt werden. 

Die erhobenen Anforderungen sollen durch die Implementierung im Kapitel 6. (Auswertung der Ergebnisse) analysiert werden, um anschließend eine Handlungsempfehlung abgeben zu können. 
//Abschnitt kontrolliert

= Implementierung der Standarderweiterung

== Übersicht SAP S/4HANA Extension - Budget Approval 
#figure(caption:
[SAP S/4HANA Extension - Budget Approval #cite(<SAP_Guide>)],
image(width: 17cm,
"assets/BudgetApproval.png"
))
<budget_approval>
In diesem Kapitel wird der Prozess der Projektbudgetgenehmigung genauer erläutert. Die Abbildung zeigt die Zielarchitektur für den Genehmigungsprozess (@budget_approval). Der zentrale Einstiegspunkt für Apps, auf mobilen und Desktop-Geräten in einem SAP-System, stellt das Fiori Launchpad dar @SAP_FLP_Einstiegspunkt (@Einstiegspunkt_FLP_ED). 
Im Fiori Launchpad stehen dem Endbenutzer verschiedene Apps zur Verfügung. Die App, die den Einstieg in den Projektbudget-Genehmigungsprozess darstellt, heißt "Import Financial Data, Submit for Approval".
#figure(caption:
[Fiori Launchpad Import Financial Data - Budget Approval (Screenshot aus dem SAP S/4HANA Public Cloud System)],
image(width: 15cm,
"assets/Fiori_Launchpad_Upload_Excel.jpg"
))
//Abschnitt kontrolliert

Die Voraussetzung, dass ein Projekt überhaupt budgetiert werden kann, ist die eigentliche Erstellung eines Projekts mit #acr("PSP")-Elementen, wie es im Kapitel 2.2.2 (Grundlagen Projektsystem (PS)) beschrieben wurde. Nachdem der Endbenutzer die App "Import Financial Data, Submit for Approval" geöffnet hat, kann dieser eine Template-Datei herunterladen und diese anschließend ausgefüllt hochladen, um den eigentlichen Workflow des Genehmigungsprozesses zu starten (@Excel_Datei). 
#figure(caption:
[Download Template - Budget Approval (Screenshot aus dem SAP S/4HANA Public Cloud System)],
image(width: 15cm,
"assets/Download_Template.jpg"
))
 
//Was versteht man unter der Plankategorie ?
In der Template CSV-Datei (Comma-separated values) müssen folgende Daten angegeben werden: die Plankategorie, das Hauptbuchsgeschäftsjahr, der Buchungszeitraum (Monat), die Projektdefinition (ID-Nummer), das zu budgetierende PSP-Element (ID-Nummer), die Kontonummer, der zu budgetierende Wert, die globale Währung und der Buchungskreis. Anschließend kann die CSV-Datei in der App "Import Financial Data, Submit for Approval" hochgeladen werden. Dabei wird die CSV-Datei automatisch auf Vollständigkeit und Korrektheit geprüft.
//Abschnitt kontrolliert 

#figure(caption:
[Download Template - Budget Approval (Screenshot aus dem SAP S/4HANA Public Cloud System)],
image(width: 15cm,
"assets/Send_Approval (1).jpg"
))

Mit dem Absenden "Send for Approval" wird der Workflow gestartet, 
und die Projektbudgetanfrage an die im Workflow hinterlegte verantwortliche Person oder Personengruppe geschickt (@budget_approval). Die Verantwortlichen werden dabei vorher in einer Entscheidungstabelle festgelegt (@Entscheidungstabelle_Budget_Approver). Dabei werden Budget-Intervalle des zu genehmigenden Budgets bestimmt und die Genehmigungsgruppe oder Person definiert zu treffen.
//Abschnitt kontrolliert
Die definierten Genehmigungsgruppen greifen anschließend auf ihren Posteingang (Inbox (@Inbox_Screenshot)) zu, um die Projektbudgetanfrage zu überprüfen und eine der folgenden Entscheidungen treffen zu können.
#figure(caption:
[Inbox - Budget Approval (Screenshot aus dem SAP S/4HANA Public Cloud System)],
image(width: 15cm,
"assets/Picture_Inbox.jpg"
))<Inbox_Screenshot>

 Die erste Möglichkeit stellt die Genehmigung des Projektbudgets dar. Wird das Projektbudget genehmigt, wird dieser Schritt als vollständig abgeschlossen betrachtet, und der nächste Genehmigungsschritt (falls erforderlich) eingeleitet. 

Wird der Projektbudget-Antrag abgelehnt, so wird der Antragsteller per E-Mail über die Ablehnung des Antrags benachrichtigt und der Vorgang der Genehmigung wird beendet. 

Falls die Anfrage von allen Genehmigungsgruppen oder Genehmigungspersonen akzeptiert wird, erhält der Antragsteller eine Bestätigungsmail mit der Nachricht, dass die Anfrage genehmigt wurde. Zusätzlich wird der Prozess als abgeschlossen betrachtet, und das Budget wird im System gebucht.
//Abschnitt kontrolliert

#figure(caption:
[Inbox - Budget Approval (Screenshot aus dem SAP S/4HANA Public Cloud System)],
image(width: 15cm,
"assets/Overview_Budget_Approval_Accept (1).jpg"
))

Im User-Guide wird dem Anwender die Wahl zwischen dem Workflow-Management-Tool und dem SAP Build Process Automation Tool gelassen, jedoch wird bei dem vorliegenden Workflow ab dem Absenden des Dokuments nur das SAP Workflow Tool UI unterstützt, da das SAP Build Process Automation UI dort nicht untersützt wird. Dies geht jedoch nicht aus dem User Guide hervor und wurde bei der Implementierung festgestellt. Aus diesem Grund unterscheidet sich das UI ab dem eigentlichen Start des Workflows zu dem vorherigen Prozess. Eine Aktualisierung des Packages könnte diese Fehler beheben und die moderneren Technologien (SAP Build Process Automation UI) integrieren.


Um die Verbindung zwischen der #acr("BTP") und dem Business Objekt im S/4HANA Public Cloud System herzustellen, wird der Connectivity Service der #acr("BTP") genutzt (@budget_approval). Dabei wird über #acr("API")s zwischen der #acr("BTP") und dem S/4HANA System kommuniziert um den Datentransfer zu ermöglichen. Der Identity Authentication Service sorgt dabei für eine sichere Verbindung. Um den Prozess möglichst transparent zu gestalten, gibt es eine App namens "Process Visibility", über welche man den aktuellen Stand der Projektbudgetgenehmigung verfolgen kann (@budget_approval). 
#pagebreak()
//Abschnitt kontrolliert

== Implementierung Budget Approval
Um die Standarderweiterung implementieren zu können, stellt die SAP einen Configuration & User Guide auf dem Business Accelerator Hub zur Verfügung @SAP_Guide. 
In diesem Configuration & User Guide findet man eine Schritt-für-Schritt-Anleitung zur Implementierung der Standarderweiterung.

Um die Standarderweiterung wie im User Guide beschrieben implementieren zu können, ist ein SAP S/4HANA Public Cloud System, sowie ein Subaccount auf der #acr("BTP") nötig. Über das #acr("BTP")-Cockpit kann der Subaccount verwaltet und konfiguriert werden. Um die Standarderweiterung implementieren und nutzen zu können sind folgende Services und Applikationen notwendig: 

#figure(caption: "Anforderungen BTP - In Anlehnung an den Konfigurationsguide", table(
  columns: (auto),
  inset: 10pt,
  align: left,
  text("SAP Application Runtime Service"),
  text("SAP Workflow Management or SAP Build Process Automation"),
  text("SAP Cloud Portal Service / SAP Launchpad Service"),
  text("SAP Document Management Service, Integration option"),
  text("SAP Cloud Identity Services - Identity Authentication (optional)"),
))<btp-voraussetzungen>
//Abschnitt kontrolliert

\
Basierend auf dem User Guide zur Umsetzung der Projektbudgetgenehmigung, erklärt das folgende Kapitel in verkürzter Form die Implementierung der Standarderweiterung. Der User Guide befindet sich dabei im Anhang der Arbeit. 
Um die Standarderweiterung umzusetzen, werden im Folgenden die erforderlichen Schritte aufgezeigt. Im #acr("BTP")-Cockpit gibt es die Möglichkeit "Destinations" anzulegen. Legt man eine Destination erfolgreich an, so stellt dies die Verbindung zu einem bestimmten Endpunkt dar. Dabei werden die benötigten Informationen und Einstellungen in der "Destination" gespeichert. Um die Standarderweiterung nutzen zu können sind drei grundlegende Destinations notwendig. 

Zunächst muss eine Verbindung zwischen der #acr("BTP") und dem S/4HANA Public Cloud Zielsystem hergestellt werden. Da es sich hierbei um eine Verbindung über das Internet handelt, wird hier das #acr("HTTP")-Protokoll benutzt. 
Eine beispielhafte Konfiguration einer Destination kann aus (@BTP_Destination) entnommen werden. Für diese Destination ist ein spezieller technischer User zur Authentifizierung mit Name und Passwort nötig. Dafür wurde innerhalb des SAP S/4HANA Public Cloud Systems ein "Communication Arrangement (Kommunikationsvereinbarung)", als Gegenstück zu dem #acr("BTP")-Endpunkt eingerichtet. Diese Konfigurationseinheit ist für die Kommunikation zwischen Systemen verantwortlich. 
Das Communication Arrangement ist eine zentrale Stelle, an der die Einstellungen für den Austausch und Zugriff von Daten zwischen Systemen vorgenommen werden. Dafür steht ein spezielles "Communication Scenario" zur Verfügung, welches die Zugriffsrollen und die Freigabe der Endpunkte steuert und beinhaltet. 

Eine weitere Verbindung muss zu dem SAP Build Process Automation Service aufgebaut werden. Da es sich hierbei ebenfalls um eine Verbindung über das Internet handelt, wird auch hier das #acr("HTTP") genutzt. Die Verbindung wird dabei zwischen der #acr("BTP") und dem SAP Build Process Automation #acr("API")-Endpunkt aufgebaut.
//Abschnitt kontrolliert

Die Letzte der drei Destinations ist die Business Rules Destination. Dabei handelt es sich um parametergesteuerte Funktionen innerhalb der SAP-Geschäftsplanung zur Berechnung und Buchung von Geldbeträgen zur Unterstützung gängiger Buchhaltungsaktivitäten @Business_rules. 

Wurden alle relevanten Destinations eingerichtet und die restlichen Anforderungen aus dem User-Guide erfüllt, so kann das Content-Package aus dem SAP Build Process Automation Store heruntergeladen und in SAP Build Process Automation als Projekt angelegt werden. Bei dem Package handelt es sich um ein ready-to-use Package, welches einen "Rule-Service" beinhaltet, indem die Projektbudget-Genehmigungsgruppen festgelegt werden können. Dies erfolgt wie bereits beschrieben in Form einer Entscheidungstabelle (@Entscheidungstabelle_Budget_Approver). Des Weiteren beinhaltet das Package den eigentlichen Workflow, der die Prozessautomatisierung ermöglicht, ein Projektbudget-Dashboard, und das Projektbudget-Genehmigungs-UI @SAP_Guide. Diese Applikation muss anschließend heruntergeladen und entpackt werden, um diese dann in der App "Business Application Studio" zu öffnen und innerhalb der Cloud Foundry-Umgebung bereitzustellen. Die Cloud Foundry-Umgebung (Laufzeitdienst) ermöglicht dabei die Entwicklung von neuen Geschäftsanwendungen und -services und unterstützt mehrere Laufzeiten, Programmiersprachen, Bibliotheken und Services @Cloud_Foundry_Environment.  Sobald der Deploy-Prozess abgeschlossen ist, kann der Zugriff über die App Build Workzone hergestellt werden.  
//Abschnitt kontrolliert

= Auswertung der Ergebnisse
In diesem Kapitel soll anhand der Implementierung überprüft werden, ob die Standarderweiterung den erhobenen Anforderungen entspricht oder ob dies nicht der Fall ist. Die Anforderungen, die auf Grundlage der Implementierung überprüft werden sollen, werden im Folgenden einzeln betrachtet und bewertet.
//Abschnitt kontrolliert

\
*1.  Vollständige Abdeckung des manuellen Prozesses*


Im Kapitel 5.1. (Übersicht SAP S/4HANA Extension - Budget Approval) wurde der durch die Standarderweiterung abgedeckte Prozess erläutert. Dabei deckt die Standarderweiterung den Prozess von der Beantragung des Projektbudgets mit dem Hochladen der CSV-Datei bis hin zur eigentlichen Budgetentscheidung und der Freigabe des Budgets im System, den kompletten Prozess ab. Dieser Prozess kann jedoch wie im Experteninterview (@Interview_Nico_Rubach) genannt, bei Unternehmen spezialisiert sein und anders aussehen. Deshalb kann gesagt werden, dass dieses Kriterium für den Standardprozess erfüllt ist, aber die individualisierten Prozesse der Unternehmen nicht abgedeckt werden können.

//Abschnitt kontrolliert
\
*2. Anpassbarkeit und Flexibilität*

Da sich die vorliegende Arbeit auf das ready-to-use Package bezieht, ist dabei das Template vorgegeben. Im @SAP_Guide wird von der Möglichkeit gesprochen, eine neue Prozess-Variante anzulegen, was jedoch mit dem ready-to-use Package nicht möglich ist. Aus diesem Grund wird diese Anforderung nicht erfüllt. Der Prozess kann deshalb nicht flexibel angepasst werden. 
//Abschnitt kontrolliert
\
\
*3. Transparenz des Prozesses*

Der Projektbudgetgenehmigungsprozess kann durch das Visibility Scenario und das Monitoring-Feature über die App SAP Build Process Automation überwacht werden. Dabei wird ein Log-Protokoll erstellt, das alle Schritte dokumentiert und somit den Prozess transparent darstellt. Die Abbildung(@SAP_Build_Monitoring) zeigt beispielhaft das Monitoring eines Projektbudgetgenehmigungsprozesses.
Der Prozess kann daher transparent dargestellt werden, wodurch diese Anforderung erfüllt ist.
//Abschnitt kontrolliert

\
*4. Genehmigungsgruppen Definition*

Die Genehmigungsgruppen können wie in der (@Entscheidungstabelle_Budget_Approver) definiert werden. Dabei können einzelne verantwortliche Personen oder verantwortliche Gruppen festgelegt werden, die dann dazu berechtigt sind das Projektbudget zu genehmigen oder dieses abzulehnen. Daher können die Genehmigungspersonen oder Genehmigungsgruppen definiert und flexibel angepasst werden, wodurch die Anforderung erfüllt ist.
//Abschnitt kontrolliert

\
*5. Dokumentation*

Wie bereits zuvor beschrieben, weicht der User-Guide von der eigentlichen Implementierung ab. Das SAP-Build Process Automation UI wird dabei nicht wie beschrieben vollständig unterstützt, wodurch bei dem eigentlichen Genehmigungs-UI auf das ältere SAP Workflow Management Tool UI umgestiegen werden musste. Zudem war die Implementierung nicht vollständig aus dem User-Guide übernehmbar, dies deutet auf eine veraltete Version des User-Guides hin, was sich später als zutreffend herausstellte. Die Inhalte zur Implementierung mussten dabei durch eine Literaturrecherche und SAP-Help-Seiten ergänzt werden. Daher wird diese Anforderung im Hinblick auf die Implementierung nicht erfüllt. Die Dokumentation bei der Kundenimplementierung kann dabei nicht bewertet werden.
//Abschnitt kontrolliert

\
*6. Umbuchbarkeit der PSP-Elemente*

Die letzte Anforderung hinsichtlich der Umbuchbarkeit der #acr("PSP")-Elemente kann nicht durch den Umfang der Standarderweiterung mit dem ready-to use Package abgedeckt werden. Deshalb, ist diese Anforderung nicht erfüllt.
//Abschnitt kontrolliert

= Zusammenfassung

== Fazit
Da eine Projektbudgetgenehmigung im Standardumfang des S/4HANA Public Cloud Systems nicht vorhanden ist, bietet die vorliegende Standarderweiterung eine technische Lösung, um die Funktion einer Projektbudgetgenehmigung in einem S/4HANA Public Cloud System zu implementieren.

Die vorliegende Arbeit untersuchte die Frage: „Entspricht die Standarderweiterung den durch Experteninterviews erhobenen Anforderungen?“ Für die Beantwortung wurde eine qualitative Untersuchung mithilfe von Experteninterviews durchgeführt. Aus den Resultaten der Interviews wurden Anforderungen abgeleitet, und diese anhand der Implementierungsergebnisse überprüft. Dadurch kann eine Handlungsempfehlung getroffen werden.
Dabei werden drei der vier hochpriorisierten Anforderungen als erfüllt eingestuft. Die Anforderung mit mittlerer Priorität wurde als nicht erfüllt eingestuft. Des Weiteren konnten die vier Anforderungen mit niedriger Priorität nicht durch den reinen Implementierungsprozess beurteilt werden.

Die Ergebnisse führen zu der Schlussfolgerung, dass die Erweiterung zum Zeitpunkt dieser Arbeit nicht den Anforderungen der Kunden und Berater gerecht wird. Daher sollte die Lösung nicht in Kundenprojekten verwendet werden. Insbesondere das fehlende SAP Build Process Automation UI ist ein weiterer Punkt, der gegen die Nutzung der Standarderweiterung spricht. Jedoch bietet sie ein Konzept, das weiterentwickelt werden kann, um weiteren Anforderungen gerecht zu werden und um weitere Funktionen zu integrieren.
#pagebreak()


== Kritische Reflexion der Arbeit
Die Arbeit zeigt deutlich, dass sowohl bei Kunden als auch bei Beratern ein Bedarf an einem automatisierten Projektbudgetgenehmigungsprozess in SAP S/4HANA besteht (siehe @Interview_Aysegül_Sinik, @Interview_Nico_Rubach, @Interview_Kunde_Anonymisiert). Durch die fehlende Standardfunktionalität in der Public Cloud stellt die erarbeitete Standarderweiterung eine wertvolle Ergänzung dar, um den manuellen Aufwand zu reduzieren und den Prozess zu automatisieren. Die durchgeführte Implementierung weist jedoch einige Schwachstellen auf, insbesondere in Bezug auf Flexibilität und Benutzerfreundlichkeit.

Eine wesentliche Herausforderung stellte die lückenhafte und veraltete Dokumentation des SAP User Guides dar. Die Implementierung erforderte eine zusätzliche Literaturrecherche und technische Anpassungen, was den Aufwand signifikant erhöhte und zu Verzögerungen führte. Auch die Umstellung auf das ältere SAP Workflow Management UI anstelle des neueren SAP Build Process Automation UI war suboptimal und zeigt, dass das bereitgestellte Package noch nicht vollständig auf die neuesten Technologien abgestimmt ist. Dies beeinflusst die Benutzererfahrung und Wartbarkeit negativ und könnte die Akzeptanz des Tools bei Kunden verringern.
Die begrenzte Flexibilität des „ready-to-use“ Packages erweist sich ebenfalls als kritisch, da kundenspezifische Anpassungen des Prozesses nur eingeschränkt möglich sind. Dieser Mangel an Anpassbarkeit steht im Widerspruch zu den Anforderungen der befragten Experten und beschränkt die Einsetzbarkeit der Lösung auf Kundenprojekten. Zudem bestand die Schwierigkeit darin, ein möglichst repräsentatives Ergebnis der Anforderungsüberprüfung darzustellen und die Anforderungen zu bewerten. Bei der Bewertung der Anforderungen wurde die eigentliche Implementierung als Bewertungsgrundlage zur Hilfe gezogen. Um weitere Anforderungen zu überprüfen, müssten zusätzliche Bewertungsinstrumente genutzt werden, um die Anforderungen detaillierter und umfassender beurteilen zu können.
#pagebreak()
Zusammengefasst liefert die Arbeit einen wichtigen Beitrag zur Automatisierung von Projektbudgetprozessen in SAP S/4HANA, verdeutlicht jedoch, dass die Standarderweiterung in ihrer aktuellen Form nur bedingt die vielseitigen Anforderungen der Nutzer erfüllt. Für eine erfolgreiche Implementierung in der Praxis sind Verbesserungen hinsichtlich der Flexibilität und Dokumentation der Erweiterung notwendig. Auch die Anpassung an das moderne SAP Build Process Automation UI sollte priorisiert werden, um langfristig eine höhere Benutzerfreundlichkeit und Aktualität der Lösung sicherzustellen.



== Ausblick
Der Bedarf an einer flexiblen und effizienten Projektbudgetgenehmigungsfunktionalität in SAP S/4HANA Public Cloud bleibt auch zukünftig relevant. Die Ergebnisse dieser Arbeit zeigen, dass die aktuelle Standarderweiterung eine solide Grundlage für die Automatisierung des Genehmigungsprozesses bietet, jedoch in Bezug auf Flexibilität, Anpassbarkeit und Benutzerfreundlichkeit weiterentwickelt werden sollte, um eine breite Akzeptanz bei Kunden und Beratern zu erreichen. Ein zukunftsweisender Ansatz könnte darin bestehen, die Erweiterung auf die neuesten Technologien und Benutzeroberflächen der SAP Build Process Automation umzustellen, um die User Experience und den Workflow noch intuitiver und effizienter zu gestalten. Darüber hinaus wäre es sinnvoll, die Erweiterung um Konfigurationsmöglichkeiten zu ergänzen, die Unternehmen eine nahtlose Anpassung an ihre spezifischen Prozesse erlauben, ohne dabei die Systemstabilität oder Wartbarkeit zu beeinträchtigen. Langfristig könnte eine umfassendere Projektbudgetgenehmigungsfunktionalität in den Standardumfang von SAP S/4HANA integriert werden, um den wachsenden Anforderungen der Unternehmen gerecht zu werden. Dies würde nicht nur die Implementierungskosten für Kunden senken, sondern auch die Wettbewerbsfähigkeit der SAP Public Cloud stärken, da eine solche Funktion Unternehmen jeder Größe und Branche dabei unterstützen würde, ihre Finanzprozesse effizienter und transparenter zu gestalten.


Die gewonnenen Erkenntnisse und Empfehlungen dieser Arbeit könnten daher als Grundlage für zukünftige Entwicklungen dienen, um einen vollständig integrierten und anwenderfreundlichen Projektbudgetgenehmigungsprozess in SAP S/4HANA zu realisieren, der den hohen Anforderungen moderner Unternehmen entspricht.

//ist alles im Präsens geschrieben ?
//Sind alle Quellen richtig  
// Einverständniss Experteninterviews 
// Verlinkungen möglich ?
//ASXRgrQRAPXlMk>VXTfida9scAoXJtgAunyAvRmc
//https://my300470.s4hana.ondemand.com
