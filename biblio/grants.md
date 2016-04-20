---
title: Grants
layout: page
Time-stamp: "2016-04-19 19:43:01 (mike)"
---

<p>This page lists all of the grant proposals I have submitted; for
completeness, I include unsuccessful proposals on this page and mark
them with a strikeout.</p>

<p>Many of these projects were collaborative.  I mark the grant with
an asterisk if I was <i>not</i> the primary author of the proposal.  I
include such grants only if I contributed a significant (of order
50&#37;) share of the responsibility for the propsoal.</p>

<p>Note that I do not include fellowship offers from indivudual
universities.  University fellowships have a very different review
process, and success with them may not correlate well with federal
grants.  My CV lists the fellowship positions I have taken.</p>


Computing Resources
-------------------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th align="center"> Agency </th>
    <th align="center"> Award  </th>
    <th align="center"> (Value)  </th>
  </tr>

  {% assign counter=0 %}
  {% assign tot_cpu=0 %}
  {% assign tot_dollar=0 %}

  <!-- Loop Over Table Rows -->
  {% for grant in site.data.grants %}
  {% if grant.type == "computing" %}

  {% assign counter=counter | plus:1 %}
  {% assign tot_dollar=tot_dollar | plus:grant.dollar %}
  {% assign tot_cpu=tot_cpu | plus:grant.cpu %}

  <!-- Start Table Row -->
  {% if grant.dollar > 0 %}
    <tr>
  {% else %}
    <tr class="strikeout">
  {% endif %}
    <td align="left" > {{counter}}{% if grant.pi == false %}<sup>*</sup>{% endif %} </td>
    <td align="left" > {{ grant.agency }} </td>

    <td align="right"> {{grant.cpu }}&times;10<sup>6</sup> h  </td>
    <td align="right"> ${{grant.dollar}}k </td>
  </tr>
  {% endif %}
  {% endfor %}


  <!-- Print a Total -->
  <tr>
    <th colspan="2" align="right"> Total: </th>
    <td> <b> {{ tot_cpu }}&times;10<sup>6</sup> h </b> </td>
    <td> <b> ${{ tot_dollar }}k </b> </td>
  </tr>
</table>



Funding
-------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th align="center"> Agency </th>
    <th align="center"> Type   </th>
    <th align="center"> Award  </th>
  </tr>

  {% assign counter=0 %}
  {% assign tot_dollar=0 %}

  <!-- Loop Over Table Rows -->
  {% for grant in site.data.grants %}
  {% if grant.type == "funding" %}

  {% assign counter=counter | plus:1 %}
  {% assign tot_dollar=tot_dollar | plus:grant.dollar %}

  <!-- Start Table Row -->
  {% if grant.dollar > 0 %}
    <tr>
  {% else %}
    <tr class="strikeout">
  {% endif %}
    <td align="left" > {{counter}}{% if grant.pi == false %}<sup>*</sup>{% endif %} </td>
    <td align="left" > {{ grant.agency }} </td>
    <td align="left" > {{ grant.title }} </td>

    <td align="right"> ${{grant.dollar}}k </td>
  </tr>
  {% endif %}
  {% endfor %}


  <!-- Print a Total -->
  <tr>
    <th colspan="3" align="right"> Total: </th>
    <td> <b> ${{ tot_dollar }}k </b> </td>
  </tr>
</table>



Telescope
---------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th align="center"> Agency </th>
    <th align="center"> Type   </th>
    <th align="center"> Award  </th>
  </tr>

  {% assign counter=0 %}

  <!-- Loop Over Table Rows -->
  {% for grant in site.data.grants %}
  {% if grant.type == "telescope" %}

  {% assign counter=counter | plus:1 %}

  <!-- Start Table Row -->
  {% if grant.hours > 0 %}
    <tr>
  {% else %}
    <tr class="strikeout">
  {% endif %}
    <td align="left" > {{counter}}{% if grant.pi == false %}<sup>*</sup>{% endif %} </td>
    <td align="left" > {{ grant.agency }} </td>
    <td align="left" > {{ grant.title }} </td>

    <td align="right"> {{grant.hours}} hours </td>
  </tr>
  {% endif %}
  {% endfor %}
</table>
