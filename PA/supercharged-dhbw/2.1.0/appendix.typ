#let appendix = [
  //figure(image("assets/Business Process Automation.jpg", width: 80%), caption: [Bildgenerator Aktivierung (Eigene Darstellung)])
  //Bilder im Anhang 

    #figure(image("/PA/assets/Fiori Launchpad_Image.gif", width: 100%), caption: [Einstiegspunkt Fiori-Launchpad (Eigene Darstellung)]) <Einstiegspunkt_FLP_ED>
    #figure(image("/PA/assets/Project_structured_PSP (1).jpg", width: 110%), caption: [Projektbeispiel mit PSP-Elementen (Eigene Darstellung)]) <Projektsystem_PSP-Elemente>

#v(1em)
#figure(
strong("Interviewleitfaden Berater"), kind: raw,  supplement: "Interviewleitfaden"
)<InterviewLeitfaden_Berater>
#text("
•	Können Sie bitte Ihre berufliche Rolle und Aufgabe beschreiben ?

•	Wie genehmigen Unternehmen typischerweise das Projektbudget ohne ein Projektbudget-Genehmigungstool ?

•	Welche Herausforderungen treten bei der aktuellen Handhabung der Projektbudgets auf ?

•	Welche Relevanz hat ein digitales Projektgenehmigungstool bei Ihren Kunden ? 

•	Welche Anforderungen/Kriterien sehen Sie bei Kunden für die Implementierung eines neuen Budgetgenehmigungsprozesses in SAP S/4HANA ?"
)

#v(1em)
#figure(
strong("Interviewleitfaden Anoymisierter Kunde"), kind: raw,  supplement: "Interviewleitfaden"
)<InterviewLeitfaden_Kunde>
#text("
•  Können Sie bitte Ihre berufliche Rolle und Aufgabe beschreiben ?

•	 Wie erfolgt aktuell die Genehmigung von Projektbudgets in Ihrem Unternehmen und welche Herausforderungen gibt es dabei ?

•	Welche Relevanz hat ein digitales Projektgenehmigungstool bei Ihnen ? 

•	Welche Anforderungen haben Sie an einen Genehmigungsprozess für Projektbudgets ?

•	Wer wird in Ihrem Unternehmen das Projektbudget genehmigen, welche Stakeholder sind am Genehmigungsprozess beteiligt ?
")




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

A: Also ich bin Public Cloud Business Process Beraterin und bin hauptsächlich auf Public Cloud Projekten unterwegs. Dabei bin ich im Bereich Controlling und Projektsysteme unterwegs und begleite da den Kunden bei den Implementierungen bis zum letzendlichen Go-Live und der Hypercare-Phase.

B: Wie genehmigen Unternehmen typischerweise ihr Projektbudget ?


A: Ja das ist immer sehr abhängig von dem Unternehmen. Manchmal haben Unternehmen bestimmte Genehmigungsprozesse, wo sie Excel Dateien nutzen und sich das per Mail zuweisen oder per Mail genehmigen. Dann gibt es auch Projekte oder Unternehmen die machen, das zum Beispiel mit Lotos Notes. Aber das stößt auch immer wieder an Grenzen beziehungsweise ist immer ineffizient, weil es immer bestimmte Schablonen auszugeben gilt, die manchmal auch umfangreich technisch nicht ausreichen.
Für eine Genehmigung ist es immer schwierig, eine Dokumentation zu erstellen, die man vielleicht auch einem Wirtschaftsprüfer vorlegen kann, weil es dann auch manchmal Probleme gibt, die Genehmigungsprozesse in den Subsystemen oder manuelle Prozesse zu dokumentieren und auch die entsprechenden Vertreter zu definieren.

B: Welche Herausforderungen treten denn bei der aktuellen Handhabung des Projektbudgets, bei den Kunden auf?

