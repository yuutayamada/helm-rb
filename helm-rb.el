;;; -*- coding: utf-8; mode: emacs-lisp; -*-

(require 'helm)
(require 'helm-ag-r)

(defvar helm-rb-get-methods-path ""
  "Specify get_methods.rb's path of this package")
(defvar helm-rb-methods-list nil)

(defvar helm-rb-source
  '((name . "helm-rb")
    (candidate-in-buffer)
    (action . helm-rb-action)))

(defun helm-rb-action (line)
  (pop-to-buffer "*ri(helm-rb)*")
  (erase-buffer)
  (insert
   (shell-command-to-string
    (concat "ri -f markdown "
            (shell-quote-argument line))))
  (goto-char (point-min)))

(defun helm-rb-setup ()
  (let* ((command
          (concat
           "ruby "
           (shell-quote-argument helm-rb-get-methods-path)))
         (methods-list (split-string
                        (shell-command-to-string command) "\n")))
    (setq helm-rb-methods-list methods-list)))

(defun helm-rb-init ()
  (if helm-rb-methods-list
      helm-rb-methods-list
    (helm-rb-setup)))

;;;###autoload
(defun helm-rb ()
  (let ((helm-ag-r-user-option "--nocolor"))
    (helm-ag-r-pype
     (concat "ruby " (shell-quote-argument helm-rb-get-methods-path))
     helm-rb-source)))

(provide 'helm-rb)
