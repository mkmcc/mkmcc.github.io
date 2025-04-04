---
title: “CV of Failure”
layout: page
Time-stamp: "2025-04-03 19:38:04 (mkmcc)"
---

I recently came across an
[article](https://www.nature.com/articles/nj7322-467a) making the case
for keeping a “CV of Failure.”  In academia, it’s common to maintain a
CV with a long list of one’s successes — we make the list as long as
possible, highlighting the tiniest successes.  That makes it easy to
forget (or perhaps hide) the reality: that most things don’t work out.
For people early in their careers, that can be discouraging.

While I doubt anyone’s ever looked at my CV and felt intimidated, I
still thought it would be honest — and maybe even useful — to share
some of the things that didn’t go as planned.  It also helps me
remember that getting a grant usually means applying multiple
times.  Sometimes five.  Sometimes more.

Many of these projects were collaborations, and I’ve marked grants
with an asterisk if I wasn’t the lead author on the proposal.  I’ve
included them only when I played a substantial role in writing or
managing the application.


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



Federal Ph.D. Fellowships
-------------------------

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


Takeaway
--------

I’d like to say I learned some pattern or lesson from my
experience&hellip; but if there is one, I haven’t found it.  Some of
my best efforts were rejected, and a few that felt rushed or uncertain
ended up getting funded.  It doesn’t seem especially meritocratic — if
anything, it feels random at times.

I’m reminded of the essential role of luck in success, nicely outlined
in this [graduation
speech](https://www.princeton.edu/main/news/archive/S33/87/54K53/) by
Michael Lewis, where he talks about the illusion of merit and how we
tend to overlook randomness in success stories:

<blockquote cite="https://www.princeton.edu/main/news/archive/S33/87/54K53/">

<p class="firstquote">
People really don’t like to hear success explained away as luck –
especially successful people. As they age, and succeed, people feel
their success was somehow inevitable. They don’t want to acknowledge
the role played by accident in their lives. There is a reason for
this: the world does not want to acknowledge it either.
</p>

<p>I wrote a book about this, called &ldquo;Moneyball.&rdquo; It was
ostensibly about baseball but was in fact about something else. There
are poor teams and rich teams in professional baseball, and they spend
radically different sums of money on their players. When I wrote my
book the richest team in professional baseball, the New York Yankees,
was then spending about $120 million on its 25 players. The poorest
team, the Oakland A&rsquo;s, was spending about $30 million. And yet
the Oakland team was winning as many games as the Yankees &ndash; and
more than all the other richer teams.</p>

<p>This isn&rsquo;t supposed to happen. In theory, the rich teams
should buy the best players and win all the time. But the Oakland team
had figured something out: the rich teams didn&rsquo;t really
understand who the best baseball players were. The players were
misvalued. And the biggest single reason they were misvalued was that
the experts did not pay sufficient attention to the role of luck in
baseball success.&hellip; <!-- Players got given credit for things
they did that depended on the performance of others: pitchers got paid
for winning games, hitters got paid for knocking in runners on
base. Players got blamed and credited for events beyond their
control. Where balls that got hit happened to land on the field, for
example.--><!-- </p>

<p>Forget baseball, forget sports. Here you had these corporate
employees, paid millions of dollars a year.--> [The players] were
doing exactly the same job that people in their business had been
doing forever.  In front of millions of people, who evaluate their
every move. They had statistics attached to everything they did. And
yet they were misvalued &ndash; because the wider world was blind to
their luck.</p>

<p>This had been going on for a century. Right under all of our
noses. And no one noticed &ndash; until it paid a poor team so well to
notice that they could not afford not to notice. And you have to ask:
if a professional athlete paid millions of dollars can be misvalued
who can&rsquo;t be? If the supposedly pure meritocracy of professional
sports can&rsquo;t distinguish between lucky and good, who can?</p>

<cite><a href="https://www.princeton.edu/main/news/archive/S33/87/54K53/">
Michael Lewis</a></cite>

</blockquote>

The same lesson applies here: effort doesn’t always lead to success,
and rejection doesn’t always mean the work was bad.  A lot depends on
timing, reviewers, priorities, and things outside our control.  That
doesn’t make the failures any less frustrating — but maybe it makes
them easier to understand.


