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
                "ruby-mode"))
             load-path))
