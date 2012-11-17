(require 'helm-config)

(defun jph/helm ()
  "Preconfigured `helm' lightweight version \(buffer -> recentf\)."
  (interactive)
  (helm :sources '(helm-c-source-files-in-current-dir
                   helm-c-source-buffers-list
                   helm-c-source-recentf
                   helm-c-source-buffer-not-found)))

(global-set-key (quote [C-tab]) 'jph/helm)
;; (global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(helm-mode 1)

(defadvice helm-ff-directory-files 
  (after jph/helm-ff-directory-files/filter-unless-prefixed)
  "Filter out boring files unless prefix was given"
  (unless current-prefix-arg
    (setq ad-return-value (helm-c-skip-boring-files ad-return-value))))
(ad-activate 'helm-ff-directory-files)

(add-to-list 'helm-c-boring-file-regexp-list "^/\.vol$")
