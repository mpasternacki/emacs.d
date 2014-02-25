(setq cedet-root-path
      (file-name-as-directory (expand-file-name
                               "~/.emacs.d/site-lisp/cedet/")))
;(add-to-list 'Info-directory-list
;             "~/.emacs.d/site-lisp/cedet/doc/info")

;;; https://gist.github.com/alexott/3930120
(load-file (concat cedet-root-path "cedet-devel-load.el"))
(add-to-list 'load-path (concat cedet-root-path "contrib"))

;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
 
;; Activate semantic
(semantic-mode 1)
 
;; load contrib library
(require 'eassist)
 
(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)
 
(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))
 
;; SRecode
(global-srecode-minor-mode 1)
 
;; EDE
(global-ede-mode 1)
(ede-enable-generic-projects)

;;; end alexott cedet config
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/ecb/"))
(require 'ecb)

