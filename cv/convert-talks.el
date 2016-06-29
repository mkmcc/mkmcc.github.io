(require 's)
(require 'dash)
(require 'iso-cvt)

;; translate tex character commands to unicode equivalents
;  -  copied from iso-cvt, so that i can add entries as needed
(defvar ct-iso-iso2tex-trans-tab
  "Translation table for translating TeX sequences to ISO 8859-1 characters.
This local variable contains additions to `iso-tex2iso-trans-tab' defined in
`iso-cvt'")

(setq ct-iso-iso2tex-trans-tab
      (-union iso-iso2tex-trans-tab
              '(("&" "\\\\&"))))

(defun ct-iso-iso2tex (from to)
  "Translate TeX sequences to ISO 8859-1 characters.
Translate the region between FROM and TO using the table
`iso-iso2tex-trans-tab'."
  (interactive "*r")
  (iso-translate-conventions from to ct-iso-iso2tex-trans-tab))


(defun ct-beginning-of-entry ()
  "jump to beginning of the current yaml entry"
  (beginning-of-line)
  (skip-chars-forward " \t")
  (if (looking-at "-")
      (forward-char))
  (re-search-backward "^[ \t]*-" nil 'move)
  (point))

(defun ct-next-entry ()
  "jump to the beginning of the next yaml entry."

  ;; if at the beginning of an entry, move forward one char, and call again
  (when (= (point) (save-excursion (ct-beginning-of-entry)))
    (forward-char)
    (ct-next-entry))

  ;; search forward for an entry
  (when (re-search-forward "^[ \t]*-" nil t)
    (ct-beginning-of-entry)))

(defun ct-parse-entry ()
  "parse current yaml entry.  return as an alist"

  (save-excursion
    (ct-beginning-of-entry)
    (let ((start (point))
          (end   (save-excursion
                   (if (ct-next-entry) (point) (point-max))))
          (data '())
          (yaml-regex "^-?\\s-*\\(\\sw+\\):\\s-*\\(.*\\)"))
      (while (re-search-forward yaml-regex end t)
        (push (cons (match-string-no-properties 1)
                    (match-string-no-properties 2)) data))
      data)))

(defun ct-format-entry (data)
  (let ((name  (cdr (assoc "name"  data)))
        (place (cdr (assoc "place" data)))
        (date  (cdr (assoc "date"  data))))
    (format "\\item \\textit{%s}, %s \\hspace*{\\fill} %s"
            name place date)))

(defun ct-parse-talks (talk-yaml-file)
  ""

  (let ((inhibit-read-only t)
        (buf "talklist.tex")
        (talk-list '()))

    (with-temp-buffer
      (insert-file-contents talk-yaml-file)

      ;; get the first entry
      (goto-char (point-min))
      (setq talk-list
            (-snoc talk-list (ct-parse-entry)))

      ;; now, get the rest of the entries (no do...while in elisp)
      (while (ct-next-entry)
        (setq talk-list
              (-snoc talk-list (ct-parse-entry)))))

    (with-temp-file buf

      (insert "\\begin{talkenum}" "\n\n")

      (--map (insert (ct-format-entry it) "\n\n") talk-list)

      (insert "\\end{talkenum}" "\n")

      (ct-iso-iso2tex (point-min) (point-max)))))
