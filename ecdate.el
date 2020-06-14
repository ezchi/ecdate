;;; ecdate.el --- Helper function for parsing date -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Enze Chi
;;
;; Author: Enze Chi <http://github/ezchi>
;; Maintainer: Enze Chi <Enze.Chi@gmail.com>
;; Created: June 14, 2020
;; Modified: June 14, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/ezchi/ecdate
;; Package-Requires: ((emacs 26.3) (cl-lib "0.5") (org "9.2"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Helper function for parsing date
;;
;;; Code:

(require 'org-datetree)

(defun ecdate/get-date (&optional time)
  "Return (DAY MONTH YEAR) list from TIME.

If TIME is nil, use current time."
  (seq-subseq (decode-time time) 3 6))

(defun ecdate/to-usa (date)
  "Convert DATE from (DAY MONTH YEAR) to USA format (MONTH DAY YEAR)."
  (list (nth 1 date) (nth 0 date) (nth 2 date)))

(defun ecdate/org-insert-datetree (&optional date)
  "Insert datetree with give DATE.

If DATE is nil, read date from calendar."
  (interactive)
  (if (eq major-mode 'org-mode)
      (let (date (or date (ecdate/to-usa (ecdate/get-date (parsse-time-string (org-read-date))))))
        (org-datetree-find-date-create date))
    (error "Can not insert datetree into non org-mode file")))

(provide 'ecdate)
;;; ecdate.el ends here
