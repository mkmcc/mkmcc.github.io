---
title: Publications
layout: page
Time-stamp: "2025-04-03 20:13:36 (mkmcc)"
---


Patents
-------

<ol reversed>
{% for patent in site.data.patents %}
    <li markdown="span">
    <i>{{ patent.authors }},</i> [{{ patent.title}}]({{ patent.URL }}). {{ patent.number}} {{ patent.date }}
    </li>
{% endfor %}
</ol>



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
