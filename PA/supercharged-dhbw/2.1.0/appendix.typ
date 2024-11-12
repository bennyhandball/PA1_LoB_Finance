#let appendix = [
  //figure(image("assets/Business Process Automation.jpg", width: 80%), caption: [Bildgenerator Aktivierung (Eigene Darstellung)])
  //Bilder im Anhang 

    #figure(image("/PA/assets/Fiori Launchpad_Image.gif", width: 110%), caption: [Einstiegspunkt Fiori-Launchpad (Screenshot S/4HANA Public Cloud System)]) <Einstiegspunkt_FLP_ED>
    #figure(image("/PA/assets/Project_structured_PSP (1).jpg", width: 110%), caption: [Projektbeispiel mit PSP-Elementen (Screenshot S/4HANA Public Cloud System)]) <Projektsystem_PSP-Elemente>

    #figure(image("/PA/assets/Determine_Budget_Approver.jpg", width: 110%), caption: [Entscheidungstabelle-Budget Approval (Screenshot SAP Build Process Automation)]) <Entscheidungstabelle_Budget_Approver>

    #figure(image("/PA/assets/Destination_S4HANA.png", width: 110%), caption: [BTP-S/4HANA Destination (Screenshot BTP Cockpit)]) <BTP_Destination>

    #figure(image("../../assets/SAP_Build_Monitoring.png", width: 110%), caption: [SAP Build Process Automation - Monitoring (Screenshot SAP Build Monitoring)]) <SAP_Build_Monitoring>

    #figure(image("../../assets/Excel_Download.jpg", width: 13%), caption: [Excel Template - Budget Approval (Screenshot CSV-Datei)]) <Excel_Datei>

\
#v(1em)
#figure(
strong("Interviewleitfaden Berater"),  supplement: "Interviewleitfaden"
)<InterviewLeitfaden_Berater>
#text("
• Können Sie bitte Ihre berufliche Rolle und Aufgabe beschreiben ?

• Wie genehmigen Unternehmen typischerweise das Projektbudget ohne ein Projektbudget-Genehmigungstool ?

• Welche Herausforderungen treten bei der aktuellen Handhabung der Projektbudgets auf ?

• Welche Relevanz hat ein digitales Projektgenehmigungstool für Ihre Kunden ? 

• Welche Anforderungen/Kriterien sehen Sie bei Kunden für die Implementierung eines neuen Budgetgenehmigungsprozesses in SAP S/4HANA ?"
)

#v(1em)
#figure(
strong("Interviewleitfaden Anoymisierter Kunde"), supplement: "Interviewleitfaden"
)<InterviewLeitfaden_Kunde>
#text("
•  Können Sie bitte Ihre berufliche Rolle und Aufgabe beschreiben ?

•	 Wie erfolgt die Genehmigung von Projektbudgets aktuell in Ihrem Unternehmen und welche Herausforderungen gibt es dabei ?

•	Welche Relevanz hat ein digitales Projektgenehmigungstool für Sie ? 

•	Welche Anforderungen stellen Sie an einen Genehmigungsprozess für Projektbudgets ?

•	Wer wird in Ihrem Unternehmen das Projektbudget genehmigen und welche Stakeholder sind am Genehmigungsprozess beteiligt ?
")
#pagebreak()




#v(1em)
#figure(
strong("Experteninterview (SAP-Beraterin Aysegül Sinik)"), kind: raw,  supplement: "Interview"
)<Interview_Aysegül_Sinik>
 
#text("
Datum: 23.10.2024
Ort: Microsoft Teams Online Meeting
Interviewer: Benjamin Will
Interviewte Person: Aysegül Sinik (SAP)

B: Könntest Du bitte Deine berufliche Rolle und Deine Aufgabe einmal beschreiben?

A: Also, ich bin Public Cloud Business Process Beraterin und hauptsächlich in Public Cloud-Projekten tätig. Dabei bin ich im Bereich Controlling und Projektsysteme unterwegs und begleite den Kunden bei den Implementierungen bis zum endgültigen Go-Live und der Hypercare-Phase.

B: Wie genehmigen Unternehmen typischerweise ihr Projektbudget?

