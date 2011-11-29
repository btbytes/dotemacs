(require 'ps-print)
(defvar homedir (concat (getenv "HOME") "/"))
                                        ; set the prologue directory (default works fine)

(setq ps-paper-type 'letter)
                                        ; set the n-up printing to 2 pages
(setq ps-n-up-printing 2)
(setq ps-n-up-border-p nil)
(setq ps-n-up-margin 1)

;; set the border sizes to maximize the printed area. Scale is
;; 1/72 of an inch
(setq ps-font-size (quote (8 . 10)))
(setq ps-top-margin 18)
(setq ps-bottom-margin 18)
(setq ps-left-margin 18)
(setq ps-right-margin 18)
(setq ps-n-up-margin 18)
(setq ps-inter-column 18)
                                        ;

;;;======================================================================
;;; printing package
;;; provides a plethora of additional printing commands that use
;;; the ps-print package, including print
;;; preview (pr-ps-buffer-preview)
;;;======================================================================
(require 'printing)

(setq pr-temp-dir (concat homedir "tmp"))
                                        ;(setq pr-path-style "unix")
                                        ;(setenv TEMP "/cygdrive/c/windows/temp")
(setq pr-gv-command    "/usr/bin/gv" )
(setq pr-gs-command    "/usr/bin/gs" )

