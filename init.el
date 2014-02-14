;; load libraries from .emacs.d/autorun
(dolist (f (directory-files "~/.emacs.d/init.d" t "^[^.,].*\\.el$"))
  (load-file f))

;;; Customize stuff -- it says not to delete it, so I won't

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(cperl-indent-parens-as-block t)
 '(css-electric-brace-behavior t)
 '(css-electric-semi-behavior t)
 '(css-tab-mode (quote auto))
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(graphviz-dot-auto-indent-on-newline nil)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(graphviz-dot-indent-width 4)
 '(helm-full-frame t)
 '(helm-idle-delay 0.05)
 '(helm-input-idle-delay 0.25)
 '(htmlize-html-charset "utf-8")
 '(htmlize-output-type (quote inline-css))
 '(js2-basic-offset 2)
 '(longlines-show-effect "¶
")
 '(longlines-show-hard-newlines t)
 '(org-agenda-files nil)
 '(pr-gv-command "open")
 '(ps-default-bg 1.0)
 '(ps-default-fg 0.0)
 '(ps-print-color-p nil)
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
 '(safe-local-variable-values
   (quote
    ((encoding . utf-8)
     (word-wrap . t)
     (Base . 10)
     (Syntax . ANSI-COMMON-LISP)
     (Package MEMOIZE)
     (Mode . LaTeX)
     (coding-system . iso-8859-2)
     (Syntax . COMMON-LISP))))
 '(scss-sass-command "pretend-sass")
 '(size-indication-mode t)
 '(tildify-pattern-alist
   (quote
    ((t "\\([,:;(][ 	]*[a]\\|\\<[AIKOSUVZUWikosuvzuw]\\)\\([ 	]+\\|[ 	]*
[ 	]*\\)\\(\\w\\|[([{\\]\\|<[a-zA-Z]\\)" 2))))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(vc-rcs-diff-switches "-u")
 '(w3m-cookie-accept-bad-cookies (quote ask))
 '(w3m-use-cookies t)
 '(woman-fill-frame t)
 '(woman-imenu t)
 '(woman-use-own-frame nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#EAF0F0" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "DejaVu Sans Mono")))))
(put 'scroll-left 'disabled nil)
