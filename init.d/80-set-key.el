(global-set-key "\C-cy" '(lambda ()
   (interactive)
   (popup-menu 'yank-menu)))
(define-key paredit-mode-map (kbd "C-j") nil)

(define-key nxml-mode-map (kbd "C-M-f") 'nxml-forward-element)
(define-key nxml-mode-map (kbd "C-M-b") 'nxml-backward-element)

(define-key nxml-mode-map (kbd "M-<up>") '(lambda (arg)
                                            (interactive "p")
                                            (or arg (set arg 1))
                                            (nxml-up-element (- arg))))

(define-key nxml-mode-map (kbd "M-<down>") 'nxml-down-element)

; (define-key message-mode-map "\C-c\C-c" 'server-edit)

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
     (nxml-down-element)))

;; (add-to-list
;;  hs-special-modes-alist
;;  '(nxml-mode
;;    "<!--\\|<[^/>]>\\|<[^/][^>]*[^/]>"
;;    ""
;;    "<!--" ;; won't work on its own; uses syntax table
;;    (lambda (arg)
;;      (let ((nxml-sexp-element-flag))
;;        (setq nxml-sexp-element-flag (not (looking-at "<!--")))
;;        (unless (looking-at outline-regexp)
;;          (condition-case nil
;;              (nxml-forward-balanced-item 1)
;;            (error nil)))))

;;    nil))
