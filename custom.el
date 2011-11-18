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

;; Line truncation. See http://bit.ly/bzFM05
;;(setq truncate-lines t)

;; Colour theme
;;(require 'color-theme)
;;(require 'zenburn)
;;(zenburn)
;;(require 'color-theme-solarized)
;;(color-theme-solarized-light)
;;(color-theme-solarized-dark)

;; lua-mode. see lua-mode.el
(load (concat dotfiles-dir "lua-mode.el"))
(setq auto-mode-alist (cons'("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)
(add-hook 'lua-mode-hook 'hs-minor-mode)

;; actionscript-mode. see actionscript-mode.el
(load (concat dotfiles-dir "actionscript-mode.el"))
(setq auto-mode-alist (cons '("\\.as$" . actionscript-mode) auto-mode-alist))
(add-hook 'actionscript-mode-hook 'turn-on-font-lock)
(add-hook 'actionscript-mode-hook 'hs-minor-mode)

;; mercurial
(load (concat dotfiles-dir "mercurial.el"))
(require 'mercurial)

;; pandoc mode
(load (concat dotfiles-dir "pandoc-mode.el"))
;;(require 'pandoc-mode)
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
(autoload 'pandoc-mode "pandoc-mode" "Pandoc Mode." t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mkd\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.page\\'" . markdown-mode))

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


