---
title: Publications
layout: page
Time-stamp: "2025-04-05 18:47:38 (mkmcc)"
---


Patents
-------

<ol reversed class="publist">
{% for patent in site.data.patents %}
    <li>
    <i>{{ patent.authors }},</i> 
    <a href="{{ patent.url }}" target="_blank">{{ patent.title}}</a>. 
    {{ patent.number}} {{ patent.date }}
    </li>
{% endfor %}
</ol>



<!-- no easy way to do this in markdown, i don't think... -->
<h2>
Publications
(
<a href="https://ui.adsabs.harvard.edu/public-libraries/mwmNbnbJTXqQZahtQBn9BQ" target="_blank">NASA ADS</a>,
<a href="https://orcid.org/0000-0003-4531-7733" target="_blank">
    ORCID
    <img src="https://orcid.org/sites/default/files/images/orcid_16x16.png"
    style="width: 1em; "
    alt="ORCID iD icon"/>
    <!-- https://orcid.org/0000-0003-4531-7733 -->
</a>
)
</h2>

<!-- <a id="cy-effective-orcid-url" -->
<!--     class="underline" -->
<!--     href="https://orcid.org/0000-0003-4531-7733" -->
<!--     target="orcid.widget" -->
<!--     rel="me noopener noreferrer" -->
<!--     style="vertical-align: top"> -->
<!--     <img src="https://orcid.org/sites/default/files/images/orcid_16x16.png" -->
<!--     style="width: 1em; margin-inline-start: 0.5em" -->
<!--     alt="ORCID iD icon"/> -->
<!--     https://orcid.org/0000-0003-4531-7733 -->
<!-- </a> -->

<ol reversed class="publist">
{% for paper in site.data.papers %}
  <li markdown="span">
    {{ paper.authors }}. [“{{ paper.title }},”]({{ paper.url }}) <i>{{ paper.pub }}</i> ({{ paper.year }})
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
