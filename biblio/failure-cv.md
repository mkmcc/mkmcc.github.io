---
title: “CV of Failure”
layout: page
Time-stamp: "2016-06-26 22:47:16 (mkmccjr)"
---

<p>This page lists all of the grant proposals I have submitted; for
completeness, I include unsuccessful proposals on this page and mark
them with a strikeout.</p>

<p>Most of the projects listed here were collaborative.  I mark the
grant with an asterisk if I was <i>not</i> the primary author of the
proposal.  I include such grants only if I contributed a significant
share of the responsibility for the propsoal.</p>



Computing Resources
-------------------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th class="caligned"> Agency  </th>
    <th class="caligned"> Award   </th>
    <th class="caligned"> (Value) </th>
    <th class="caligned"> Year    </th>
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
    <td class="laligned" > {{counter}}{% if grant.pi == false %}<sup>*</sup>{% endif %} </td>
    <td class="laligned" > {{ grant.agency }} </td>

    <td class="raligned"> {{grant.cpu}}&times;10<sup>6 </sup>h</td>
    <td class="raligned"> ${{grant.dollar}}k </td>
    <td class="raligned"> {{grant.year}} </td>
  </tr>
  {% endif %}
  {% endfor %}


  <!-- Print a Total -->
  <tr>
    <th colspan="2" class="raligned"> Total: </th>
    <td> <b> {{tot_cpu}}&times;10<sup>6</sup> h </b> </td>
    <td> <b> ${{tot_dollar}}k </b> </td>
    <td></td>
  </tr>
</table>



Departmental Postdoc Fellowships
--------------------------------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th class="caligned"> Fellowship </th>
    <th class="caligned"> Year       </th>
  </tr>

  {% assign counter=0 %}

  <!-- Loop Over Table Rows -->
  {% for grant in site.data.grants %}
  {% if grant.type == "fellowship-departmental" %}

  {% assign counter=counter | plus:1 %}

  <!-- Start Table Row -->
  {% if grant.award %}
    <tr>
  {% else %}
    <tr class="strikeout">
  {% endif %}
    <td class="laligned" > {{counter}} </td>
    <td class="laligned" > {{ grant.title }} </td>

    <td class="raligned"> {{grant.year}} </td>
  </tr>
  {% endif %}
  {% endfor %}
</table>



Federal Postdoc Fellowships
---------------------------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th class="caligned"> Fellowship </th>
    <th class="caligned"> Award      </th>
    <th class="caligned"> Year       </th>
  </tr>

  {% assign counter=0 %}
  {% assign tot_dollar=0 %}

  <!-- Loop Over Table Rows -->
  {% for grant in site.data.grants %}
  {% if grant.type == "fellowship-federal" %}

  {% assign counter=counter | plus:1 %}
  {% assign tot_dollar=tot_dollar | plus:grant.dollar %}

  <!-- Start Table Row -->
  {% if grant.dollar > 0 %}
    <tr>
  {% else %}
    <tr class="strikeout">
  {% endif %}
    <td class="laligned" > {{counter}} </td>
    <td class="laligned" > {{ grant.title }} </td>

    <td class="raligned"> ${{grant.dollar}}k </td>
    <td class="raligned"> {{grant.year}} </td>
    </tr>
  {% if grant.notes %}
    <tr><td></td>
        <td colspan="3" class="caligned">
            <small> ({{ grant.notes }}) </small>
        </td>
    </tr>
  {% endif %}
  {% endif %} <!-- fellowship-federal -->
  {% endfor %}


  <!-- Print a Total -->
  <tr>
    <th colspan="2" class="raligned"> Total: </th>
    <td> <b> ${{ tot_dollar }}k </b> </td>
    <td></td>
  </tr>
</table>



Federal Funding
---------------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th class="caligned"> Agency </th>
    <th class="caligned"> Type   </th>
    <th class="caligned"> Award  </th>
    <th class="caligned"> Year    </th>
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
    <td class="laligned" > {{counter}}{% if grant.pi == false %}<sup>*</sup>{% endif %} </td>
    <td class="laligned" > {{ grant.agency }} </td>
    <td class="laligned" > {{ grant.title }} </td>

    <td class="raligned"> ${{grant.dollar}}k </td>
    <td class="raligned"> {{grant.year}} </td>
  </tr>
  {% endif %}
  {% endfor %}


  <!-- Print a Total -->
  <tr>
    <th colspan="3" class="raligned"> Total: </th>
    <td> <b> ${{ tot_dollar }}k </b> </td>
    <td></td>
  </tr>
</table>



Telescope Time
--------------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th class="caligned"> Agency </th>
    <th class="caligned"> Type   </th>
    <th class="caligned"> Award  </th>
    <th class="caligned"> Year   </th>
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
    <td class="laligned" > {{counter}}{% if grant.pi == false %}<sup>*</sup>{% endif %} </td>
    <td class="laligned" > {{ grant.agency }} </td>
    <td class="laligned" > {{ grant.title }} </td>

    <td class="raligned"> {{grant.hours}} hours </td>
    <td class="raligned"> {{grant.year}}  </td>
  </tr>
  {% endif %}
  {% endfor %}
</table>



Ph.D. Programs
---------------

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th class="caligned"> Fellowship </th>
    <th class="caligned"> Year       </th>
  </tr>

  {% assign counter=0 %}

  <!-- Loop Over Table Rows -->
  {% for grant in site.data.grants %}
  {% if grant.type == "phd" %}

  {% assign counter=counter | plus:1 %}

  <!-- Start Table Row -->
  {% if grant.accepted %}
    <tr>
  {% else %}
    <tr class="strikeout">
  {% endif %}
    <td class="laligned" > {{counter}} </td>
    <td class="laligned" > {{ grant.school }} </td>

    <td class="raligned"> {{grant.year}} </td>
  </tr>
  {% endif %}
  {% endfor %}
</table>



Ph.D. Fellowships
-----------------

<p>Over most of my graduate career, I dutifully applied for every
funding opportunity I could find&hellip; and was <i>completely</i>
shut out.  I found this very discouraging at the time, and am sorry to
admit I eventually gave up.</p>

<table>
  <!-- Table Header -->
  <tr>
    <th> </th>
    <th class="caligned"> Fellowship </th>
    <th class="caligned"> Year       </th>
  </tr>

  {% assign counter=0 %}

  <!-- Loop Over Table Rows -->
  {% for grant in site.data.grants %}
  {% if grant.type == "phd-fellowship" %}

  {% assign counter=counter | plus:1 %}

  <!-- Start Table Row -->
  {% if grant.accepted %}
    <tr>
  {% else %}
    <tr class="strikeout">
  {% endif %}
    <td class="laligned" > {{counter}} </td>
    <td class="laligned" > {{ grant.title }} </td>

    <td class="raligned"> {{grant.year}} </td>
  </tr>
  {% endif %}
  {% endfor %}
</table>