A: Ja, das ist immer sehr abhängig vom Unternehmen. Manchmal haben Unternehmen bestimmte Genehmigungsprozesse, bei denen sie Excel-Dateien nutzen und sich diese per Mail zuschicken oder per Mail genehmigen lassen. Dann gibt es auch Projekte oder Unternehmen, die das zum Beispiel mit Lotus Notes machen. Aber das stößt immer wieder an Grenzen bzw. ist oft ineffizient, weil es immer bestimmte Schablonen gibt, die manchmal auch technisch nicht ausreichen. Für eine Genehmigung ist es immer schwierig, eine Dokumentation zu erstellen, die man möglicherweise einem Wirtschaftsprüfer vorlegen kann, weil es dann auch manchmal Probleme gibt, die Genehmigungsprozesse in den Subsystemen oder manuelle Prozesse zu dokumentieren und die entsprechenden Vertreter zu definieren.

B: Welche Herausforderungen treten bei der aktuellen Handhabung des Projektbudgets bei den Kunden auf?

A: Ja, also die Herausforderungen bestehen zunächst darin, dass man im System ein Projekt anlegen kann, ohne einen Genehmigungsprozess im System durchführen zu müssen. Dafür müssen „nur“ die entsprechenden Berechtigungen gegeben sein. Oftmals ist es auch ein Standard aus der Historie, dass die Genehmigungsprozesse mit viel Papieraufwand abgewickelt werden. Das ist natürlich sehr zeitaufwendig und nicht nachhaltig, wenn solch eine Genehmigung in Papierform das Unternehmen durchlaufen muss und dann noch handschriftlich unterschrieben werden muss, weil jeder sein Kürzel drunter setzen muss. Gerade wenn es dann schnell gehen muss, führt das oft zu einer hohen Unzufriedenheit beim Kunden. Deswegen suchen die Kunden immer nach einem Tool, das eine gewisse Flexibilität bietet, die Genehmigungsschritte erleichtert und Transparenz schafft. Nach meinem Eindruck ist ein solcher Genehmigungsprozess, der mit viel manuellem Aufwand außerhalb des Systems verbunden ist, problematisch, weil dann auch viel vergessen wird zu genehmigen – etwa wenn das Budget im Nachhinein nochmal erhöht oder generell geändert wird und Grenzen, die bei der ersten Budgetgenehmigung nicht erreicht wurden, überschritten werden.

B: Welche Relevanz hätte so ein digitales Projektgenehmigungstool bei Deinen Kunden und hätten die Kunden wirkliches Interesse daran?

A: Ja, ich glaube, das kommt auch ein bisschen auf den Kunden an. Wenn der Kunde einen Prozess hat, der durch schlankere Prozesse ersetzt werden kann, dann schon. Aber wenn der Kunde schon außerhalb mit anderen Software-Tools einen Genehmigungsprozess implementiert hat, werden diese Kunden eher weniger Bedarf haben.

B: Welche Anforderungen oder Kriterien siehst Du bei Deinen Kunden und was wären die Anforderungen/Kriterien, die letztendlich der Kunde an diese Standarderweiterung hätte?

A: Also, zum einen muss es einfach auswählbar sein, wer das Budget genehmigt. Dabei muss der Kunde immer wissen, wer das Budget genehmigt und dass der Kunde das eben auch im Prozess zuordnen kann. Gerade im Krankheitsfall oder bei einem Langzeitausfall ist das relevant. Da wäre dann auch ein direkter Vertreter wichtig, damit direkt eine Vertretung für die ausfallende Genehmigungsperson bestimmt werden kann. Und der Genehmigungsflow muss genau aufzeigen, wo es eventuell gerade in dem Prozess hängt. Was vielleicht auch ganz gut wäre, wäre, wenn zu dem Genehmigungsprozess eben die nötige Dokumentation zur Verfügung steht. So kann der Kunde nachvollziehen, wie die Genehmigung erstellt werden muss und wen er eben zu diesen Dingen braucht. Auch ein transparenter Bericht bzw. eine transparente Sicht auf den Genehmigungsprozess wäre nötig, damit sich der Wirtschaftsprüfer diese dann auch entsprechend anschauen kann. Was auch noch wichtig wäre, ist die Kommunikation mit den Verantwortlichen – sprich mit den PS-Verantwortlichen, Kostenstellenverantwortlichen oder generell mit den Projektverantwortlichen.

B: Gibt es noch weitere Anforderungen auf der Kundenseite?

A: Also grundsätzlich sagen die Kunden immer: So einfach wie möglich. Am besten hat man Funktionsbausteine, die man per Drag-and-Drop setzen kann, um dann beispielsweise die Verantwortlichen für die betroffenen Kostenstellen direkt zuzuordnen oder, falls mal eine Vertretung nötig ist, diese direkt zuweisen zu können. Und die nötigen Informationen sollten auf einen Blick ansprechend und übersichtlich dargestellt werden. Das würde die manuelle Arbeit sehr vereinfachen und viele Telefonate ersparen, wenn man solch eine Genehmigung einfach per Klick genehmigen kann.

