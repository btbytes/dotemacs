;; init.el 
;; Pradeep Gowda's emacs customisations. 

;; setup some variables.
(defvar homedir (concat (getenv "HOME") "/"))
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
;;(setq utils-file (concat dotfiles-dir "utils.el"))
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq keymaps-file (concat dotfiles-dir "keymaps.el"))
(setq utils-file (concat dotfiles-dir "utils.el"))


;; load utility functions
;; (load utils-file 'noerror)

;; initilize package-manager
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell
                                  starter-kit-bindings scpaste
                                  markdown-mode tuareg slime
                                  org parenface pastebin pep8
                                  pony-mode pyflakes pylint pymacs
                                  pysmell pytest python python-mode python-pep8
                                  python-pylint auctex
                                  color-theme color-theme-solarized
                                  printing company gist dpaste gnuplot
                                  marmalade))

(add-to-list 'load-path  (concat homedir "elisp/slime"))
(setq slime-lisp-implementations
      '((sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix)
        (abcl (concat homedir "abcl" "abcl") :coding-system utf-8-unix)
        ))
(require 'slime)
(slime-setup '(slime-repl slime-asdf slime-fancy slime-banner)) 

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))
;; load custom file
(load custom-file 'noerror)
(load utils-file 'noerror)
(load keymaps-file 'noerror) ;; always load at the end.


