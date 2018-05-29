---
layout: post
title: Applets in tijden na Java
categories : [Programming, _Draft]
tags : [SBT, applet, scala]
comments: true
---
### Applets
Nee, schrik niet van de titel, Java is niet dood. Maar de Java-applet is dat wel. Vanwege security-issues is de applet de nek omgedraaid. Applets waren meestal kleine javaprogramma´s die in de browser konden draaien, waarbij de bytecode automatisch werd gedownload. Ik vond applets altijd een heel aantrekkelijk soort programma´s:

* Voor velen was het d&egrave; manier om sterk uiteenlopende idee&euml;n zonder veel rompslomp aan de buitenwereld (via internet, in de browser) te presenteren, in een krachtige maar niet teveel aandacht opeisende programmeertaal.

* Ook aspecten van het programmeren zelf waren gemakkelijk uit te proberen. Het was gemakkelijk om programma´s te maken die zowel zelfstandig als in de browser waren te gebruiken.

Zoals gezegd, de applet is dood. Er zijn alternatieven, maar dan ben je gelijk gebonden aan een in ieder geval minder gestructureerde taal, waarbij de code niet uitnodigt om die uit te bouwen of op te nemen in een groot project. Voorbeelden zijn Flash en JavaScript.

### Scala.js
Maar nu is er ook Scala.js. Een Scala-programma wordt gewoonlijk, net als een Java-programma, vertaald naar JVM-bytecode.
Scala.js is een compiler die Scala overzet naar JavaScript i.p.v. naar JVM-bytecode. Daarna kan het programma gedraaid worden in een browser. 

Scala.js wordt vaak gebruikt als front-end in grotere web-applicaties, maar zou het ook voldoen als alternatief voor Java-applets? Gestript van zoveel mogelijk extra tooling als JavaScript libraries (scalatags, jQuery, Node.js) en op te starten webservers?

Ja, dat kan, zoals een paar voorbeelden op dit blog laten zien. Er zijn wel enkele zaken om rekening mee te houden:

* Scala is geen Java. Je zult er dus een andere taal voor moeten leren. <br>
Als javaprogrammeur kun je in Scala vrij snel op een Java-achtige manier aan de gang: alles wat in Java kan kan in Scala op een vergelijkbare (Object Oriented, OOP) manier. Maar om echt gebruik te maken van de kracht van Scala komt veel meer kijken. Scala moedigt op vele manieren een Functional Programming aanpak aan, en dat is in het begin gewoon moeilijk.  

* Een gewoon Scala-project kan deels of zelfs geheel uit Java-code bestaan.<br>
Scala.js begrijpt echter geen Java-code. Voor het bereikbare eindresultaat maakt dat niet uit, maar het idee te beginnen met een werkende applet en die geleidelijk aan te passen is dus een illusie.<br>
Ook met bestaande Java-bibliotheken (die ook vaak worden ingezet in Scala-projecten) kan  Scala.js dus niet uit de voeten.

* In Scala kun je GUI´s (Graphical User Interface) maken met Scala-Swing, een prima variant op de aloude Java-swing library. Maar die is in Scala.js niet te gebruiken. Je zult dus op zoek moeten naar een GUI-library die vanuit (de door Scala.js geproduceerde) JavaScript is aan te spreken. Ik heb daarbij voor webix gekozen, maar er zijn veel meer mogelijkheden te vinden op het web. Voor zeer eenvoudige GUI´s is HTML voldoende.

## Een minimale Scala.js-tutorial 

Wat ik hier wil doen is een zo beperkt mogelijke tutorial te presenteren voor het maken van een "Scala-applet". Scala zelf zul je hier nauwelijks leren, het gaat me er om iemand die liefst aardig in Java kan programmeren op weg te helpen in Scala.js.

* Het project zal te vinden zijn  op GitHub
* We maken gebruik van GIT
* We gebruiken IntelliJ als IDE. (Voor mij nieuw. Ik ben een Eclipse-gebruiker)
* Scala.js heeft een build-tool nodig. Traditioneel is dat net als voor gewone Scala-projecten SBT. Hier wil ik Mill gebruiken (een alternatief van de maker van Scala.js, Li Haoyi. Voor mij ook nieuw.)
* We zullen ook testcode gebruiken. Misschien niet uitputtend, maar een serieus project heeft testcode nodig (utest).
* We gebruiken webix voor de vrij minimale GUI.

