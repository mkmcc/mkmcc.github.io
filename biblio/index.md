---
title: Publications
layout: page
Time-stamp: "2025-04-05 09:02:58 (mkmcc)"
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

<a id="cy-effective-orcid-url"
    class="underline"
    href="https://orcid.org/0000-0003-4531-7733"
    target="orcid.widget"
    rel="me noopener noreferrer"
    style="vertical-align: top">
    <img src="https://orcid.org/sites/default/files/images/orcid_16x16.png"
    style="width: 1em; margin-inline-start: 0.5em"
    alt="ORCID iD icon"/>
    https://orcid.org/0000-0003-4531-7733
</a>

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
