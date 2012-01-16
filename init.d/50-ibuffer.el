(require 'ibuffer)
(setq ibuffer-saved-filter-groups
  (quote (("default"
            ("SetJam.setjam"
             (filename . "Projekty/SetJam/setjam/"))
            ("SetJam.administration"
             (filename . "Projekty/SetJam/administration/"))
            ("SetJam"
             (filename . "Projekty/SetJam/"))
            ("Gnowsis.gnowsisweb"
             (filename . "/Volumes/Gnowsis/gnowsisweb/"))
            ("Gnowsis.chef"
             (filename . "/Volumes/Gnowsis/chef-repo/"))
            ("Gnowsis"
             (filename . "/Volumes/Gnowsis/"))
            ("Ginzametrics.gnowsisweb"
             (filename . "/Volumes/Ginzametrics/gnowsisweb/"))
            ("Ginzametrics.chef"
             (filename . "/Volumes/Ginzametrics/chef-repo/"))
            ("Ginzametrics"
             (filename . "/Volumes/Ginzametrics/"))
            ("Writings"
             (filename . "Documents/Writings"))))))
(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ("Org" ;; all org-related buffers
;;   (mode . org-mode))
;; ("Mail"
;;   (or  ;; mail-related buffers
;;    (mode . message-mode)
;;    (mode . mail-mode)
;;    ;; etc.; all your mail related modes
;;    ))
;; ("Programming" ;; prog stuff not already in MyProjectX
;;   (or
;;     (mode . c-mode)
;;     (mode . perl-mode)
;;     (mode . python-mode)
;;     (mode . emacs-lisp-mode)
;;     ;; etc
;;     ))
;; ("ERC"   (mode . erc-mode))
