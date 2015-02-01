(package-initialize)
(require 'flycheck)
(require 'flycheck-pyflakes)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
