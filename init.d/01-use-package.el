(require 'use-package)
(mapc (lambda(p) (push p package-archives))
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-refresh-contents)
(package-initialize)

(use-package python-mode
  :mode "\\.py\\'"
  :interpreter "python"
  :ensure t)

(use-package feature-mode
  :mode "\\.feature\\'"
  :ensure t)

(use-package ess-site
  :mode "\\.[rR]\\'"
  :commands R
  :functions R-mode
  :ensure ess)

(use-package php-mode
  :ensure t
  :mode "\\.php\\'")

(use-package paredit
  :ensure t
  :commands paredit-mode
  :init
  (add-hook 'lisp-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  :config
  (define-key paredit-mode-map (kbd "C-j") nil))

(use-package graphviz-dot-mode
  :ensure t
  :mode "\\.dot\\'")

(use-package magit
  :ensure t
  :commands magit-status)

(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")

(use-package haml-mode
  :ensure t
  :mode "\\.haml\\'")

(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'")

(use-package nxml-mode
  ;; builtin
  :mode "\\.xml\\'"
  :init
  (setq nxml-bind-meta-tab-to-complete-flag t
        nxml-slash-auto-complete-flag t)
  :config
  (define-key nxml-mode-map (kbd "C-M-f") 'nxml-forward-element)
  (define-key nxml-mode-map (kbd "C-M-b") 'nxml-backward-element)

  (define-key nxml-mode-map (kbd "M-<up>") '(lambda (arg)
                                              (interactive "p")
                                              (or arg (set arg 1))
                                              (nxml-up-element (- arg))))

  (define-key nxml-mode-map (kbd "M-<down>") 'nxml-down-element)

  (define-key nxml-mode-map (kbd "M-<right>")
    '(lambda (arg)
       (interactive "p")
       (nxml-up-element -1)
       (nxml-forward-element arg)
       (nxml-down-element)))

  (define-key nxml-mode-map (kbd "M-<left>")
    '(lambda (arg)
       (interactive "p")
       (nxml-up-element -1)
       (nxml-backward-element arg)
       (nxml-down-element))))

(use-package scratch
  :ensure t
  :commands scratch)

(use-package gnuplot
  :ensure t
  :mode ("\\.gp\\'" . gnuplot-mode))

(use-package boxquote
  :ensure t
  :commands (boxquote-title
             boxquote-region
             boxquote-buffer
             boxquote-insert-file
             boxquote-insert-buffer
             boxquote-kill-ring-save
             boxquote-yank
             boxquote-defun
             boxquote-paragraph
             boxquote-boxquote
             boxquote-describe-function
             boxquote-describe-variable
             boxquote-describe-key
             boxquote-shell-command
             boxquote-where-is
             boxquote-text
             boxquote-narrow-to-boxquote
             boxquote-narrow-to-boxquote-content
             boxquote-kill
             boxquote-fill-paragraph
             boxquote-unbox-region
             boxquote-unbox))

(use-package psvn
  :ensure t
  :commands svn-status)

(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")

(use-package htmlize
  :ensure t
  :commands (htmlize-buffer
             htmlize-region
             htmlize-file
             htmlize-many-files
             htmlize-many-files-dired)
  :init
  (setq htmlize-html-charset "utf-8"
        htmlize-output-type 'inline-css))
