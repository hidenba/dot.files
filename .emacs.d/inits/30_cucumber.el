(add-to-list 'load-path "~/.emacs.d/elisp/cucumber")
(setq feature-default-i18n-file "~/.emacs.d/elisp/cucumber/i18n.yml")
(require 'feature-mode)
(autoload 'feature-mode "feature-mode" "Mode for editing cucumber files" t)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
