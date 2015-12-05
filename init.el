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
 '(erc-modules
   (quote
    (button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(focus-follows-mouse t)
 '(gofmt-command "goimports")
 '(graphviz-dot-auto-indent-on-newline nil)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(graphviz-dot-indent-width 4)
 '(grep-command "ack --nogroup -H ")
 '(helm-full-frame t)
 '(helm-idle-delay 0.05)
 '(helm-input-idle-delay 0.25)
 '(htmlize-html-charset "utf-8")
 '(htmlize-output-type (quote inline-css))
 '(js2-basic-offset 2)
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
 '(notmuch-address-command "~/Mail/bin/search-addressbook.pl")
 '(notmuch-archive-tags (quote ("-inbox" "-unread")))
 '(notmuch-fcc-dirs
   (quote
    (("maciej@pasternacki\\.net" . "mailbox.org/INBOX")
     ("mpasternacki.*@mailbox\\.org" . "mailbox.org/INBOX"))))
 '(notmuch-message-headers
   (quote
    ("Subject" "From" "To" "Cc" "Date" "Message-ID" "X-Mailer" "User-Agent" "X-URL")))
 '(notmuch-poll-script "/Users/japhy/Mail/bin/sync")
 '(notmuch-print-mechanism (quote notmuch-print-muttprint))
 '(notmuch-saved-searches
   (quote
    ((:name "pasternacki.net/INBOX" :query "tag:inbox AND tag:pasternacki.net")
     (:name "3ofcoins.net/INBOX" :query "tag:inbox AND tag:3ofcoins.net")
     (:name "inbox" :query "tag:inbox" :key "i")
     (:name "unread" :query "tag:unread" :key "u")
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "t")
     (:name "drafts" :query "tag:draft" :key "d")
     (:name "all mail" :query "*" :key "a")
     (:name "spam" :query "tag:spam")
     (:name "junk" :query "tag:junk"))))
 '(notmuch-search-oldest-first nil)
 '(notmuch-show-part-button-default-action (quote notmuch-show-view-part))
 '(notmuch-tree-show-out t)
 '(org-agenda-files nil)
 '(package-archives (quote (("MELPA" . "http://melpa.org/packages/"))))
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
