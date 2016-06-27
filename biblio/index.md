---
title: Publications
layout: page
Time-stamp: "2016-06-26 21:14:08 (mkmccjr)"
---

<!-- no easy way to do this in markdown, i don't think... -->
<h2>
Publications
(<a href="http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?library&amp;libname=my-papers&amp;libid=54eca64ca4">ADS</a>,
<a href="https://arxiv.org/a/mccourt_m_1.html">arxiv</a>)
</h2>

<ol reversed>
{% for paper in site.data.papers %}
  <li markdown="span">
    [{{ paper.authors }}, <i>{{paper.pub}}</i> ({{paper.year }})]({{paper.url}})
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

