(setq exec-path
      (split-string (setenv "PATH" (replace-regexp-in-string
                      (rx (* (any " \t\n")) eos) ""
                      (shell-command-to-string "zsh -l -c 'echo $PATH'")))
                    ":"))

(require 'package)

(jph/add-to-list* 'package-archives
                  '("marmalade" . "http://marmalade-repo.org/packages/")
                  '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
