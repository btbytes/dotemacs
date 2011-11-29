;; serenity.enth.local specific customisations.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path "/usr/share/common-lisp/source/slime/")
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(slime-setup)

(load (concat dotfiles-dir "myprint.el"))
;;(load "auctex.el" nil t t )
;;(load "preview-latex.el" nil t t)

(fset 'make-links
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 106 117 115 116 45 111 110 101 tab return 67108896 5 134217847 1 60 108 105 62 60 97 32 104 114 101 102 61 34 47 25 46 104 116 109 108 34 62 60 47 97 62 60 47 108 105 62 backspace backspace backspace backspace backspace backspace backspace backspace backspace 5 60 47 97 62 44 47 backspace 60 backspace backspace 60 47 105 backspace 108 105 62 1 14] 0 "%d")) arg)))

;;(setq muse-project-alist
;;      '(("notebooks" ("~/personal/longlog/notebooks" :default "index")
;;         (:base "html" :path "~/personal/longlog/www-notebooks"))))
