---
title: Publications
layout: page
Time-stamp: "2015-10-19 10:46:46 (mike)"
---

Publications [(NASA ADS)](http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?library&libname=my-papers&libid=54eca64ca4 "ADS")
-----------------------------------------------------------------------------------------------------------------------------

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

