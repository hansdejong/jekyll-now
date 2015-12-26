---
layout: post
title: >-
    Blogtest: Paden
categories : [Test]
comments: false
---

### Interne links werken alleen lokaal correct, dus deze pagina op beide lokaties bekijken!

De tabelletjes-pagina via een direkte link link:<br>
URL van de vorm: /statics/tabelletjes.html (dit werkt lokaal)<br>
[En dan is het nu tijd voor een tabelletje]( /statics/tabelletjes.html )

Nu een interne link met post_url:<br>
Lokaal wordt dit-: /test/2015/12/02/Blogtest-Code/ <br>
URL van de vorm:  {% post_url 2015-12-02-Blogtest Code %} (dit werkt lokaal ook)<br>
[Link naar de code blogtest]({% post_url 2015-12-02-Blogtest Code %})

[//]:# URL van de vorm:  {-% {{site.base_url}} post_url 2015-12-02-Blogtest Code %-} <br>
[//]:# [Link naar de code blogtest]({-% {{site.baseurl}} post_url 2015-12-02-Blogtest Code %-})

De post.url kaal (tussen haken: leeg):<br>
>{{ post.url  }}< <br>
De post_url kaal (tussen haken: leeg):<br>
>{{ post_url  }}< <br>

De site.baseurl kaal (tussen haken: leeg):<br>
>{{ site.baseurl }}<