Het project zal een parser zijn (ik moet nog beslissen welke het wordt):
* of een Expressie-parser op basis van de Scala-parse library van Li Haoyi, wat een rekenmachine op zou leveren
* of een XML-parser m.b.v. door mij op het web gevonden en geporte Python code op basis van reguliere expressies

### IntelliJ (of Eclipse)

### Mill (of SBT)
(Mill zou eenvoudiger zijn dan SBT, maar dat moet ik nog ervaren.)

### De testomgeving
### GIT

<hr>

, zou je Scala.js als een alternatief voor Java-applets kunnen beschouwen.<br>Ik wilde dus een bestaande Java-Applet van mij, met zo weinig mogelijk veranderingen in de code, aan de praat proberen te krijgen als Javascript-applicatie. 



* Ook is het een goede manier om aan SBT-ervaring te komen: het gaat om mooie &eacute;&eacute;n-project-applicaties, gemaakt m.b.v. Eclipse. 

De eerste vlieger gaat al meteen niet op:

* 

* Het was ook nogal na&iuml;ef te denken dat je gebruik zou kunnen maken van Scala-Swing. Je hebt te maken met een HTML5-omgeving, en voor widgets (knoppen, gliders etc.) ben je daar ook op aangewezen. De  weinige voorbeelden tonen resultaten met een canvas waarop wordt getekend en die vooral aan het spelletje "pong" uit de oertijd van de PC doet denken.<br> (Waarom zo weinig? Je wilt iets slijten voor een browseromgeving. Hoe moeilijk kan het zijn een veelzijdig en overvloedig aanbod aan voorbeelden te hebben? Dat viel me bij JavaFX ook al zo op.)

De bottom-line: Scala.js is gewoon een alternatieve manier om JavaScript te produceren. 

De voorbeelden toonden wel eenvoudige animatie en uitlezen van de muispositie, dus kan er misschien toch wat mee. Ook het SBT-aanleer argument blijft nog overeind, dus maar eens aan de slag met <b><a href="http://lihaoyi.github.io/hands-on-scala-js/" target="_blank">Hands On Scala.js &rarr; Getting Started</a> van Li Haoyi's tutorial.</b> (Dit is de centrale link waarmee ik in deze column zal werken.)<br>
<i>Er is overigens ook een offici&euml;le [Getting Started tutorial](http://www.scala-js.org/tutorial/basic/).</i><br>
<i>En een blog van [Dimitri Charles](http://grosdim.blogspot.nl/2013/01/quick-sbt-tutorial.html) met een sumiere beschrijving van de eclipse plugin en het eclipse commando.</i>
<hr>
<font color="red"><i>Gebleven bij getting Started, er gaat nu een workbench-example-app gedownload worden.</i></font>
<hr>
* Eerst wordt met <b>git clone project-url</b> een project gecloneerd
* cd naar de projectdirectory
* sbt fastOptJS &rArr; foop spam. De opgegeven localhost-url (http://localhost:12345/target/scala-2.11/classes/index-dev.html) gaf sierpinski-driehoek<br>
(ik had tussendoor per ongeluk <b>sbt help</b>  gedaan: gaf ook een hoop spam, maar verstoorde de latere stap niet. Toch overnieuw gekloneerd. Het was waarschijnlijk toch goed: sbt genereert het progject in de project-directory, en voert dan help uit)
* Bij "Opening up the Project" moet je het project importereen in eclipse. Het "eclipse"-commando wordt niet genoemd.

<hr>
Een paar links:<br>
[No longer experimental](http://www.scala-lang.org/news/2015/02/05/scala-js-no-longer-experimental.html)<br>
[Reversie](http://www.scala-js.org/examples/reversi/)<br>
[Fiddle](http://www.scala-js-fiddle.com/)<br>
[SVG, Angular, Scala.JS](https://groups.google.com/forum/#!topic/scala-js/Ac3oUx3AvQY) <br>
[Scala.js in production](https://groups.google.com/forum/#!topic/scala-js/Ac3oUx3AvQY)<br>
<hr>
* 
