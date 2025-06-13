;;; +base.el --- Custom Functions -*- lexical-binding: t; -*-

(defun load-if-exists (file)
  "Load `file` if it exists."
  (when (file-exists-p file)
    (load file)))
