---
layout: post
title: Monads english
categories : [Programming, _Scala, _Haskell]
tags : [monads, scala, haskell]
comments: true
---

As you can see in this blog I'm experimenting with Scala. This is a so called "mixed-paradigm"-programming language: you can program in it in an object-oriented Java-like (OOP) way, maar also in a  functional (FP) way. I'm coming from an OOP background, and so the functional part takes a while to get used to. Recently I also tried to get to grips with Haskell. I don't intend to really shift focus to that language, but Haskell is purely functional, and cheating is impossible. In Scala too you quickly run into Monads and the like, but with Haskell they are unavoidable. So my intention with Haskell is to become a better Scala-programmer.

I bought a Haskell book, <a href="/statics/ref/bronnen.html#learnyou" target="_blank">Learn you a Haskell for Great Good</a>, and reading that and several other resources, I constructed a mental image of what Monads are, and what they are good for. You find a representation of that image here: 
<a href="{{ site.baseurl }}/statics/monads/monads.html" target="_blank">Monads en zo</a>.

I do hope it to be interesting for other programmers, who have some ambitions in functional programming too.
Also see: <a href="https://en.wikipedia.org/wiki/Monad_(functional_programming)" target="_blank">Wikipedia Monads</a>.


### Functioneel programmeren

Een zeer summiere uitleg van FP:<br>
Functioneel programmeren is zeker niet nieuw (stamt uit de 60-er jaren), maar is altijd een beetje een niche-activiteit geweest. De laatste tijd wint het aan populariteit, vooral doordat het een alternatieve aanpak biedt bij concurrent- en multicore-programmatuur. In de tijd van Big Data wordt dat steeds belangrijker.

Klassiek wordt bij multithreading gebruik gemaakt van allerlei locking- en transactie-mechanismen (manieren om op elkaar te wachten bij het gebruik van "shared state", en als het toch misloopt de boel terug te kunnen draaien). 

Bij functioneel programmeren wordt shared state vermeden. Zelfs wordt soms het gebruik van veranderlijke variabelen totaal vermeden. Een variabele is dan in feite een constante: eenmaal een waarde altijd die waarde. Natuurlijk verandert er wel eens wat, maar dan krijg je een nieuwe versie, geen veranderde variabele. (Daardoor kunnen die nieuwe versies intern heel economisch ontstaan: het programma weet dat iets niet zal veranderen en kan dus een "kopie" opslaan in termen van de oude versie met een bepaalde verandering.)

Klassieke controlestructuren worden vermeden en vaak vervangen door recursie. Een functie is referentieel transparant: als je weet wat erin gaat komt er altijd hetzelfde uit en kun je de functie ook vervangen door het resultaat. Er zijn geen globale zijeffecten. Assignment (tijdelijke toekenning) wordt daarbij vervangen door definities. De functies zijn vaak lui (lazy): er wordt pas gerekend als er om een resultaat wordt gevraagd. Zo zijn ook oneindige collecties mogelijk, (positieve gehele getallen: [1 ..]), want pas als het honderdste element wordt gevraagd wordt dat berekend. Wat erin gaat bij een functie (de argumenten) zijn niet alleen waarden, maar ook weer andere functies. Een soort van Dependency-Injection op functieniveau.

Bij OOP ligt de nadruk op het bouwen van eigen datastructuren. Functionele talen hebben vaak zeer uitgebreide bibliotheken, gericht op ge&ouml;ptimaliseerde standaard-gegevensstructuren. Veel datastructuren zijn Monads (een wiskundig concept uit de groepentheorie) of zwakkere versies daarvan, waardoor er voor veel algoritmen een generieke aanpak kan worden toegepast.

Het zal duidelijk zijn dat het voor een programmeur een totaal andere manier van denken vereist, maar FP heeft ook kanten die het gemakkelijker maakt. Vooral het ontbreken van zijeffecten maakt dat je minder snel voor onverwachte verrassingen komt te staan en dat er gemakkelijker, op bijna wiskundige wijze over een programma kan worden geredeneerd.