A: Ja, also die Herausforderungen bestehen erstmal da drin, dass man halt im System ein Projekt anlegen kann ohne einen Genehmigungsprozess im System durchführen zu müssen. Dafür müssen “nur” die entsprechenden Berechtigungen gegeben sein. Oftmals ist es auch ein Standard bezogen auf die Historie, dass die Genehmigungsprozesse mit viel Papieraufwand abgehandelt werden. Das ist natürlich sehr zeitfressend und nicht nachhaltig, wenn solch eine Genehmigung in Papierform das Unternehmen durchlaufen muss und dann noch handschriftlich unterschrieben werden muss, weil jeder sein Kürzel drunter setzen muss. Gerade wenn es dann schnell gehen muss führt das oft zu einer hohen Unzufriedenheit beim Kunden. Deswegen suchen die Kunden immer nach einem Tool, dass eine gewisse Flexibilität bietet und die Genehmigungsschritte erleichtert und Transparenz schafft. Das heißt, nach meinem Eindurck ist so ein Genehmigungsprozess mit viel manuellem  Aufwand außerhalb des Systems verbunden und dann wird auch viel vergessen zu genehmigen, weil sich das Budget im Nachhinein vielleicht auch nochmal erhöht oder generell ändert und irgendwelche Grenzen, die unter dem eigentlichen Budget lagen, bei der ersten Budgetgenehmigung nicht erreicht wurden. 

B: Welche Relevanz hätte so ein digitales Projektgenehmigungstool bei Deinen Kunden und hätten die Kunden da wirkliches Interesse dran?

A: Ja, ich glaube, das kommt auch ein bisschen auf den Kunden an, wenn der Kunde einen Prozess hat, der durch einen schlankere Prozesse ersetzt werden kann dann schon. Aber wenn der Kunde schon außerhalb mit anderen Software Tools schon einen Genehmigungsprozess implementiert hat, werden diese Kunden eher weniger Bedarf haben. 

B: Welche Anforderungen oder Kriterien siehst Du oder Du bei Deinen Kunden ? und was wären die Anforderungen Kriterien, die letztendlich der Kunde an diese Standarderweiterung hätte?

A: Also zum einen muss es halt einfach auswählbar sein, wer das Budget genehmigt. Dabei muss der Kunde immer wissen, wer das Budget genehmigt und dass der Kunde das eben auch im Prozess zuordnen kann. Gerade in einem Krankheitsfall oder einem Langzeitausfall ist das relevant. Da wäre dann auch ein direkter Vertreter wichtig, dass direkt eine Vertretung für die ausfallende Genehmigungsperson bestimmt wird. Und dann muss dann der Genehmigungsflow genau aufzeigen, wo es eventuell gerade in dem Prozess hängt. Und was vielleicht auch ganz gut wäre,wäre  wenn zu dem Genehmigungsprozess eben die nötige Dokumentation zur Verfügung steht. Wie der Kunde die Genehmigung dort erstellen muss und wen man eben zu diesen Sachen braucht. Und auch ein transparenter Bericht oder einen entsprechende transparente Sicht auf den Genehmigungsprozess wäre nötig, die sich der Wirtschaftsprüfer dann auch entsprechend angucken kann. Was auch noch wichtig wäre, wäre die Kommunikation mit den Verantwortlichen, sprich mit den PS-Verantwortlichen oder Kostenstellenverantwortlichen oder generell mit den Projektverantwortlichen. 

B: Gibt es noch weitere Anforderungen auf der Kundenseite ?

A: 	Also grundsätzliche sagen die Kunden immer so einfach wie möglich. Am besten hat man Funktionsbausteine, die man per drag and drop setzen kann, um dann beispielsweise den Verantwortlichen für die Betroffenen Kostenstellen direkt reinziehen kann oder wennmal eine Vertretung nötig ist, diese direkt zuweisen kann. Und dass die nötigen Informationen auf einen Blick ansprechend und übersichtlich dargestellt werden können. Das würde die manuelle Arbeit sehr vereinfachen und viele Telefonate ersparen, wenn man solch eine Genehmigung einfach per Klick genehmigen kann.

B: Und welche Anforderungen hättest du denn als Beraterin ?

