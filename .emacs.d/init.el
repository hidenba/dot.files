(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
 (add-to-list 'load-path default-directory)
 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
     (normal-top-level-add-subdirs-to-load-path)))
(put 'dired-find-alternate-file 'disabled nil)
