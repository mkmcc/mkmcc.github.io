;;; convert-bib.el --- data munging

;;; Commentary: Converts a bibtex (.bib) database produced by NASA ADS
;;;    to a yml file used to print a paper list on my website.  This
;;;    is really not meant for general use, although you may find it
;;;    useful...

;;; Code:
(require 'bibtex)
(require 'dash)
(require 's)

;;; preliminaries

;; sometimes this is needed...
(bibtex-set-dialect "BibTeX")


;;; Functions to navigate and parse bibtex entries:

(defun cb-bibtex-next-entry ()
  "Jump to the beginning of the next bibtex entry."

  ;; if at the beginning of an entry, move forward one char, and call again
  (when (= (point) (save-excursion (bibtex-beginning-of-entry)))
    (forward-char)
    (cb-bibtex-next-entry))

  ;; search forward for an entry
  (when (re-search-forward bibtex-entry-head nil t)
    (bibtex-beginning-of-entry)))

(defun cb-format-author (author-string)
  "Format the author list for printing."

  ;; first, split the string on "and"s, and take only the last name
  ;; store last names in a list called `authors'
  ;;
  ;; NB. i'm presuming the data comes from ADS, which formats author
  ;; lists as "{Last}, F.~M."
  ;;
  ;; possible bug: first or middle initials may contain braces, if
  ;; they're tex commands.  this would screw up my regexp.  it's
  ;; probably unusual to have an accented first letter, though?
  (let* ((tmp (-map 's-trim (s-split "and" author-string)))
         (authors
          (--map (replace-regexp-in-string "{\\(.*\\)}.*" "\\1" it) tmp)))

    ;; only show three authors
    (if (< 4 (length authors))
        ;; add an "et. al" if the list is longer than three...
        (mapconcat 'identity
                   (-snoc (-take 4 authors) "et. al")
                   ", ")

      ;; ... otherwise, use commas and an &
      (let ((f (-butlast authors))
            (l (car (last authors))))
        (concat (mapconcat 'identity f ", ")
                (if (= 2 (length authors)) " \\& " ", \\& ")
                l)))))

(defun cb-parse-entry ()
  "Parse a bibtex entry into a list of desired elements."
  (save-excursion
    (bibtex-beginning-of-entry)
    (let* ((data (bibtex-parse-entry t)) ; bibtex entry in alist format
           ;; take these straight from the alist
           (year   (cdr (assoc "year"   data)))
           (url    (cdr (assoc "adsurl" data)))
           (title  (cdr (assoc "title"  data)))
           (author (cb-format-author (cdr (assoc "author"  data))))
           (pub    (cdr (assoc "journal" data))))

      (if (equal "ArXiv e-prints" pub)
          (setq pub "arxiv"))

      ;; return as a simple list.  no need for anything fancier
      (list url author year pub title))))


;;; "The program in itself"

(defun parse-bib (bib-file)
  "docstring"
  (let ((inhibit-read-only t)
        (buf "publist.tex")
        (cb-bib-list nil))

    ;; read in the bibtex file and parse it
    (with-temp-buffer
      (insert-file-contents bib-file)

      ;; get the first entry
      (goto-char (point-min))
      (setq cb-bib-list
            (-snoc cb-bib-list (cb-parse-entry)))

      ;; now, get the rest of the entries (no do...while in elisp)
      (while (cb-bibtex-next-entry)
        (setq cb-bib-list
              (-snoc cb-bib-list (cb-parse-entry)))))

    ;; now, write the output
    (with-temp-file buf
      (erase-buffer)
      (insert "\\begin{pubnumerate}" "\n%\n")

      (--map (insert "\\item \\begin{samepage} " (nth 1 it)
                     (format ", \\textit{%s} (\\href{%s}{%s})"
                             (nth 3 it) (nth 0 it) (nth 2 it))
                     "\\\\" "\n"
                     (format "  \\papertitle{%s}" (nth 4 it)) "\\end{samepage}"
                     "\n"
                     "\n")
             cb-bib-list)

      (insert "\\end{pubnumerate}" "\n%\n"))))

;;; convert-bib.el ends here
