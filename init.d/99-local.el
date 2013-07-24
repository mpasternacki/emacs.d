(defun jph/open-in-safari ()
  (interactive)
  (with-current-buffer (htmlize-buffer)
    (save-buffer (buffer-name))
    (call-process-shell-command "open" nil nil nil buffer-file-truename)))

(server-start)
