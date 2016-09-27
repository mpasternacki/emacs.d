(use-package boxquote
  :ensure t
  :init (load "boxquote-autoloads"))

(use-package chef-mode
  :load-path "~/Src/github.com/mpasternacki/chef-mode"
  :if (file-exists-p "~/Src/github.com/mpasternacki/chef-mode/chef-mode.el")
  :init (setq chef-use-bundler nil
              chef-use-rvm nil)
  :config (global-chef-mode 1))

(use-package ess-site
  :mode "\\.[rR]\\'"
  :commands R
  :functions R-mode
  :ensure ess)

(use-package feature-mode
  :mode "\\.feature\\'"
  :ensure t)

(use-package filladapt
  :load-path "~/.emacs.d/vendor"
  :demand t)

(use-package gnuplot
  :ensure t
  :mode ("\\.gp\\'" . gnuplot-mode))

(use-package go-mode
  :mode "\\.go\'"
  :ensure t
  :init
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

(use-package ido
  ;; builtin
  :demand t
  :config (ido-mode 1))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :mode ("\\.json$" . js2-mode)
  :mode ("\\.tfstate$" . js2-mode)
  :interpreter ("node" . js2-mode)

  :mode ("\\.jsx\\'" . js2-jsx-mode)
  :interpreter ("node" . js2-jsx-mode)

  :init
  (setq js2-basic-offset 2
        js2-mode-assume-strict t
        js2-strict-trailing-comma-warning nil)

  :config
  (progn
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
  :init
  (setq nxml-bind-meta-tab-to-complete-flag t
        nxml-slash-auto-complete-flag t)
  :config
  (define-key nxml-mode-map (kbd "C-M-f") 'nxml-forward-element)
  (define-key nxml-mode-map (kbd "C-M-b") 'nxml-backward-element)
  (define-key nxml-mode-map (kbd "M-<up>") 'jph/nxml/m-up)
  (define-key nxml-mode-map (kbd "M-<down>") 'nxml-down-element)
  (define-key nxml-mode-map (kbd "M-<right>") 'jph/nxml/m-right)
  (define-key nxml-mode-map (kbd "M-<left>") 'jph/nxml/m-left))

(use-package org
  :ensure t
  :mode ("\\.org$" . org-mode)

  ;; Org-mode to have neat TODO list.
  ;; Based on http://www.newartisans.com/blog_files/org.mode.day.planner.php
  :init (setq org-agenda-files '("~/master.org" "~/org")
              org-agenda-include-diary t
              org-agenda-ndays 7
              org-agenda-show-all-dates t
              org-agenda-skip-deadline-if-done t
              org-agenda-skip-scheduled-if-done t
              org-agenda-start-on-weekday nil
              org-deadline-warning-days 14
              org-default-notes-file "~/master.org"
              org-export-with-LaTeX-fragments t
              org-fast-tag-selection-single-key (quote expert)
              org-log-done t
              org-remember-store-without-prompt t
              org-reverse-note-order t)

  :config
  (define-key mode-specific-map [?a] 'org-agenda)
  (define-prefix-command 'org-todo-state-map)
  (define-key org-mode-map "\C-cx" 'org-todo-state-map)
  (define-key org-todo-state-map "x" (jph/org-todo-fn "CANCELLED"))
  (define-key org-todo-state-map "d" (jph/org-todo-fn "DONE"))
  (define-key org-todo-state-map "f" (jph/org-todo-fn "DEFERRED"))
  (define-key org-todo-state-map "l" (jph/org-todo-fn "DELEGATED"))
  (define-key org-todo-state-map "s" (jph/org-todo-fn "STARTED"))
  (define-key org-todo-state-map "w" (jph/org-todo-fn "WAITING"))
  ;; (define-key org-agenda-mode-map "\C-n" 'next-line)
  ;; (define-key org-agenda-keymap "\C-n" 'next-line)
  ;; (define-key org-agenda-mode-map "\C-p" 'previous-line)
  ;; (define-key org-agenda-keymap "\C-p" 'previous-line)
  )

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

(use-package sierotki
  :load-path "~/.emacs.d/vendor"
  :demand t)

(use-package terraform-mode
  :ensure t
  :mode "\\.tf\\(vars\\)?\\'"
  :init
  (setq terraform-indent-level 2))

(use-package tex-site
  :ensure auctex
  :demand t) ;; it's all autoloads anyway

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