A: Also für uns oder für mich in der Umsetzung ist natürlich, dass wir weitestgehend mit einem standardisierten Tool arbeiten können. Dass wir dann ensprechend auch schnell eine passende Demo bereit stellen können und diese anpassen können. Wichtig ist dabei, dass wir eine gewisse Transparenz für den Kunden bieten können und die Anforderungen die ich vorhin genannt habe eben auch umgesetzt werden können. Weil wenn der Prozess auch nur ein Weitergeben ist und per Mail erfolgt, dann ist es glaube ich nicht sinnvoll. Dann werden wir auch bei der Implementierung enorme Probleme haben, also es müssen schon so kompakt sein, dass man eben wie gesagt Anhänge dazu fügen kann und über eine Flexibilität verfügt. Und das man alles bis zum Ende nachverfolgen kann.

B: Vielen Dank, dass war es auch schon, vielen Dank für die Einblicke 
A: Gerne !

")
#v(1em)
#figure(
strong("Experteninterview (Berater Nico Rubach)"), kind: raw,  supplement: "Interview"
)<Interview_Nico_Rubach>
 
#text("
Datum: 30.10.2024
Ort: Microsoft Teams Online Meeting
Interviewer: Benjamin Will
Interviewte Person: Nico Rubach (SAP)

B: Könntest Du bitte Deine berufliche Rolle und Deine Aufgabe einmal beschreiben ?

N: Ja, sehr gerne, ich bin Business Processies Consultant bei SAP in der LoB Finance Beratung und in dieser Rolle bin ich vor allem für das Controlling Modul verantwortlich. Das heißt, ich bin bei verschiedenen Kunden unterwegs, sowohl in der Public als auch private Cloud oder teilweise auch On-Premise und unterstütze die Kunden in vielfältigen Projekten, das Controlling Modul in S/4HANA in SAP einzuführen. Dafür führe ich verschiedene Workshops durch und diskutiere sowohl Prozessseitig mit dem Kunden als auch technisch, was am Ende eingestellt werden muss und das Ganze mache ich jetzt seit 3 Jahren. 

B: Wie genehmigen Unternehmen typischerweise ihr Projektbudget ?

N: Also klassischerweise gibt es natürlich viele verschiedene Budgetierungsprozesse, einmal den klassischen allgemeinen Budgetierungsprozess, gerade für Kostenstellen, der tendenziell gegen Jahresende für das Folgejahr stattfindet, aber natürlich auch den kontinuierlichen Prozess, eben dann, wenn ein neues Projekt geplant wird, muss geschaut werden, passt es irgendwie in mein schon abgehandeltes Jahresbudget noch rein oder plane ich dafür das in das Budget des nächsten Jahres?
Und das ist natürlich ein sehr sehr aufwendiger Prozess, wo man in dem Projekt noch immer merk, dass der Kunde dann weniger für das Projekt da ist und deutlich mehr mit mit Budget und Projekt Budgetierung beschäftigt ist. Was ich so mitbekommen habe, wie die Kunden das meistens machen, dann ist der Prozess immer sehr manuell getrieben, das heißt, es werden von verschiedenen Stakeholdern per E-Mail, per Calls oder per direkte Ansprache im Endeffekt die Informationen zusammen gesammelt, in Excel-Dateien zusammengetragen, um daraus eben eine Budgetübersicht zu erstellen oder erstmal einen Budget-Bedarf zu ermitteln und diese Budgetbedarfe werden dann in den größeren Rahmen gepackt, eingeordnet und dann wieder in eine, Genehmigungsprozess geschickt.

Das Ganze erfolgt manuell, das heißt dann ist die Excel fertig, dann gibt es einen PDF- Auszug aus der Excel, indem drauf steht, dieses Projekt möchten wir wie folgt budgetieren und dann geht dieser Auszug an alle relevanten Stakeholder, die das klassischerweise per Mail oder in einem Stearing Committee Meeting absegnen müssen. Das heißt, es ist sehr viel manuelle systemfremde Arbeit erforderlich bei dieser Handhabung der Projektbudgetgenehmigung.  

B: Welche Herausforderungen treten denn bei der aktuellen Handhabung des Projektbudgets bei den Kunden auf ?

