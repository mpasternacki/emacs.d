(require 'gnus)

(setq gnus-select-method '(nnnil "")
      gnus-secondary-select-methods '((nnmaildir "mailbox.org" (directory "~/Mail"))))

(require 'message)

(setq sendmail-program "msmtp"
      message-sendmail-f-is-evil 't
      message-sendmail-extra-arguments '("--read-envelope-from" "-a" "pasternacki.net")
      message-send-mail-function 'message-send-mail-with-sendmail)

(require 'bbdb)
(bbdb-initialize)
