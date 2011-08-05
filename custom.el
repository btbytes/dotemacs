;; use cl
(require 'cl)
;; setup some variables.
(defvar homedir (concat (getenv "HOME") "/"))

;; and constants
(setq column-number-mode t)

;; UTILITY FUNCTIONS
(defun load-if-exists (path name)
  "Load library if it exists in the path"
  (if (file-exists-p path)
      (progn (add-to-list 'load-path path)
             (require name))))

;; highlight current line. Uses highline package.
;; XXX: fix highlight colour before using this.
;;(highline-mode-on)

;;Comment or Uncomment C-c #
(global-set-key "\C-c#"  'comment-or-uncomment-region)


;; Make
;; (global-set-key "C-c 9" 'compile)

;; magit
;; magit-status C-c ms
(global-set-key (kbd "C-c ms") 'magit-status)

;; This hook is activated only when the magit-mode is active.
;; See http://xahlee.org/emacs/keyboard_shortcuts.html
(add-hook 'magit-mode-hook
          (lambda ()
            (define-key magit-mode-map (kbd "C-c sa") 'magit-stage-all)
            )
          )

;; Line truncation. See http://bit.ly/bzFM05
;;(setq truncate-lines t)

;; Colour theme
(require 'color-theme)
;;(color-theme-zenburn)
;;(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-solarized-light)

;; whitespace mode.
(require 'whitespace)
(autoload 'whitespace-mode
  "whitespace" "Toggle whitespace visualization." t)
(autoload 'global-whitespace-toggle-options
  "whitespace" "Toggle global `whitespace-mode' options." t)

(global-set-key "\C-c_w" 'whitespace-mode)
(global-set-key "\C-c_t" 'whitespace-toggle-options)
(global-set-key "\C-c=w" 'global-whitespace-mode)
(global-set-key "\C-c=t" 'global-whitespace-toggle-options)
(global-set-key "\C-cwc" 'whitespace-cleanup)

;; custom whitespace setup.
(setq whitespace-style '(trailing
                         lines
                         space-before-tab
                         indentation
                         space-after-tab)
      whitespace-line-column 80)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(weblogger-config-alist (quote (("pgw" "http://pradeepgowda.com/w/xmlrpc.php" "pgowda" "" "1")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; org-mode. see custorg.el
(setq custom-file (concat dotfiles-dir "custorg.el"))
(load custom-file 'noerror)

