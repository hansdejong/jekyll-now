---
layout: page
title: Genetics
categories: Scala Genetics
cat: ScalaGenetics
---

## Blog Posts
 {% for post in site.posts %} 
  {% assign me =   page.cat  %}
  {% assign you =  post.categories %}

  {% if me contains 'ScalaGenetics' %} {% assign meSG = 'wel'  %} {% else %} {% assign meSG = 'niet'  %}  {% endif %} 
  {% if you contains 'Genetics' %} {% assign youSG = 'wel'  %} {% else %} {% assign youSG = 'niet'  %}  {% endif %} 

  {% comment%}
    Kennelijk is een pad iets anders dan wordt afgedrukt
  {% endcomment %}

  aap {{ me }} mies {{ meSG }} <br> 
  aap {{ you }} noot {{ youSG }} <br>

  {% if me == you %} gelijk {% else %} ongelijk {% endif %}
  <script> document.write(  gelijk()) + "sss"; </script>
<!-- #  {#% if post.categories == page.cat %#} -->


    {{site.categories[cat]}}
    * {{ post.date | date_to_string }} &raquo; [ {{ post.title }} ]({{ post.url }}) 
      {% if post.categories !=    empty %} &rarr; {{post.categories}} #<!--Toegevoegd Hans-->
      {% endif %}
<!-- #  {#% endif %#} -->
{% endfor %}

Liquid Exception: undefined method `gsub' for []:Array