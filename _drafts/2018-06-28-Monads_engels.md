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

A very concise explanation of FP:<br>
Functional programming is not new at all (matured in the sixties), but has always been kind of a niche-activity. Lately it's gaining popularity, especially because it offers an alternative approach for concurrent- and multicore-programming. In times of Big Data that's becoming more and more important.

Traditionally in multithreading one uses several locking- en transaction-mechanisms (ways to wait for each other when using "shared state", and to be able to roll back when things go wrong anyway). 

In functional programming shared state is avoided. Sometimes even the use of chancheable variables is totally abolished. That way a variable in fact becomes a constant: once given an value, always that value. Of course things change occasionally, but then you get a new version, not a changed variable. (Because of that those new versions can arise internally very economic: the program knows that nothing will change and therefore can store a "copy" in terms of the old version with some adaptation. The actual calculation is postponed "lazily".)
<hr style="border: 1px solid red">
Classical controlstructures are avoided and often replaced by recursion. A function is referentially transparant: if you know what goes in always the same comes out, and you can also substitute the function by its result. There are no global side effects. Assignment is replaced by definitions or expressions. The functions often are lazy: calculation is postponed until the result is asked for. Zo zijn ook oneindige collecties mogelijk, (positieve gehele getallen: [1 ..]), want pas als het honderdste element wordt gevraagd wordt dat berekend. Wat erin gaat bij een functie (de argumenten) zijn niet alleen waarden, maar ook weer andere functies. Een soort van Dependency-Injection op functieniveau.

Bij OOP ligt de nadruk op het bouwen van eigen datastructuren. Functionele talen hebben vaak zeer uitgebreide bibliotheken, gericht op ge&ouml;ptimaliseerde standaard-gegevensstructuren. Veel datastructuren zijn Monads (een wiskundig concept uit de groepentheorie) of zwakkere versies daarvan, waardoor er voor veel algoritmen een generieke aanpak kan worden toegepast.

Het zal duidelijk zijn dat het voor een programmeur een totaal andere manier van denken vereist, maar FP heeft ook kanten die het gemakkelijker maakt. Vooral het ontbreken van zijeffecten maakt dat je minder snel voor onverwachte verrassingen komt te staan en dat er gemakkelijker, op bijna wiskundige wijze over een programma kan worden geredeneerd.