N: Die klare Herausforderung ist definitiv, dass viele Leute an dem Genehmigungsprozess beteiligt sind und dann eben geguckt werden muss, wer muss alles in dem Genehmigungsprozess beteiligt sein. Es sollten natürlich nicht zu viele Personen sein, weil es sonst zu zeitlichen Problemen kommen kann, es sollten aber auch nicht zu wenige sein, dass es nicht zu Unstimmigkeiten kommt und dass niemand sagen kann, dass hätte eigentlich nicht genehmigt werden dürfen. Das heißt, es muss klar definiert und dokumentiert werden werden, wer das Ganze genehmigt. Was ebenfalls eine Herausforderung für die Genehmigung darstellt ist die Benutzung von verschiedenen Dateiformaten, verschiedenen Plattformen und Kanälen.

B: Welche Relevanz hätte so ein digitales Projektgenehmigungstool bei Deinen Kunden und hätten die Kunden da wirkliches Interesse dran?
 
N: Ich denke, die Relevanz oder der Bedarf für ein solches systemgestütztes Genehmigungstool ist auf jeden Fall da, gerade um eben dann Transparenz im Prozess zu schaffen und um klare Strukturen zu haben. Zudem muss geklärt werden, wer überhaupt an dem Prozess beteiligt sein muss und wie die entsprechenden Entscheidungen dann auch getroffen werden sollen, das sollte dann auch mit den dazugehörigen Begründungen erfolgen. Gerade um die Geschwindigkeit von so einem Prozess gewährleisten zu können, um dann auch wirklich mit dem Projekt starten zu können ist es wichtig, dass so ein Prozess zügig paasiert, aber trotzdem noch gewissenhaft und mit einer klaren Struktur. Sonst ist alles geplant, alles steht in den Startlöchern und nur die Projektbudgetierung fehlt. Von daher denke ich, dass es durchaus sehr relevant wäre, um auch wieder Ressourcen freizugeben und nicht mit so einem manuellen Prozess Arbeitskraft zu binden. 

B: Welche Herausforderungen und Anforderungen oder Kriterien siehst Du oder Du bei deinen Kunden ?

N: Grundsätzlich, wenn es um das reine Implementieren geht für jede Funktion eigentlich egal ob das jetzt konkret eine Budgetgenehmigung, eine andere Standarderweiterung ist oder etwas ganz anderes ist es natürlich immer sehr hilfreich, aus Beratersicht und natürlich trotzdem auch aus Kundensicht eine klare Dokumentation zu haben. Um dann klar zu wissen, welche Systemanforderungen gegeben sein müssen, um so etwas implementieren zu können. Für den Kunden ist auch sehr wichtig, dass eine Kostentransparenz in dem Zuge erfolgt, um dann eine Kosten-Nutzen Einschätzung durchführen zu können. Gleichzeitig ist es wichtig, bei so einem Genehmigungsprozess eine gewisse Flexibilität zu erlauben, weil gerade in Genehmigungsprozessen sind Unternehmen dann doch wieder sehr unterschiedlich. Beispielsweise gibt es verschiedene Stakeholder, verschiedene Unternehmensstrukturen, verschiedene Reporting und Hierarchiestrukturen in dem Unternehmen. Von daher ist eine gewisse Flexibilität wichtig, um den ganzen Prozess trotzdem noch soweit anpassen zu können, dass der Kunde seine eigenen Genehmigungsprozesse sieht. Hinsichtlich des Tools ist für den Kunden natürlich eben das klare Abbilden in einem System wichtig, dass wir nicht weiter diese Heterogenität haben, die wir vielleicht mit Excel, E-Mail, PDF haben, sondern das alles in einem System stattfindet, dass ich eine zentrale Zugriffsfläche habe, wo ich den Status tracken kann, wo ich genehmigen kann, wo ich alle Informationen zu meinem Genehmigungsprozess und vielleicht auch meinem Projekt entsprechend sehen kann. Das Ganze schafft dann eine vereinfachte Handhabung und Transparenz und zudem kann dadurch Zeit erspart werden, da alles auf einen Blick klar erkenntlich ist. 

