(require 's)
(require 'dash)

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

(defvar tab-index 0)
(defvar tot-cpu 0.0)
(defvar tot-dollar 0.0)

(defun ct-format-entry (data)
  (let ((name   (cdr (assoc "agency" data)))
        (cpu    (cdr (assoc "cpu"    data)))
        (dollar (cdr (assoc "dollar" data)))
        (pi     (cdr (assoc "pi" data)))
        (year   (cdr (assoc "year"   data)))
        (sep "  &  "))

    (setq tab-index (1+ tab-index))
    (setq tot-cpu (+ tot-cpu (string-to-number cpu)))
    (setq tot-dollar (+ tot-dollar (string-to-number dollar)))

    (concat (format "%d" tab-index) sep
            (format "\\textsc{\\MakeTextLowercase{%s}}" name) sep
            cpu sep
            dollar sep year "\\\\")))

(defun ct-include? (entry)
  (let ((type (cdr (assoc "type" entry)))
        (dollar (cdr (assoc "dollar" entry))))
    (and (equal "computing" type)
         (< 0 (string-to-number dollar)))))

(defun ct-parse-talks (talk-yaml-file)
  ""

  (let ((inhibit-read-only t)
        (buf "computinglist.tex")
        (talk-list '()))

    (with-temp-buffer
      (insert-file-contents talk-yaml-file)

      (goto-char (point-min))
      (while (ct-next-entry)
        (let ((entry (ct-parse-entry)))
          (when (ct-include? entry)
            (setq talk-list (-snoc talk-list entry))))))

    (with-temp-file buf

      (insert "\\begin{tabular}{rlrrr}" "\n\n" "\\toprule")
      (insert " & \\multicolumn{1}{c}{agency} & \\multicolumn{1}{c}{award} "
              " & \\multicolumn{1}{c}{value} & \\multicolumn{1}{c}{year} \\\\ "
              "\n")
      (insert "&  & \\multicolumn{1}{c}{($\\times10^6$ hour)} & "
              "\\multicolumn{1}{c}{(\\$k)} &  \\\\ \\midrule" "\n\n")


      (let ((data (-map 'ct-format-entry talk-list)))
        (--map (insert it "\n\n") (reverse data)))

      (insert (concat "\\\\[-0.5ex] " "\\multicolumn{2}{r}{\\textit{total:}} & "
                      (format "$%.1f\\times{10^6}$" tot-cpu) "  & "
                      (format "\\$$%.0f$k" tot-dollar) " & " "\\\\"))

      (insert "\\bottomrule")
      (insert "\\end{tabular}" "\n"))))
