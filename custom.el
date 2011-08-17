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


;; Line truncation. See http://bit.ly/bzFM05
;;(setq truncate-lines t)

;; Colour theme
(require 'color-theme)
;;(color-theme-zenburn)
;;(require 'color-theme)
;;(require 'color-theme-solarized)
;;(color-theme-solarized-light)

;; lua-mode. see lua-mode.el
(load (concat dotfiles-dir "lua-mode.el"))
(setq auto-mode-alist (cons'("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)
(add-hook 'lua-mode-hook 'hs-minor-mode)

;; org-mode. see custorg.el
(setq custom-file (concat dotfiles-dir "custorg.el"))
(load custom-file 'noerror)

;; whitespace mode.
(require 'whitespace)
(autoload 'whitespace-mode
  "whitespace" "Toggle whitespace visualization." t)
(autoload 'global-whitespace-toggle-options
  "whitespace" "Toggle global `whitespace-mode' options." t)


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


(defun three-quarters-windows ()
  "Resizes the current window big; via sigusr2.net"
  (interactive)
  (let ((size (- (truncate (* 0.75 (frame-height))) (window-height))))
    (if (> size 0)
        (enlarge-window size))
    )
  )


