;;; convert-bib.el --- data munging

;;; Commentary: Converts a bibtex (.bib) database produced by NASA ADS
;;;    to a yml file used to print a paper list on my website.  This
;;;    is really not meant for general use, although you may find it
;;;    useful...

;;; Code:
(require 'bibtex)
(require 'dash)
(require 's)
(require 'iso-cvt)

;;; preliminaries

;; sometimes this is needed...
(bibtex-set-dialect "BibTeX")


;;; first, define some long boring lists of replacements...

;; translate tex character commands to unicode equivalents
;  -  copied from iso-cvt, so that i can add entries as needed
(defvar cb-iso-tex2iso-trans-tab
  "Translation table for translating TeX sequences to ISO 8859-1 characters.
This local variable contains additions to `iso-tex2iso-trans-tab' defined in
`iso-cvt'")

(setq cb-iso-tex2iso-trans-tab
      (-union iso-tex2iso-trans-tab
              '(("'" "’")
                ("{\\\\v c}" "č")
                ("{\\\\v s}" "š"))))

(defun cb-iso-tex2iso (from to)
 "Translate TeX sequences to ISO 8859-1 characters.
Translate the region between FROM and TO using the table
`iso-tex2iso-trans-tab'."
 (interactive "*r")
 (iso-translate-conventions from to cb-iso-tex2iso-trans-tab))

;; convert journal macros to names
(defvar cb-journal-replacement
  '()
  "cons list of replacements for journal abbreviations")

(setq cb-journal-replacement
      '(("\\aj"           . "AJ")
        ("\\araa"         . "ARA&A")
        ("\\apj"          . "ApJ")
        ("\\apjl"         . "ApJ")
        ("\\apjs"         . "ApJS")
        ("\\ao"           . "Appl. Opt.")
        ("\\apss"         . "Ap&SS")
        ("\\aap"          . "A&A")
        ("\\aapr"         . "A&A Rev.")
        ("\\aaps"         . "A&AS")
        ("\\azh"          . "AZh")
        ("ArXiv e-prints" . "arxiv")
        ("\\baas"         . "BAAS")
        ("\\jrasc"        . "JRASC")
        ("\\memras"       . "MmRAS")
        ("\\mnras"        . "MNRAS")
        ("\\pra"          . "Phys. Rev. A")
        ("\\prb"          . "Phys. Rev. B")
        ("\\prc"          . "Phys. Rev. C")
        ("\\prd"          . "Phys. Rev. D")
        ("\\pre"          . "Phys. Rev. E")
        ("\\prl"          . "Phys. Rev. Lett.")
        ("\\pasp"         . "PASP")
        ("\\pasj"         . "PASJ")
        ("\\qjras"        . "QJRAS")
        ("\\skytel"       . "S&T")
        ("\\solphys"      . "Sol. Phys.")
        ("\\sovast"       . "Soviet Ast.")
        ("\\ssr"          . "Space Sci. Rev.")
        ("\\zap"          . "ZAp")
        ("\\nat"          . "Nature")
        ("\\iaucirc"      . "IAU Circ.")
        ("\\aplett"       . "Astrophys. Lett.")
        ("\\apspr"        . "Astrophys. Space Phys. Res.")
        ("\\bain"         . "Bull. Astron. Inst. Netherlands")
        ("\\fcp"          . "Fund. Cosmic Phys.")
        ("\\gca"          . "Geochim. Cosmochim. Acta")
        ("\\grl"          . "Geophys. Res. Lett.")
        ("\\jcp"          . "J. Chem. Phys.")
        ("\\jgr"          . "J. Geophys. Res.")
        ("\\jqsrt"        . "J. Quant. Spec. Radiat. Transf.")
        ("\\memsai"       . "Mem. Soc. Astron. Italiana")
        ("\\nphysa"       . "Nucl. Phys. A")
        ("\\physrep"      . "Phys. Rep.")
        ("\\physscr"      . "Phys. Scr")
        ("\\planss"       . "Planet. Space Sci.")
        ("\\procspie"     . "Proc. SPIE")))

(defun cb-fix-journal (journal)
  "replace the latex journal name macro with the corresponding string"
  (let ((tmp (assoc journal cb-journal-replacement)))
    (if tmp (cdr tmp)
      journal)))


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
                (if (= 2 (length authors)) " & " ", & ")
                l)))))

(defun cb-parse-entry ()
  "Parse a bibtex entry into a list of desired elements."
  (save-excursion
    (bibtex-beginning-of-entry)
    (let* ((data (bibtex-parse-entry t)) ; bibtex entry in alist format
           ;; take these straight from the alist
           (year   (cdr (assoc "year"   data)))
           (url    (cdr (assoc "adsurl" data)))
           ;; these need special attention
           (author (cb-format-author (cdr (assoc "author"  data))))
           (pub    (cb-fix-journal   (cdr (assoc "journal" data)))))

      ;; return as a simple list.  no need for anything fancier
      (list url author year pub))))


;;; "The program in itself"

(defun parse-bib (bib-file)
  "docstring"
  (let ((inhibit-read-only t)
        (buf "papers.yml")
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

      (--map (insert "- url: "     (nth 0 it) "\n"
                     "  authors: " (nth 1 it) "\n"
                     "  year: "    (nth 2 it) "\n"
                     "  pub: "     (nth 3 it) "\n"
                     "\n")
             cb-bib-list)

      ;; convert latex markup characters to unicode
      (cb-iso-tex2iso (point-min) (point-max)))))

;;; convert-bib.el ends here
