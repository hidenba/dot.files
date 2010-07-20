(add-to-list 'load-path "~/.emacs.d/")

;===================================
; Wheel mouse
;===================================
(global-set-key [mouse-4] 'scroll-down)
(global-set-key [mouse-5] 'scroll-up)

(mouse-wheel-mode)

(global-set-key [mouse-5] '(lambda () (interactive) (scroll-up (/ (window-height) 2))))
(global-set-key [mouse-4] '(lambda () (interactive) (scroll-down (/ (window-height) 2))))

(set-scroll-bar-mode 'right)

;====================================
; Misc
;====================================
(global-font-lock-mode t)
(display-time)
(setq line-number-mode t)
(auto-compression-mode t)
(setq frame-title-format
      (concat "%b - emacs@" system-name))

(setq initial-frame-alist
      (append (list
               '(foreground-color . "white")
               '(background-color . "black")
               '(border-color . "black")
               '(mouse-color . "white")
               '(cursor-color . "white")
               '(width . 170)
               '(height . 60)
               '(top . 0)
               '(left . 0)
               '(alpha . (70 100 100 100))
               )
              initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\M-?" 'help-for-help)
(define-key global-map "\C-z" 'undo)
(define-key global-map "\C-ci" 'indent-region)
(define-key global-map "\C-c\C-i" 'dabbrev-expand)
(define-key global-map "\C-c;" 'comment-region)
(define-key global-map "\C-c:" 'uncomment-region)
(define-key global-map "\C-o" 'toggle-input-method)
(define-key global-map "\C-\\" nil) ;
(define-key global-map "\C-c " 'other-frame)


(show-paren-mode 1)
(tool-bar-mode 0)
(setq backup-inhibited t)
(setq delete-auto-save-files t)
(setq completion-ignore-case t)
(partial-completion-mode 1)
(icomplete-mode 1)

;;hown
(setq load-path (cons "~/.emacs.d/howm-1.3.8" load-path))
(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(mapc
 (lambda (f)
   (autoload f
     "howm" "Hitori Otegaru Wiki Modoki" t))
 '(howm-menu howm-list-all howm-list-recent
             howm-list-grep howm-create
             howm-keyword-to-kill-ring))

;ELScreen
;(load "elscreen" "ElScreen" t)

;;mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet) 
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

;;rspec-mode
(add-to-list 'load-path "~/.emacs.d/rspec-mode")
(require 'rspec-mode)
;specコマンドで起動する
;(custom-set-variables '(rspec-use-rake-flag nil))
;(custom-set-faces )

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;;
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))