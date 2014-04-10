(setq
 backward-delete-char-untabify-method 'all
 bbdb-check-zip-codes-p nil
 bbdb-north-american-phone-numbers-p nil
 ; browse-url-browser-function 'w3m-browse-url
 chef-use-bundler nil
 chef-use-rvm nil
 compile-auto-highlight t
 confirm-kill-emacs 'yes-or-no-p
 default-cursor-type 'bar
 dired-listing-switches "-lah"
 dired-recursive-deletes t
 display-time-24hr-format t
 display-time-day-and-date t
 display-time-default-load-average 1
 display-time-load-average-threshold 0.77
 font-lock-maximum-decoration t
 input-method-verbose-flag t
 jogger-jabber-port "5225"
 jogger-jabber-server "japhy.fnord.org"
 jogger-jabber-username "maciekp"
 jogger-open-stream 'open-tls-stream
 mouse-1-click-follows-link 'double
 ;; mouse-autoselect-window t ; Non-nil means autoselect window with mouse pointer.
 next-line-add-newlines nil
 nxml-bind-meta-tab-to-complete-flag t
 nxml-slash-auto-complete-flag t
 prolog-program-name "pl"
 require-final-newline 'ask
 same-window-buffer-names (delete "*shell*" (delete "*info*" same-window-buffer-names))
 special-display-buffer-names nil
 tex-default-mode 'plain-tex-mode
 tex-dvi-print-command "dvips -t a4 "
 tex-dvi-view-command "xdvi -paper a4e"
 tex-open-quote ",,"
 tex-start-options-string ""
 uniquify-buffer-name-style 'post-forward-angle-brackets
 visible-bell t
 x-select-enable-clipboard t)

(setq-default indent-tabs-mode nil)
;; (setenv "SHELL" (expand-file-name "~/.emacs.d/bin/ezsh"))

(set-face-attribute 'mode-line nil :box nil)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook (lambda () (c-set-style "k&r")))
(add-hook 'cc-mode-hook (lambda () (c-set-style "k&r")))
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

(eval-after-load "jogger"
  '(require 'tls))

(add-to-list 'auto-mode-alist '("\\.d$" . c-mode))
(add-to-list 'auto-mode-alist '("COMMON\\." . fortran-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("/\\(Rake\\|Gem\\|Vagrant\\)file$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.\\(rake\\|gemspec\\)$" . ruby-mode))
(add-to-list 'auto-mode-alist '("/\\.mutt/tmp/mutt-[^/]*$" . message-mode))

(add-to-list 'completion-ignored-extensions ".lx64fsl")
(add-to-list 'completion-ignored-extensions ".dx64fsl")
(add-to-list 'completion-ignored-extensions ".lx32fsl")
(add-to-list 'completion-ignored-extensions ".dx32fsl")
(add-to-list 'completion-ignored-extensions ".fasl")

(defalias 'perl-mode 'cperl-mode)

(setq ns-command-modifier 'meta
      ns-alternate-modifier nil)
(setenv "LC_CTYPE" "en_US.UTF-8")
(setenv "PATH" (concat "/Users/japhy/bin:"
                       (getenv "PATH")
                       ":/usr/local/bin:/usr/local/sbin"))
