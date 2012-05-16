(defalias 'wq 'save-buffers-kill-emacs)
(global-set-key (kbd "s-<return>") 'ns-toggle-fullscreen)

;; clipboard integration
(global-set-key [(shift delete)] 'clipboard-kill-region)
(global-set-key [(control insert)] 'clipboard-kill-ring-save)
(global-set-key [(shift insert)] 'clipboard-yank)

;;Comment or Uncomment C-c #
(global-set-key (kbd  "\C-c#")  'comment-or-uncomment-region)

;; ;; magit
;; ;; magit-status C-c ms
(global-set-key (kbd "C-c ms") 'magit-status)

;; This hook is activated only when the magit-mode is active.
;; See http://xahlee.org/emacs/keyboard_shortcuts.html
(add-hook 'magit-mode-hook
          (lambda ()
            (define-key magit-mode-map (kbd "C-c sa") 'magit-stage-all)
            )
          )
;; plain text editing.
(add-hook 'text-mode-hook
          (lambda ()
            (define-key text-mode-map (kbd "\C-ccw") 'word-count)))


;; whitespace mode
(global-set-key "\C-c_w" 'whitespace-mode)
(global-set-key "\C-c_t" 'whitespace-toggle-options)
(global-set-key "\C-c=w" 'global-whitespace-mode)
(global-set-key "\C-c=t" 'global-whitespace-toggle-options)
(global-set-key "\C-cwc" 'whitespace-cleanup)
(global-set-key "\C-x7" 'three-quarters-windows)

;; ;; ;; buffers
(global-set-key "\C-ccb" 'clean-buffer-list)

;; make
(global-set-key (kbd "<f9>") 'compile)
