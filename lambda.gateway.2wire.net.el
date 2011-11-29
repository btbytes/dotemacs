;; lambda.local.el -- (macbook) specific customisations.

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp" )
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-master nil)

;; f13 -- delete
;; f14 -- insert
(global-set-key (kbd "S-<f13>")  'clipboard-kill-region)
(global-set-key (kbd "C-<f13>")  'clipboard-kill-ring-save)
(global-set-key (kbd "S-<f14>")  'clipboard-yank)

