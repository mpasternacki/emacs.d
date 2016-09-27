(defun jph/completion-setup-hook ()
  (set-buffer standard-output)
  (goto-char 1)
  (delete-region 1 (search-forward "Possible completions are:\n")))

(defun jph/go-mode-hook ()
  (setq tab-width 2))

(defun jph/nxml/m-up (arg)
  (interactive "p")
  (or arg (set arg 1))
  (nxml-up-element (- arg)))

(defun jph/nxml/m-right (arg)
  (interactive "p")
  (nxml-up-element -1)
  (nxml-forward-element arg)
  (nxml-down-element))

(defun jph/nxml/m-left (arg)
  (interactive "p")
  (nxml-up-element -1)
  (nxml-backward-element arg)
  (nxml-down-element))

(defun jph/org-todo-fn (status)
  (lambda ()
    (interactive)
    (org-todo status)))

(defun jph/c/k-r-style ()
  (c-set-style "k&r"))

(defun jph/add-to-list* (list-name &rest elements)
  (dolist (elt elements)
    (add-to-list list-name elt)))
