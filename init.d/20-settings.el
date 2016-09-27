(add-hook 'c-mode-hook 'jph/c/k-r-style)
(add-hook 'cc-mode-hook 'jph/c/k-r-style)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'completion-setup-hook 'jph/completion-setup-hook)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(defalias 'perl-mode 'cperl-mode)

(jph/add-to-list* 'auto-mode-alist
                  '("\\.d$" . c-mode)
                  '("COMMON\\." . fortran-mode))

(jph/add-to-list* 'completion-ignored-extensions
                  ".lx64fsl"
                  ".dx64fsl"
                  ".lx32fsl"
                  ".dx32fsl"
                  ".fasl")

(set-default-font "liberation mono-10")  ; "dejavu sans mono-14"

(setq
 backward-delete-char-untabify-method 'all
 bbdb-check-zip-codes-p nil
 bbdb-north-american-phone-numbers-p nil
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
 mouse-1-click-follows-link 'double
 next-line-add-newlines nil
 ns-command-modifier 'meta
 ns-alternate-modifier nil
 prolog-program-name "pl"
 require-final-newline 'ask
 same-window-buffer-names (delete "*shell*"
                                  (delete "*info*"
                                          same-window-buffer-names))
 special-display-buffer-names nil
 tex-start-options-string ""
 visible-bell t
 x-select-enable-clipboard t)

(setq-default indent-tabs-mode nil)

(windmove-default-keybindings)
