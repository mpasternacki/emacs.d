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
 '(column-number-mode t)
 '(cperl-indent-parens-as-block t)
 '(css-electric-brace-behavior t)
 '(css-electric-semi-behavior t)
 '(css-tab-mode (quote auto))
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(erc-modules
   (quote
    (button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(focus-follows-mouse t)
 '(gofmt-command "goimports")
 '(graphviz-dot-auto-indent-on-newline nil)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(graphviz-dot-indent-width 4)
 '(grep-command "ack --nogroup -H ")
 '(js2-basic-offset 2)
 '(js2-mode-assume-strict t)
 '(js2-strict-trailing-comma-warning nil)
 '(longlines-show-effect "¶
")
 '(longlines-show-hard-newlines t)
 '(mail-header-separator "")
 '(mailcap-download-directory "~/Downloads")
 '(make-pointer-invisible nil)
 '(message-sendmail-envelope-from (quote header))
 '(mm-inline-large-images nil)
 '(mm-inline-large-images-proportion 0.1)
 '(mouse-autoselect-window t)
 '(mouse-avoidance-banish-position
   (quote
    ((frame-or-window . window)
     (side . right)
     (side-pos . 3)
     (top-or-bottom . top)
     (top-or-bottom-pos . 0))))
 '(org-agenda-files nil)
 '(ps-default-bg 1.0)
 '(ps-default-fg 0.0)
 '(ps-print-color-p nil)
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren-style nil)
 '(safe-local-variable-values
   (quote
    ((TeX-auto-save . t)
     (TeX-parse-self . t)
     (auto-fill-mode . 0)
     (jph/gofmt-before-save)
     (encoding . utf-8)
     (word-wrap . t)
     (Base . 10)
     (Syntax . ANSI-COMMON-LISP)
     (Package MEMOIZE)
     (Mode . LaTeX)
     (coding-system . iso-8859-2)
     (Syntax . COMMON-LISP))))
 '(scss-sass-command "pretend-sass")
 '(size-indication-mode t)
 '(terraform-indent-level 2)
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
 '(default ((t (:inherit nil :stipple nil :background "#EAF0F0" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "Liberation Mono")))))
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
