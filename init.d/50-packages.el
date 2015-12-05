(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
; (require 'flycheck)
; (require 'flycheck-pyflakes)
; (add-hook 'python-mode-hook 'flycheck-mode)
; (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

; (require 'go-eldoc)
; (add-hook 'go-mode-hook 'go-eldoc-setup)

(require 'lua-mode)
(require 'ace-jump-mode)
(require 'multiple-cursors)
(require 'fiplr)
(require 'epresent)
(require 'terraform-mode)