B: Vielen Dank, dass wae es auch schon, vielen Dank für die Einblicke
N: Sehr gerne. 

")

#v(1em)
#figure(
strong("Experteninterview (Anonymisierter Kunde)"), kind: raw,  supplement: "Interview"
)<Interview_Kunde_Anonymisiert>
 
#text("
Datum: 24.10.2024
Ort: Microsoft Teams Online Meeting
Interviewer: Benjamin Will
Interviewte Person: Anonymisierter Kunde der SAP

B: Könntest Du bitte Deine berufliche Rolle und Deine Aufgabe einmal beschreiben ?

K: Ja, gerne. Ich bin BI Controller und bin gerade im Projekt der S/4HANA Implementierung tätig. Dabei bin ich Stream Lead auf der Controlling-Seite.

B: Wie erfolgt die Genehmigung von Projektbudgets aktuell in eurem Unternehmen und welche Herausforderungen gibt es dabei ?

K: Bei uns läuft die Genehmigung so ab, dass wir einmal im Jahr eine Budgetrunde haben. Und in dieser jährlichen Budgetrunde werden dann solche Projekte angemeldet. Die einzelnen Projekte beziehungsweise die Budgets werden dann auf unsere Auftragsnummern gemappt. Und ann stellen wir die Budgets in unserem eigenen System, dass wir selbst entwickelt haben, ein. Wir berichten nicht aus dem SAP-System heraus, beziehungsweise der Single Point of Truth ist auch gar nicht die SAP oder das DB3 sondern unser selbst entwickeltes Tool. Dementsprechend sind wir eigentlich immer so ein bisschen out of single Point of Truth, wenn man das so nennen möchte. 
Und zu den Herausforderungen kann man sagen, dass wir darauf angewiesen sind, dass die Rechnungen richtig gebucht werden. Das Ganze können wir auch nicht tracken, wenn da etwas schief gehen sollte. Und dementsprechend ist der manuelle Aufwand bei uns sehr hoch.

B: Welche Relevanz hätte ein digitales Genehmigungstool bei euch ?

K: So ein Tool würde den Prozess natürlich total einfach machen, weil im Endeffekt angenommen wir haben ein globales Projekt, dann kann das Projekt budgetiert werden und laufen die Ist-Kosten dagegen. Das heißt wir müssten eigentlich direkt eine Art Tracking haben, was kaum manuellen Aufwand erfordern würde. Dafür müsseten wir uns auch nicht um die Datenbeschaffung und das Reporting kümmern. Die Analyse und Steuerung der Budgetierung wäre dann auch deutlich einfacher. 
Also hätte so ein Tool eine große Relevanz meiner Meinung nach.



B: Welche Herausforderungen habt ihr an einen Genehmigungsprozess für Projektbudgets. 

K: Eine Anforderung wäre, dass man den internen Prozess sauber abbilden kann. Wenn dieses Kriterium erfüllt ist wäre die nächste Anforderung, dass man Budgets hin und her shiften kann, also dass das Budget nicht starr ist und man das Budget von einem PSP-Element auf ein anderes Element transferieren kann. Dafür ist die Transparenz ebenfalls entscheident, dass man sieht wo sich der Prozess gerade befindet. Ein Phasentracking wäre auch eine weitere Anforderung. Das heißt, das Budget sollte von einer Phase zu einer anderen Phase transferierbar sein. 


B: Wer ist bei euch im Unternehmen für die Genehmigung des Projektbudgets verantwortlich, sprich welche Stakeholder sind an dem Genehmigungsprozess überhaupt beteiligt ?


K: Das ist abhängig davon, wie die Budgethöhe ist, aber letztendlich muss es immer über den C Level gehen, also gerade die große Projekte gehen über den C Level. Sprich Betriebs und Bereichsleiter sind eigentlich immer beteiligt. 

B:Könntest du vielleicht noch mal ganz kurz erklären, was du unter C Level verstehst?

K: Ja gerne, unter dem C-Level versteht man den CEO, CFO und den CIO also die Vorstände. 

B: Vielen Dank, dass war es auch schon, vielen Dank für die Einblicke

K: Sehr gerne. "
)



]