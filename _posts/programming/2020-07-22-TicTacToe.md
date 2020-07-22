---
layout: post
title: TicTacToe
categories : [Programming, _Scala, _Haskell]
tags : [scala, haskell, FP]
comments: true
---

Ik heb het eerder gehad over Functioneel Programmeren (FP, zie het artikel "Monads"). Toen ging het vooral over wat FP is, het verschil in aanpak tussen Haskell en Scala, en over wat je functionele "Design Patterns" zou kunnen noemen, zoals Monads. 

Deze keer wil ik me meer op een concreet voorbeeld richten.
Ik heb opnieuw een Haskell-boek gekocht, <a href="/statics/ref/bronnen.html#pih" target="_blank">Programming in Haskell</a>, 2e editie, van Graham Hutton. Ook dit boek begint op beginnersniveau, maar werkt dan een aantal concrete voorbeelden uit. In hoofdstuk 11 is dat Boter, Kaas en Eieren, oftewel Tic-Tac-Toe.

De code genereert een compleet cli-spel (command-line interface), dat onoverwinnelijk zou moeten zijn. Omdat goede serieuze maar behapbare voorbeelden van FP zeldzaam zijn heb ik het vertaald naar Scala. De listings vind je hier naast elkaar: <a href="{{ site.baseurl }}/statics/monads/tictactoe.htm" target="_blank">Tic-Tac-Toe</a>.<br> De code zoals hier gepresenteert runt in respectievelijk ghci (Haskell) dan wel ammonite (Scala).

### Intimiderend of nuttig?

Zelf vind ik Haskell nog steeds lastig. Ik begrijp de boeken en voorbeelden, maar ik heb weinig zelfstandig in elkaar weten te knutselen. Met Scala ligt dat anders. Daarin ben ik behoorlijk productief, je leert geleidelijk en bijna nooit verplicht nieuwe technieken, en het levert goed onderhoudbare en leesbare code op.

Ik was benieuwd of een letterlijk vertaald Haskell programma daarmee inzichtelijker zou worden. Dat valt een beetje tegen. E&eacute;n van de redenen is dat ik vooral veel value-functies heb gebruikt, die ook voor veel Scala programmeurs ongebruikelijk zijn.<br> (Scala is in veel situaties in staat gewone def-methods automatisch te converteren naar deze anonieme-functie syntax, "&lambda;-functies", een proces dat eta-expansie wordt genoemd.)<br> Maar daarmee lijkt de code wel veel meer op Haskell, en is deze dus beter te vergelijken.

FP zou inzichtelijker moeten zijn dan OOP-code, al was het maar omdat er geen zij-effecten zijn. Maar het is toch wel wennen aan het veelvuldig toepassen van funcies als argument of returnwaarde. Afijn, oordeel zelf. Maar voor de niet-ingewijden: Scala ziet er meestal "Java-achtiger" uit, laat je niet afschrikken.


