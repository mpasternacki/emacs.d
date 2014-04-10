(load "go-mode/go-mode")

(defun jph/hook/go-mode ()
  (interactive)
  (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 2)
            (setq indent-tabs-mode 1))

(add-hook 'go-mode-hook 'jph/hook/go-mode)
