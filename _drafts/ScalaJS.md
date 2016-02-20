---
layout: post
title: Scala.js
categories : [Programming, _Draft]
tags : [SBT, applet, scala]
comments: true
---

Scala.js is een compiler die Scala overzet naar JavaScript ipv. naar JVM-bytecode. Daarna kan het programma gedraaid worden in een browser. Mijn idee was daarbij dat:

* Omdat Scala-programma's deels of zelfs geheel uit Java-code kunnen bestaan, zou je Scala.js als een alternatief voor Java-applets kunnen beschouwen.<br>Ik wilde dus een bestaande Java-Applet van mij, met zo weinig mogelijk veranderingen in de code, aan de praat proberen te krijgen als Javascript-applicatie.

* Ook is het een goede manier om aan SBT-ervaring te komen: het gaat om mooie &eacute;&eacute;n-project-applicaties, gemaakt m.b.v. Eclipse. 

De eerste vlieger gaat al meteen niet op:

* Scala.js blijkt geen Java-code te begrijpen. Voor het bereikbare eindresultaat maakt dat niet uit, maar het idee te beginnen met een werkende applet en die geleidelijk aan te passen is dus een illusie.

* Het was ook nogal na&iuml;ef te denken dat je gebruik zou kunnen maken van Scala-Swing. Je hebt te maken met een HTML5-omgeving, en voor widgets (knoppen, gliders etc.) ben je daar ook op aangewezen. De  weinige voorbeelden tonen resultaten met een canvas waarop wordt getekend en die vooral aan het spelletje "pong" uit de oertijd van de PC doet denken.<br> (Waarom zo weinig? Je wilt iets slijten voor een browseromgeving. Hoe moeilijk kan het zijn een veelzijdig en overvloedig aanbod aan voorbeelden te hebben? Dat viel me bij JavaFX ook al zo op.)

De bottom-line: Scala.js is gewoon een alternatieve manier om JavaScript te produceren. 

De voorbeelden toonden wel eenvoudige animatie en uitlezen van de muispositie, dus kan er misschien toch wat mee. Ook het SBT-aanleer argument blijft nog overeind, dus maar eens aan de slag met <b>[Hands On Scala.js &rarr; Getting Started](http://lihaoyi.github.io/hands-on-scala-js/) van Li Haoyi's tutorial.</b> (Dit is de centrale link waarmee ik in deze column zal werken.)<br>
<i>Er is overigens ook een offici&euml;le [Getting Started tutorial](http://www.scala-js.org/tutorial/basic/).</i>
<hr>
<font color="red"><i>Gebleven bij getting Started, er gaat nu een workbench-example-app gedownload worden.</i></font>
<hr>
Een paar links:<br>
[No longer experimental](http://www.scala-lang.org/news/2015/02/05/scala-js-no-longer-experimental.html)<br>
[Reversie](http://www.scala-js.org/examples/reversi/)<br>
[Fiddle](http://www.scala-js-fiddle.com/)<br>
[SVG, Angular, Scala.JS](https://groups.google.com/forum/#!topic/scala-js/Ac3oUx3AvQY) <br>
[Scala.js in production](https://groups.google.com/forum/#!topic/scala-js/Ac3oUx3AvQY)<br>
<hr>
