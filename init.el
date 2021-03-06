;;; Use packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;; Use use-package to manage packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;;; Global hooks and settings (before loading packages)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(defalias 'perl-mode 'cperl-mode)

(add-to-list 'auto-mode-alist '("\\.d$" . c-mode))
(add-to-list 'auto-mode-alist '("COMMON\\." . fortran-mode))

(add-to-list 'completion-ignored-extensions ".lx64fsl")
(add-to-list 'completion-ignored-extensions ".dx64fsl")
(add-to-list 'completion-ignored-extensions ".lx32fsl")
(add-to-list 'completion-ignored-extensions ".dx32fsl")
(add-to-list 'completion-ignored-extensions ".fasl")

(set-default-font "liberation mono-10")  ; "dejavu sans mono-14"

(setq backward-delete-char-untabify-method 'all
      bbdb-check-zip-codes-p nil
      bbdb-north-american-phone-numbers-p nil
      c-default-style "k&r"
      c-basic-offset 4
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
      is-indent-level 2
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

;;; Packages

(use-package bbdb
  :ensure t
  :init (setq bbdb-offer-save 1)
  :config (bbdb-initialize))

(use-package boxquote
  :ensure t
  :init (load "boxquote-autoloads"))

(use-package chef-mode
  :load-path "~/Src/github.com/mpasternacki/chef-mode"
  :if (file-exists-p "~/Src/github.com/mpasternacki/chef-mode/chef-mode.el")
  :init (setq chef-use-bundler nil
              chef-use-rvm nil)
  :config (global-chef-mode 1))

;; (use-package ess-site
;;   :mode "\\.[rR]\\'"
;;   :commands R
;;   :functions R-mode
;;   :ensure ess)

(use-package ess
  :init (require 'ess-site)
  :ensure t)

(use-package feature-mode
  :mode "\\.feature\\'"
  :ensure t)

(use-package filladapt ; http://www.wonderworks.com/download/filladapt.el
  :load-path "~/.emacs.d/site-lisp"
  :demand t)

(use-package gnuplot
  :ensure t
  :mode ("\\.gp\\'" . gnuplot-mode))

(use-package go-mode
  :mode "\\.go\'"
  :ensure t
  :init
  (defun jph/go-mode-hook ()
    (setq tab-width 2))
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'jph/go-mode-hook))

(use-package graphviz-dot-mode
  :ensure t
  :mode "\\.dot\\'")

(use-package haml-mode
  :ensure t
  :mode "\\.haml\\'")

(use-package htmlize
  :ensure t
  :init
  (load "htmlize-autoloads")
  (setq htmlize-html-charset "utf-8"
        htmlize-output-type 'inline-css))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  ; Use Enter on a directory to navigate into the directory, not open it with dired.
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
  :init
  (setq ivy-use-selectable-prompt t))

(use-package ivy-pass
  :ensure t
  :commands ivy-pass)

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :mode ("\\.json$" . js2-mode)
  :mode ("\\.tfstate$" . js2-mode)
  :interpreter ("node" . js2-mode)

  ;; :mode ("\\.jsx\\'" . js2-jsx-mode)
  ;; :interpreter ("node" . js2-jsx-mode)

  :config
  (progn
    (setq js2-basic-offset 2
          js2-mode-assume-strict t
          js2-strict-trailing-comma-warning nil)

    (defadvice js2-reparse (before json)
      (setq js2-buffer-file-name buffer-file-name))
    (ad-activate 'js2-reparse)

    (defadvice js2-parse-statement (around json)
      (if (and (= tt js2-LC)
               js2-buffer-file-name
               (or (string-equal (substring js2-buffer-file-name -5) ".json")
                   (string-equal (substring js2-buffer-file-name -8) ".tfstate"))
               (eq (+ (save-excursion
                        (goto-char (point-min))
                        (back-to-indentation)
                        (while (eolp)
                          (next-line)
                          (back-to-indentation))
                        (point)) 1) js2-ts-cursor))
          (setq ad-return-value (js2-parse-assign-expr))
        ad-do-it))
    (ad-activate 'js2-parse-statement)))

(use-package rjsx-mode
  :ensure t

  :mode ("\\.jsx\\'" . rjsx-mode)
  :interpreter ("node" . rjsx-mode))

(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'")

(use-package magit
  :ensure t
  :commands magit-status)

(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

(use-package message
  ;; builtin
  :mode ("/\\.mutt/tmp/mutt-[^/]*$" . message-mode))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package nxml-mode
  ;; builtin
  :mode "\\.xml\\'"
  :init (setq nxml-bind-meta-tab-to-complete-flag t
              nxml-slash-auto-complete-flag t))

(use-package org
  :ensure t
  :mode ("\\.org$" . org-mode))

(use-package paredit
  :ensure t
  :commands paredit-mode
  :init
  (add-hook 'lisp-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  :config
  (define-key paredit-mode-map (kbd "C-j") nil))

(use-package pastelmac-theme
  :ensure t
  :demand t
  :config (pastelmac-theme))

(use-package php-mode
  :ensure t
  :mode "\\.php\\'")

(use-package psvn
  :ensure t
  :commands svn-status)

(use-package python-mode
  :mode "\\.py\\'"
  :interpreter "python"
  :ensure t)

(use-package ragel-mode
  :load-path "~/.emacs.d/site-lisp"
  :mode "\\.rl\\'")

(use-package ruby-mode
  :mode "\\.rb\\'"
  :mode "/\\(Rake\\|Gem\\|Vagrant\\)file\\'"
  :mode "\\.\\(rake\\|gemspec\\)\\'"
  :interpreter "ruby"

  :init (setq ruby-deep-arglist nil
              ruby-deep-indent-paren-style nil)

  :config
  (defadvice ruby-indent-line (after line-up-args activate)
    (let (indent prev-indent arg-indent)
      (save-excursion
        (back-to-indentation)
        (when (zerop (car (syntax-ppss)))
          (setq indent (current-column))
          (skip-chars-backward " \t\n")
          (cond
           ((eq ?\\ (char-before))
            (back-to-indentation)
            (setq prev-indent (current-column))
            (setq arg-indent (+ ruby-indent-level prev-indent)))
           ((eq ?, (char-before))
            (ruby-backward-sexp)
            (back-to-indentation)
            (setq prev-indent (current-column))
            (skip-syntax-forward "w_.")
            (skip-chars-forward " ")
            (setq arg-indent (current-column))))))
      (when prev-indent
        (let ((offset (- (current-column) indent)))
          (cond ((< indent prev-indent)
                 (indent-line-to prev-indent))
                ((= indent prev-indent)
                 (indent-line-to arg-indent)))
          (when (> offset 0) (forward-char offset)))))))

(use-package scratch
  :ensure t
  :commands scratch)

(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'")

(use-package sierotki ; emacswiki:sierotki.el
  :load-path "~/.emacs.d/site-lisp"
  :demand t)

(use-package swiper
  :ensure t
  :commands swiper)

(use-package terraform-mode
  :ensure t
  :mode "\\.tf\\(vars\\)?\\'"
  :init
  (setq terraform-indent-level 2))

(use-package tex-site
  :ensure auctex
  :demand t                             ; it's all autoloads anyway

  :init
  ;; https://emacs.stackexchange.com/questions/3083/how-to-indent-items-in-latex-auctex-itemize-environments
  (defun LaTeX-indent-item ()
    "Provide proper indentation for LaTeX \"itemize\",\"enumerate\", and
\"description\" environments.

  \"\\item\" is indented `LaTeX-indent-level' spaces relative to
  the the beginning of the environment.

  Continuation lines are indented either twice
  `LaTeX-indent-level', or `LaTeX-indent-level-item-continuation'
  if the latter is bound."
    (save-match-data
      (let* ((offset LaTeX-indent-level)
             (contin (or (and (boundp 'LaTeX-indent-level-item-continuation)
                              LaTeX-indent-level-item-continuation)
                         (* 2 LaTeX-indent-level)))
             (re-beg "\\\\begin{")
             (re-end "\\\\end{")
             (re-env "\\(itemize\\|\\enumerate\\|description\\)")
             (indent (save-excursion
                       (when (looking-at (concat re-beg re-env "}"))
                         (end-of-line))
                       (LaTeX-find-matching-begin)
                       (current-column))))
        (cond ((looking-at (concat re-beg re-env "}"))
               (or (save-excursion
                     (beginning-of-line)
                     (ignore-errors
                       (LaTeX-find-matching-begin)
                       (+ (current-column)
                          (if (looking-at (concat re-beg re-env "}"))
                              contin
                            offset))))
                   indent))
              ((looking-at (concat re-end re-env "}"))
               indent)
              ((looking-at "\\\\item")
               (+ offset indent))
              (t
               (+ contin indent))))))

  (defcustom LaTeX-indent-level-item-continuation 4
    "*Indentation of continuation lines for items in itemize-like
environments."
    :group 'LaTeX-indentation
    :type 'integer)

  (eval-after-load "latex"
  '(setq LaTeX-indent-environment-list
         (nconc '(("itemize" LaTeX-indent-item)
                  ("enumerate" LaTeX-indent-item)
                  ("description" LaTeX-indent-item))
                LaTeX-indent-environment-list))))

(use-package uniquify
  ;; builtin
  :demand t
  :init (setq uniquify-buffer-name-style 'forward))

(use-package whitespace
  ;; builtin
  :demand t
  :init (setq whitespace-style '(face
                                 trailing
                                 tabs
                                 lines-tail
                                 empty
                                 indentation
                                 space-after-tab))
  :config (global-whitespace-mode t))

(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")

;;; Minor modes

(auto-compression-mode 1)
(auto-image-file-mode 1)
(blink-cursor-mode 0)
(column-number-mode 1)
(display-time)
(electric-pair-mode 1)
(global-font-lock-mode 1)
(menu-bar-mode 1)
(mouse-avoidance-mode 'exile)
(recentf-mode 1)
(size-indication-mode 1)
(tool-bar-mode 0)

;;; Final touches

(windmove-default-keybindings)
(server-start)

;;; Customize stuff -- it says not to delete it, so I won't

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-item-indent 0)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cperl-indent-parens-as-block t)
 '(css-electric-brace-behavior t)
 '(css-electric-semi-behavior t)
 '(css-tab-mode (quote auto))
 '(display-time-mode t)
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(flycheck-javascript-eslint-executable "dwim.eslint")
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
 '(package-selected-packages
   (quote
    (preseed-generic-mode nov ivy-pass swiper ivy flycheck haskell-mode graphql-mode less-css-mode rjsx-mode groovy-mode bbdb-vcard emms bbdb yaml-mode use-package tracwiki-mode terraform-mode scss-mode scratch python-mode psvn projectile pretty-symbols php-mode pastelmac-theme paredit org-trello multiple-cursors markdown-mode magit lua-mode logstash-conf js2-mode htmlize haml-mode grizzl graphviz-dot-mode go-eldoc gnuplot feature-mode f ess epresent color-theme cmake-mode boxquote avy auctex ace-jump-mode)))
 '(ps-default-bg 1.0)
 '(ps-default-fg 0.0)
 '(ps-print-color-p nil)
 '(safe-local-variable-values
   (quote
    ((js2-additional-externs "__dirname")
     (js2-additional-externs "after" "before" "describe" "it")
     (js2-additional-externs "describe" "it")
     (js2-additional-externs "fetch")
     (js2-include-node-externs . t)
     (TeX-auto-save . t)
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
 '(tildify-pattern
   "\\(?:[,:;(][ 	]*[a]\\|\\<[AIKOSUVWZikosuvwz]\\)\\([ 	]+\\|[ 	]*
[ 	]*\\)\\(?:\\w\\|[([{\\]\\|<[a-zA-Z]\\)")
 '(tildify-pattern-alist
(quote
 ((t "\\([,:;(][ 	]*[a]\\|\\<[AIKOSUVZUWikosuvzuw]\\)\\([ 	]+\\|[ 	]*
[ 	]*\\)\\(\\w\\|[([{\\]\\|<[a-zA-Z]\\)" 2))))
 '(tildify-string-alist (quote ((latex-mode . "~"))))
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
 '(default ((t (:inherit nil :stipple nil :background "#EAF0F0" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "Liberation Mono"))))
 '(whitespace-line ((t (:underline (:color "dark magenta" :style wave))))))
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
