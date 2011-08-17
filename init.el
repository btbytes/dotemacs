;; init.el 
;; Pradeep Gowda's emacs customisations. 

;; setup some variables.
(defvar homedir (concat (getenv "HOME") "/"))
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
;;(setq utils-file (concat dotfiles-dir "utils.el"))
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq custom-file (concat dotfiles-dir "keymaps.el"))


;; load utility functions
;; (load utils-file 'noerror)

;; initilize package-manager
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; load custom file
(load custom-file 'noerror)
(load keymaps-file 'noerror) ;; always load at the end.

