---
title: Publications
layout: page
Time-stamp: "2025-03-30 18:43:10 (mkmcc)"
---

<!-- no easy way to do this in markdown, i don't think... -->
<h2>
Publications
(<a href="https://ui.adsabs.harvard.edu/public-libraries/mwmNbnbJTXqQZahtQBn9BQ">ADS</a>,
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

