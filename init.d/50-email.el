(require 'message)

(setq sendmail-program "msmtp"
      message-sendmail-f-is-evil 't
      message-sendmail-extra-arguments '("--read-envelope-from" "-a" "pasternacki.net")
      message-send-mail-function 'message-send-mail-with-sendmail)

(defun jph/mutt-fakeditor/enter ()
  (when (frame-parameter nil 'jph/mutt-fakeditor)
    (raise-frame)))

(add-hook 'message-mode-hook 'jph/mutt-fakeditor/enter)

(defun jph/mutt-fakeditor/kill-buffer-and-frame ()
  (when (frame-parameter nil 'jph/mutt-fakeditor)
    (let ((file-name buffer-file-name)
          (auto-save-file-name buffer-auto-save-file-name))
      (kill-buffer)
      (when (and auto-save-file-name
                 (file-exists-p auto-save-file-name))
        (delete-file auto-save-file-name))
      (when (and file-name
                 (file-exists-p file-name))
        (delete-file file-name)))
    (delete-frame)))

(defmacro jph/mutt-fakeditor/with-vanilla (alt &rest body)
  ""
  (declare (indent 1))
  `(if (not (frame-parameter nil 'jph/mutt-fakeditor))
       ,alt
     ,@body))

(defun jph/mutt-fakeditor/message-send-and-exit (&optional arg)
  (interactive "P")
  (jph/mutt-fakeditor/with-vanilla (message-send-and-exit arg)
    (let ((buf (current-buffer)))
      (when (message-send arg)
        (with-current-buffer buf
          (jph/mutt-fakeditor/kill-buffer-and-frame))))))

(define-key message-mode-map "\C-c\C-c" 'jph/mutt-fakeditor/message-send-and-exit)

(defun jph/mutt-fakeditor/message-kill-buffer ()
  (interactive)
  (jph/mutt-fakeditor/with-vanilla (message-kill-buffer)
    (jph/mutt-fakeditor/kill-buffer-and-frame)))

(define-key message-mode-map "\C-c\C-k" 'jph/mutt-fakeditor/message-kill-buffer)
(define-key message-mode-map "\C-ck" 'jph/mutt-fakeditor/message-kill-buffer)
