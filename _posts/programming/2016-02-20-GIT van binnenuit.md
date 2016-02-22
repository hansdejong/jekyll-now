---
layout: post
title: GIT van binnenuit
categories : [Programming, _Git]
tags : [git]
comments: true
---

Het volgende document vond ik erg verhelderend:
<a href="{{ site.baseurl }}/statics/Git van binnenuit.htm" target="_blank">Git van binnenuit</a>.<br> Het is geschreven door Mary Rose Cook.<br>

Het origineel vindt u hier: <a href="https://codewords.recurse.com/issues/two/git-from-the-inside-out" target="_blank">Git from the inside out</a>. Ik heb het naar het Nederlands vertaald, en permissie gevraagd het te posten. Het heeft niet de opzet van een tutorial, maar beschrijft de achterliggende datastructuur van Git, en welke uitwerking diverse commando's daarop hebben.

## Voor wie GIT niet kent

Git is een Versie Beheers Systeem (VCS, Version Control System). Het wordt voornamelijk door programmeurs gebruikt om broncode in op te slaan. Als iets "ineens niet meer werkt" kun je terug in de tijd. Je kunt verschillende versies (of probeersels) naast elkaar hebben (branches), die je eventueel weer kunt samenvoegen (mergen).<br>
Ook kun je via Git samenwerken aan projecten. Er is een website die daarin gespecialiseerd is, [Github](http://github.com/). Daar slaan programmeurs hun code op, en werken ze samen of bekijken ze elkaars projecten. Ook kun je er blogs hosten die van Git gebruik maken, zoals dit blog.

Hoewel Git vooral een tool is voor programmeurs, kan iedereen die ingewikkelde teksten produceert er gebruik van maken. Ook voor schrijvers van boeken of documentatie kan het heel handig zijn.<br>
In het begin kan Git nogal technisch ogen, met vele (overigens goed gedocumenteerde) commando's vanaf de commandline. Er zijn echter ook grafische tools zoals Git Gui en gitk, die het leven een stuk eenvoudiger maken. Alleen in uitzonderlijke gevallen is een uitstapje naar de prompt dan nodig.



