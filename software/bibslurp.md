---
title: Bibslurp
layout: page
Time-stamp: <2015-01-07 22:13:18 (mkmccjr)>
---

Introduction
------------

Creating a BibTeX file is one of the more tedious aspects of writing
a paper.  The NASA ADS system helps a lot by making bibliography
data available and easy to find, but there's still the matter of
copying and pasting it into your local database.  Since I find that
process annoying, I wrote `BibSlurp`, a set of emacs functions to
speed it along.

BibSlurp enables you to query nasa ads without leaving emacs.  As an
example, typing `M-x bibslurp-query-ads RET white rees RET` brings up
the following buffer: (the search string is sent directly to ADS, so
things like `^white rees` or `^white 1978` will also work as
expected.)

![search-results]({{site.url}}/images/search-results.png "search-results")

Let's say I want to add the second paper to my `.bib` database.
All I have to do is  hit `2 RET`.  After waiting for the
appropriate files to download, `BibSlurp` responds with the message
`saved bibtex entry to kill ring`.

![saved-to-kill-ring]({{site.url}}/images/saved-to-kill-ring.png "saved-to-kill-ring")

From here, hitting `q` takes me back to my `.bib` file, where I can
yank the entry with `C-y`: (note that bibslurp automatically
generates a label for the entry)

![yanked-entry]({{site.url}}/images/yanked-entry.png "yanked-entry")

If I'm not sure which paper I want, I can pull up the abstract by
hitting `2 a`.  From there, `q` takes be back to the search
results.

![abstract-view]({{site.url}}/images/abstract-view.png "abstract-view")


Installation
------------

If you like, you can find `BibSlurp` on [github](https://github.com/mkmcc/bibslurp).  Note that there are
two branches: the 'master' branch has the version described here,
and there's an older version which uses the lynx browser to parse
and display the html.  The older branch is probably more robust, but
the output is pretty ugly and it requires you to have the lynx
browser installed (which is worthwhile, anyways).

The 'master' branch of `bibslurp` is available on [MELPA](http://melpa.milkbox.net/).  I would
recommend installing it that way.  Adding the following code to your
`.emacs` file should enable you to install `bibslurp` using `M-x
package-install bibslurp RET`.

{% highlight elisp %}
;; Use package.el. You'll need to add MELPA to your archives:
(require 'package)
(add-to-list 'package-archives
'("melpa" . "http://melpa.milkbox.net/packages/") t)
{% endhighlight %}

If you don't want to use MELPA, or if you want to use the 'old-lynx'
branch, you'll need to install the file manually.  Once this file is
somewhere visible to emacs, you can add the following to your
`.emacs` to make it work.

{% highlight elisp %}
;; make sure file is visible to emacs (if needed)
(add-to-list 'load-path "/path/to/bibslurp.el")
;; load the file
(require 'bibslurp)
{% endhighlight %}

I hope you find BibSlurp useful.  If you find any bugs, or if you
have any suggestions for improvements, please me know --- you can
either open an issue on github, or e-mail me directly.  Patches and
pull requests are also very welcome.