B: Und welche Anforderungen hättest Du denn als Beraterin?

A: Also für uns oder für mich in der Umsetzung ist es natürlich wichtig, dass wir weitestgehend mit einem standardisierten Tool arbeiten können. Damit können wir dann schnell eine passende Demo bereitstellen und diese anpassen. Wichtig ist dabei, dass wir eine gewisse Transparenz für den Kunden bieten können und die Anforderungen, die ich vorhin genannt habe, eben auch umgesetzt werden können. Denn wenn der Prozess nur ein Weiterleiten per Mail ist, dann ist es, glaube ich, nicht sinnvoll. Dann werden wir bei der Implementierung enorme Probleme haben. Der Prozess muss also schon so kompakt sein, dass man Anhänge dazu fügen kann und über eine gewisse Flexibilität verfügt. Und es muss alles bis zum Ende nachverfolgt werden können.

B: Vielen Dank, das war’s auch schon. Vielen Dank für die Einblicke.

A: Gerne!


")
#pagebreak()
#v(1em)
#figure(
strong("Experteninterview (Berater Nico Rubach)"), kind: raw,  supplement: "Interview"
)<Interview_Nico_Rubach>
 
#text("
Datum: 30.10.2024
Ort: Microsoft Teams Online Meeting
Interviewer: Benjamin Will
Interviewte Person: Nico Rubach (SAP)

B: Könntest Du bitte Deine berufliche Rolle und Deine Aufgabe einmal beschreiben?

N: Ja, sehr gerne. Ich bin Business Process Consultant bei SAP in der LoB Finance Beratung und in dieser Rolle bin ich vor allem für das Controlling-Modul verantwortlich. Das heißt, ich bin bei verschiedenen Kunden unterwegs, sowohl in der Public als auch in der Private Cloud oder teilweise auch On-Premise, und unterstütze die Kunden in vielfältigen Projekten, das Controlling-Modul in S/4HANA in SAP einzuführen. Dafür führe ich verschiedene Workshops durch und diskutiere sowohl prozessseitig mit dem Kunden als auch technisch, was am Ende eingestellt werden muss. Das Ganze mache ich jetzt seit drei Jahren.

B: Wie genehmigen Unternehmen typischerweise ihr Projektbudget?

N: Also klassischerweise gibt es natürlich viele verschiedene Budgetierungsprozesse. Einmal den klassischen allgemeinen Budgetierungsprozess, gerade für Kostenstellen, der tendenziell gegen Jahresende für das Folgejahr stattfindet, aber natürlich auch den kontinuierlichen Prozess: Wenn ein neues Projekt geplant wird, muss geschaut werden, ob es irgendwie noch in das bereits abgehandelte Jahresbudget passt oder ob es in das Budget des nächsten Jahres eingeplant wird.
Und das ist natürlich ein sehr aufwendiger Prozess, bei dem man im Projekt oft merkt, dass der Kunde weniger mit dem Projekt selbst beschäftigt ist und deutlich mehr mit Budget und Projektbudgetierung. Was ich so mitbekommen habe, wie die Kunden das meistens machen, ist, dass der Prozess immer sehr manuell getrieben wird. Das heißt, es werden von verschiedenen Stakeholdern per E-Mail, per Anrufen oder durch direkte Ansprache die Informationen zusammengetragen, in Excel-Dateien gesammelt, um daraus eine Budgetübersicht zu erstellen oder erstmal einen Budgetbedarf zu ermitteln. Diese Budgetbedarfe werden dann in einen größeren Rahmen eingeordnet und anschließend in einen Genehmigungsprozess geschickt.
Das Ganze erfolgt manuell: Wenn die Excel-Datei fertig ist, gibt es einen PDF-Auszug aus der Excel, in dem steht, wie das Projekt budgetiert werden soll, und dieser Auszug geht dann an alle relevanten Stakeholder, die das klassischerweise per E-Mail oder in einem Steering-Committee-Meeting absegnen müssen. Das heißt, es ist sehr viel manuelle, systemfremde Arbeit erforderlich bei dieser Handhabung der Projektbudgetgenehmigung.

B: Welche Herausforderungen treten denn bei der aktuellen Handhabung des Projektbudgets bei den Kunden auf?

