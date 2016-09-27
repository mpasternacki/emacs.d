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
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(focus-follows-mouse t)
 '(graphviz-dot-auto-indent-on-newline nil)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(graphviz-dot-indent-width 4)
 '(grep-command "ack --nogroup -H ")
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
 '(tildify-pattern-alist
   (quote
    ((t "\\([,:;(][ 	]*[a]\\|\\<[AIKOSUVZUWikosuvzuw]\\)\\([ 	]+\\|[ 	]*
[ 	]*\\)\\(\\w\\|[([{\\]\\|<[a-zA-Z]\\)" 2))))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(vc-rcs-diff-switches "-u")
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
