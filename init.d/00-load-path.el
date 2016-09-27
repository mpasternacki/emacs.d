;;; Add subdirs of ~/.emacs.d/site-lisp/ to load-path.
(setq load-path
      (nconc (list "~/Src/github.com/mpasternacki/chef-mode")
             (mapcar
              (lambda (dir) (concat "~/.emacs.d/site-lisp/" dir))
              '(""
                "use-package"))
             load-path)

      exec-path
      (split-string (setenv "PATH" (replace-regexp-in-string
                      (rx (* (any " \t\n")) eos) ""
                      (shell-command-to-string "zsh -l -c 'echo $PATH'")))
                    ":"))


(require 'package)
