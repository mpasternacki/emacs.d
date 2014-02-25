(require 'erc-match)
(require 'erc-track)
(require 'erc-fill)
(require 'erc-services)
(require 'erc-stamp)

(erc-fill-mode t)
(erc-track-mode t)
(erc-match-mode t)
(erc-stamp-mode t)
(erc-services-mode 1)

(erc-update-modules)

(setq erc-auto-query 'bury
      erc-echo-notices-in-minibuffer-flag t
      erc-fill-prefix "    "
      erc-hide-timestamps nil
      erc-insert-timestamp-function 'erc-insert-timestamp-left
      erc-keywords '("japhy" "d.af" "mpasternacki" "wlkO`Rety")
      erc-max-buffer-size 20000
      erc-nick "mpasternacki"
      erc-pals '()
      erc-paranoid t
      erc-server-coding-system '(utf-8 . undecided)
      erc-timestamp-format "%H%M%S "
      erc-timestamp-only-if-changed-flag nil
      erc-user-full-name "Maciek Pasternacki")

(push '("#pogieci" . (iso-8859-2 . undecided))
      erc-encoding-coding-alist)
(push '("#PLD" . (iso-8859-2 . undecided))
      erc-encoding-coding-alist)

(add-hook 'erc-insert-post-hook 'erc-truncate-buffer)

;;;;; http://sigkill.dk/athas/conf/dot.emacs.html
(setq erc-log-insert-log-on-open nil
      erc-log-channels nil
      erc-enable-logging nil
      erc-log-channels-directory "~/Library/IRClog/"
      erc-save-buffer-on-part t
      erc-hide-timestamps nil)

;;; http://www.emacswiki.org/emacs/ErcNickserv
(load "~/.ercpass")
(setq erc-prompt-for-nickserv-password nil
      erc-nickserv-passwords
      `((freenode (("mpasternacki" . ,-freenode-mpasternacki-pass)))))


(autoload 'doctor-doc "doctor")
(autoload 'make-doctor-variables "doctor")

(defvar erc-doctor-id "{Emacs doctor} ")

(defun erc-cmd-DOCTOR (&optional last-sender &rest ignore)
  "Get the last message in the channel and doctor it."
  (let ((limit (- (point) 1000))
        (pos (point))
        doctor-buffer
        last-message
        text)
    ;; Make sure limit is not negative
    (when (< limit 0) (setq limit 0))
    ;; Search backwards for text from someone
    (while (and pos (not (let ((data (get-text-property pos 'erc-parsed)))
                           (and data
                                (string= (aref data 3) "PRIVMSG")
                                (or (not last-sender)
                                    (string= (car (split-string (aref data 2) "!"))
                                             last-sender))))))
      (setq pos (previous-single-property-change
                 pos 'erc-parsed nil limit))
      (when (= pos limit)
        (error "No appropriate previous message to doctor")))
    (when pos
      (setq last-sender (car (split-string
                              (aref (get-text-property
                                     pos 'erc-parsed) 2) "!"))
            doctor-buffer (concat "*ERC Doctor: " last-sender "*")
            last-message (split-string
                          ;; Remove punctuation from end of sentence
                          (replace-regexp-in-string
                           "[ .?!;,/]+$" ""
                           (aref (get-text-property pos
                                                    'erc-parsed) 5)))
            text (mapcar (lambda (s)
                           (intern (downcase s)))
                         ;; Remove salutation if it exists
                         (if (string-match
                              (concat "^" erc-valid-nick-regexp
                                      "[:,]*$\\|[:,]+$")
                              (car last-message))
                             (cdr last-message)
                           last-message))))
    (erc-send-message
     (concat erc-doctor-id
             ;; Only display sender if not in a query buffer
             (if (not (erc-query-buffer-p))
                 (concat last-sender ": "))
             (save-excursion
               (if (get-buffer doctor-buffer)
                   (set-buffer doctor-buffer)
                 (set-buffer (get-buffer-create doctor-buffer))
                 (make-doctor-variables))
               (erase-buffer)
               (doctor-doc text)
               (buffer-string))))))