N: Die zentrale Herausforderung besteht darin, dass viele Personen am Genehmigungsprozess beteiligt sind, sodass geklärt werden muss, wer unbedingt eingebunden sein sollte. Es sollten natürlich nicht zu viele Personen sein, weil es sonst zu zeitlichen Problemen kommen kann, es sollten aber auch nicht zu wenige sein, damit es nicht zu Unstimmigkeiten kommt und niemand sagen kann, das hätte eigentlich nicht genehmigt werden dürfen. Das heißt, es muss klar definiert und dokumentiert werden, wer das Ganze genehmigt. Was ebenfalls eine Herausforderung für die Genehmigung darstellt, ist die Benutzung von verschiedenen Dateiformaten, Plattformen und Kanälen.

B: Welche Relevanz hätte so ein digitales Projektgenehmigungstool bei Deinen Kunden und hätten die Kunden da wirkliches Interesse daran?

N: Ich denke, die Relevanz oder der Bedarf für ein solches systemgestütztes Genehmigungstool ist auf jeden Fall da, gerade um Transparenz im Prozess zu schaffen und um klare Strukturen zu haben. Zudem muss geklärt werden, wer überhaupt an dem Prozess beteiligt sein muss und wie die entsprechenden Entscheidungen dann auch getroffen werden sollen. Das sollte dann auch mit den dazugehörigen Begründungen erfolgen. Gerade um die Geschwindigkeit von so einem Prozess gewährleisten zu können, um dann auch wirklich mit dem Projekt starten zu können, ist es wichtig, dass dieser Prozess zügig verläuft, aber trotzdem noch gewissenhaft und mit einer klaren Struktur. Sonst ist alles geplant, alles steht in den Startlöchern und nur die Projektbudgetierung fehlt. Von daher denke ich, dass es durchaus sehr relevant wäre, um auch wieder Ressourcen freizugeben und nicht mit so einem manuellen Prozess Arbeitskraft zu binden.

B: Welche Herausforderungen und Anforderungen oder Kriterien siehst Du bei Deinen Kunden?

N: Grundsätzlich, wenn es um das reine Implementieren geht, ist es für jede Funktion eigentlich egal, ob es sich jetzt konkret um eine Budgetgenehmigung, eine andere Standarderweiterung oder etwas ganz anderes handelt. Es ist natürlich immer sehr hilfreich, aus Beratersicht und natürlich auch aus Kundensicht eine klare Dokumentation zu haben, um dann genau zu wissen, welche Systemanforderungen gegeben sein müssen, um so etwas implementieren zu können. Für den Kunden ist auch sehr wichtig, dass eine Kostentransparenz in dem Zuge erfolgt, um eine Kosten-Nutzen-Einschätzung durchführen zu können. Gleichzeitig ist es wichtig, bei so einem Genehmigungsprozess eine gewisse Flexibilität zu erlauben, weil Unternehmen in Genehmigungsprozessen dann doch wieder sehr unterschiedlich sind. Beispielsweise gibt es verschiedene Stakeholder, unterschiedliche Unternehmensstrukturen, Reporting- und Hierarchiestrukturen. Von daher ist eine gewisse Flexibilität wichtig, um den gesamten Prozess trotzdem noch so anpassen zu können, dass der Kunde seine eigenen Genehmigungsprozesse abbilden kann.
Hinsichtlich des Tools ist es für den Kunden natürlich wichtig, dass der Prozess klar in einem System abgebildet wird, damit wir nicht weiter diese Heterogenität haben, die wir vielleicht mit Excel, E-Mail und PDF haben, sondern dass alles in einem System stattfindet. Der Kunde soll eine zentrale Zugriffsfläche haben, auf der er den Status verfolgen kann, auf der er genehmigen kann und auf der er alle Informationen zu seinem Genehmigungsprozess und vielleicht auch seinem Projekt entsprechend sehen kann. Das Ganze schafft dann eine vereinfachte Handhabung und Transparenz, und zudem kann dadurch Zeit gespart werden, weil alles auf einen Blick klar erkennbar ist.

B: Vielen Dank, das war’s auch schon. Vielen Dank für die Einblicke.

N: Sehr gerne.

 

")
#pagebreak()

#v(1em)
#figure(
strong("Experteninterview (Anonymisierter Kunde)"), kind: raw,  supplement: "Interview"
)<Interview_Kunde_Anonymisiert>
 
#text("
Datum: 24.10.2024
Ort: Microsoft Teams Online Meeting
Interviewer: Benjamin Will
Interviewte Person: Anonymisierter Kunde der SAP
B: Könntest Du bitte Deine berufliche Rolle und Deine Aufgabe einmal beschreiben?

K: Ja, gerne. Ich bin BI-Controller und im Moment im Projekt der S/4HANA-Implementierung tätig. Dabei bin ich Stream Lead auf der Controlling-Seite.

