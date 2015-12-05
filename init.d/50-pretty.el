(require 'pretty-symbols)

(setq
 pretty-symbol-categories '(lambda relational logical custom)

 pretty-symbol-patterns
 (delete-dups
  (nconc pretty-symbol-patterns 
         '((?ƒ lambda "\\<function\\>" (js2-mode))
           (?⇒ custom "=>" (ruby-mode))
           (?≃ custom "=~" (ruby-mode perl-mode cperl-mode))
           (?≄ custom "!~" (ruby-mode perl-mode cperl-mode))
           (?λ lambda "\\<lambda\\>" (ruby-mode))
           (?⟨ custom "<%" (fundamental-mode conf-mode))
             (?⟩ custom "%>" (fundamental-mode conf-mode))
           (?⟪ custom "<%=" (fundamental-mode conf-mode))
             (?⦒ custom "-%>" (fundamental-mode conf-mode))
           (?≠ custom "!=" (go-mode))
           (?∅ custom "nil" (go-mode))
           ))))
