---
title: Publications
layout: page
Time-stamp: "2015-02-08 00:45:00 (mkmccjr)"
---

Publications
------------

<ol reversed>
{% for paper in site.data.papers %}
  <li markdown="span">
    [{{ paper.authors }} ({{paper.year }})]({{paper.url}})
  </li>
{% endfor %}
</ol>



Talks
-----

<ol reversed>
{% for talk in site.data.talks %}
  <li markdown="span">
    *{{ talk.name }}*, {{talk.place }} ({{ talk.date }})
  </li>  
{% endfor %}
</ol>

