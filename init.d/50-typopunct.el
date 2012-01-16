(require 'typopunct)
(add-to-list 'typopunct-language-alist
             `(polish ,(decode-char 'ucs #x201E) ; opening-double-q (outer)
                      ,(decode-char 'ucs #x201D) ; closing-double-q (outer)
                      ?' ?'))           ; we don't change single quotes
(setq-default typopunct-buffer-language 'polish)

(defconst jph-typopunct-ellipsis 
  (decode-char 'ucs #x2026))
(defun jph-typopunct-insert-typographical-ellipsis ()
  "Change three consecutive dots to typographical ellipsis mark"
  (interactive)
  (cond ((and (eq (char-before) ?.)
              (eq (char-before (1- (point))) ?.))
         (delete-char -2)
         (insert jph-typopunct-ellipsis))
        (t (insert ?.))))
(define-key typopunct-map [?.] 'jph-typopunct-insert-typographical-ellipsis)
; (add-hook 'text-mode-hook 'typopunct-mode)
