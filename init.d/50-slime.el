; (setq inferior-lisp-program "/opt/sbcl/bin/sbcl --noinform --no-linedit")
;; (require 'clojure-mode)
;; (require 'swank-clojure)
;; (swank-clojure-config
;;  (setq swank-clojure-jar-path "/Users/japhy/Downloads/clojure/clojure.jar"
;;        ;; swank-clojure-extra-classpaths (list ...)
;;        ))
(require 'slime)
(require 'paredit)      ; http://mumble.net/~campbell/emacs/paredit.el
;; (require 'clojure-paredit)
(setq ;; inferior-lisp-program "/home/japhy/Ecls/ecl"
      ;; common-lisp-hyperspec-root "file:///home/japhy/Desktop/READ/Machine/Lisp/HyperSpec/"
      slime-net-coding-system 'utf-8-unix
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-display-edit-hilights nil
      slime-lisp-implementations '((ccl ("ccl64"))
                                   (sbcl ("sbcl"))
                                   (clisp ("clisp"))
                                   (ecl ("ecl") :coding-system iso-8859-1-unix)))
(slime-setup '(slime-fancy slime-asdf slime-fancy-inspector slime-xref-browser))

(global-set-key "\C-cs" 'slime-selector)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(define-key paredit-mode-map (kbd "C-j") nil)

;;Add to the slime-filename-translations one that will use tramp to connect to
;; a remote host as given by ip here (if remote-host is absent it will use
;; the value of machine-instance).
;; (push (list "^evo\\.sentivision\\.com$"
;; 	    (lambda (emacs-filename)
;; 	      (substring emacs-filename (length "/ssh:japhy@evo.sentivision.com:")))
;; 	    (lambda (lisp-filename)
;; 	      (concat "/ssh:japhy@evo.sentivision.com:" lisp-filename)))
;;       slime-filename-translations)

;; (push (list ".*" 'identity 'identity)
;;       slime-filename-translations)
