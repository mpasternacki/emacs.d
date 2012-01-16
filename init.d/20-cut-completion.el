(add-hook 'completion-setup-hook
          (lambda ()
            (set-buffer standard-output)
            (goto-char 1)
            (delete-region 1 (search-forward "Possible completions are:\n")) ))
