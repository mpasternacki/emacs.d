(use-package go-mode
  :mode "\\.go\'"
  :ensure t)

(setq jph/gofmt-before-save t)

(defun jph/hook/gofmt-before-save ()
  (when jph/gofmt-before-save
    (gofmt-before-save)))

(add-hook 'before-save-hook 'jph/hook/gofmt-before-save)

(defun jph/hook/go-mode ()
  (interactive)
  (setq tab-width 2)
  (setq indent-tabs-mode 1))

(add-hook 'go-mode-hook 'jph/hook/go-mode)
