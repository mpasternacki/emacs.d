(require 'yasnippet)

(setq yas/snippet-dirs '("~/.emacs.d/lisp/yasnippet/snippets"
			 "~/.emacs.d/snippets"
			 "~/.emacs.d/extras/imported"
			 "~/.emacs.c/lisp/cucumber.el/snippets"))

(yas/global-mode 1)

;; (yas/set-mode-parent 'fortran-mode 'f90-mode)
;; (yas/set-mode-parent 'nxhtml-mode 'nxml-mode)
;; (yas/set-mode-parent 'javascript-mode 'cc-mode)