B: Wie erfolgt die Genehmigung von Projektbudgets aktuell in eurem Unternehmen und welche Herausforderungen gibt es dabei?

K: Bei uns läuft die Genehmigung so ab, dass wir einmal im Jahr eine Budgetrunde haben. In dieser jährlichen Budgetrunde werden dann solche Projekte angemeldet. Die einzelnen Projekte beziehungsweise die Budgets werden dann auf unsere Auftragsnummern gemappt. Und dann stellen wir die Budgets in unserem eigenen System, das wir selbst entwickelt haben, ein. Wir berichten nicht aus dem SAP-System heraus, beziehungsweise der Single Point of Truth ist auch gar nicht SAP oder DB3, sondern unser selbst entwickeltes Tool. Dementsprechend sind wir eigentlich immer ein bisschen „out of the Single Point of Truth“, wenn man das so nennen möchte.
Zu den Herausforderungen kann man sagen, dass wir darauf angewiesen sind, dass die Rechnungen richtig gebucht werden. Das Ganze können wir auch nicht tracken, wenn da etwas schiefgehen sollte. Dementsprechend ist der manuelle Aufwand bei uns sehr hoch.

B: Welche Relevanz hätte ein digitales Genehmigungstool bei euch?

K: So ein Tool würde den Prozess natürlich total vereinfachen, weil im Endeffekt – angenommen, wir haben ein globales Projekt – dann könnte dieses Projekt budgetiert werden und die Ist-Kosten würden dagegen laufen. Das heißt, wir müssten eigentlich direkt eine Art Tracking haben, das kaum manuellen Aufwand erfordern würde. Dafür müssten wir uns auch nicht mehr um die Datenbeschaffung und das Reporting kümmern. Die Analyse und Steuerung der Budgetierung wäre dann auch deutlich einfacher.
Also, meiner Meinung nach hätte so ein Tool eine große Relevanz.

B: Welche Herausforderungen habt ihr an einen Genehmigungsprozess für Projektbudgets?

K: Eine Anforderung wäre, dass man den internen Prozess sauber abbilden kann. Wenn dieses Kriterium erfüllt ist, wäre die nächste Anforderung, dass man Budgets hin- und her-shiften kann, also dass das Budget nicht starr ist und man das Budget von einem PSP-Element auf ein anderes Element transferieren kann. Dafür ist die Transparenz ebenfalls entscheidend, dass man sieht, wo sich der Prozess gerade befindet. Ein Phasentracking wäre auch eine weitere Anforderung. Das heißt, das Budget sollte von einer Phase zu einer anderen Phase transferierbar sein.

B: Wer ist bei euch im Unternehmen für die Genehmigung des Projektbudgets verantwortlich, sprich welche Stakeholder sind an dem Genehmigungsprozess überhaupt beteiligt?

K: Das ist abhängig davon, wie hoch das Budget ist, aber letztendlich muss es immer über das C-Level gehen, also insbesondere die großen Projekte gehen über das C-Level. Betriebs- und Bereichsleiter sind eigentlich immer beteiligt.

B: Könntest du vielleicht noch mal ganz kurz erklären, was du unter C-Level verstehst?

K: Ja, gerne. Unter dem C-Level versteht man den CEO, CFO und CIO, also die Vorstände.

B: Vielen Dank, das war’s auch schon. Vielen Dank für die Einblicke.

K: Sehr gerne.
 ")
#pagebreak()

#v(1em)
#figure(
strong("Disclaimer Experteninterviews"),  supplement: "Disclaimer"
)<Disclaimer>
#text("
Hiermit bestätige ich, dass das Interview im Rahmen der wissenschaftlichen Arbeit „Projektbudget in SAP S/4HANA: Implementierung und Analyse eines Genehmigungsprozesses mithilfe des SAP Build Process Automation Tools auf der Business Technology Platform“ durch Benjamin Will ordnungsgemäß und in der beschriebenen Form durchgeführt wurde. Die von mir bereitgestellten Antworten und Informationen spiegeln meine eigenen Kenntnisse und Einschätzungen wider und wurden ohne externe Beeinflussung gegeben.

Ich bin darüber informiert, dass meine Antworten ausschließlich zu wissenschaftlichen Zwecken der vorliegenden Arbeit verwendet werden. Der anonymisierte Kunde stimmt ebenfalls dem Disclaimer zu, möchte jedoch anonym bleiben.



Nico Rubach
12.11.2024, Walldorf



Aysegül Sinik
12.11.2024, Walldorf



")





]