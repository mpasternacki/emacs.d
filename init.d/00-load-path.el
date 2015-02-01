;;; Add subdirs of ~/.emacs.d/site-lisp/ to load-path.
(setq load-path
      (nconc (list "~/Projekty/chef-mode")
             (mapcar
              (lambda (dir) (concat "~/.emacs.d/site-lisp/" dir))
              '(""
                "color-theme"
                "gnuplot-mode"
                "org-mode/lisp"
                "org-mode/contrib/lisp"
                "ess/lisp"
                "yasnippet"
                "clojure-mode"
                "rvm.el"
                "magit"
                "coffee-mode"
                "helm"
                "ruby-mode"
                "git-modes"
                "ledger"
                "notmuch"))
             load-path)

      exec-path
      (split-string (setenv "PATH" (replace-regexp-in-string
                      (rx (* (any " \t\n")) eos) ""
                      (shell-command-to-string "zsh -l -c 'echo $PATH'")))
                    ":"))


(require 'package)
