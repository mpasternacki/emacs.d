(global-set-key "\C-cy" '(lambda ()
   (interactive)
   (popup-menu 'yank-menu)))
(define-key paredit-mode-map (kbd "C-j") nil)
