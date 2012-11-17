;;; Add subdirs of ~/.emacs.d/lisp/ to load-path.
(setq load-path
      (nconc (list
              (car (sort (file-expand-wildcards "~/.rvm/src/ruby-*/misc")
                         '(lambda (a b)
                            (string< b a))))
              "~/Projekty/chef-mode"
              )
             (mapcar (lambda (dir)
                       (concat "~/.emacs.d/lisp/" dir))
                     '(""
                       "site-lisp"
                       "color-theme"
                       "gnuplot-mode"
                       "org-mode/lisp"
                       "ess/lisp"
                       "yasnippet"
                       "clojure-mode"
                       "rvm.el"
                       "magit"
                       "coffee-mode"
                       "helm"
		       ))
             load-path))
