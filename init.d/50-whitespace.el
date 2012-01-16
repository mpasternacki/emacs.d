;;; http://ruslanspivak.com/2010/09/27/keep-track-of-whitespaces-and-column-80-overflow/

(require 'whitespace)

;; nuke trailing whitespaces when writing to a file
(remove-hook 'write-file-hooks 'delete-trailing-whitespace)

;; display only tails of lines longer than 80 columns, tabs and
;; trailing whitespaces
(setq whitespace-line-column 80
      whitespace-style '(tabs trailing lines-tail))

;; face for long lines' tails
(set-face-attribute 'whitespace-line nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)

;; face for Tabs
(set-face-attribute 'whitespace-tab nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)

;; activate minor whitespace mode when in python mode
(add-hook 'python-mode-hook 'whitespace-mode)
