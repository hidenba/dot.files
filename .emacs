(setq load-path (append '("/usr/share/emacs/site-lisp"
                          "~/.emacs.d")
                        load-path))

(setq inhibit-startup-message t)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info
"Japanese"
'coding-priority (cons 'utf-8
(get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")

(add-hook 'shell-mode-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8 'utf-8))))


;;フォント
(set-default-font "Bitstream Vera Sans Mono")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("IPA モナー UIゴシック" . "unicode-bmp"))


;AtokX3 IIIMCF
(setq load-path (cons "~/.emacs.d/iiimcf" load-path))
(setq iiimcf-server-control-hostlist (list (concat "/tmp/.iiim-" (user-login-name) "/:0.0")))
(setq iiimcf-server-control-default-language "ja")
(setq iiimcf-server-control-default-input-method "atokx3")
(require 'iiimcf-sc)
(setq default-input-method 'iiim-server-control)


;;
;(load-library "anthy")
;(set-input-method "japanese-anthy")
;(setq default-input-method "japanese-anthy")

;;
;===================================
; Wheel mouse
;===================================
(global-set-key [mouse-4] 'scroll-down)
(global-set-key [mouse-5] 'scroll-up)

(mouse-wheel-mode)

(global-set-key [mouse-5] '(lambda () (interactive) (scroll-up (/ (window-height) 2))))
(global-set-key [mouse-4] '(lambda () (interactive) (scroll-down (/ (window-height) 2))))

(set-scroll-bar-mode 'right)





;;
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



;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;;; 強力な補完機能を使う
;;; p-bでprint-bufferとか
;;(load "complete")
(partial-completion-mode 1)

;;; 補完可能なものを
;;; 少しうるさい
(icomplete-mode 1)



;;hown
(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(mapc
 (lambda (f)
   (autoload f
     "howm" "Hitori Otegaru Wiki Modoki" t))
 '(howm-menu howm-list-all howm-list-recent
             howm-list-grep howm-create
             howm-keyword-to-kill-ring))

;;; Rails
(setq load-path (cons "~/.emacs.d/" load-path))

    (autoload 'ruby-mode "ruby1.8-elisp/ruby-mode"
      "Mode for editing ruby source files" t)
    (setq auto-mode-alist
          (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
    (setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))

    (autoload 'run-ruby "ruby1.8-elisp/inf-ruby"
      "Run an inferior Ruby process")
    (autoload 'inf-ruby-keys "inf-ruby"
      "Set local key defs for inf-ruby in ruby-mode")
    (add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
    ))
(setq max-lisp-eval-depth 1000)
(setq max-specpdl-size 3000)
(setq load-path (cons "~/.emacs.d/emacs-rails" load-path))
(require 'rails)
(define-key rails-minor-mode-map "\C-c\C-p" 'rails-lib:run-primary-switch)
(define-key rails-minor-mode-map "\C-c\C-n" 'rails-lib:run-secondary-switch)
(setq auto-mode-alist  (cons '("\\.rhtml$" . html-mode) auto-mode-alist))
(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))
(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))
(setq rails-use-mongrel t)

(require 'autotest)

;ELScreen
(load "elscreen" "ElScreen" t)

;Shift+カーソルで分割したウィンドウを移動
(windmove-default-keybindings)

;;;
;;; Twittering mode
;;;
(require 'twittering-mode)
(setq twittering-username "hide.nba@gmail.com")
(setq twittering-password "kabukiman")
(twittering-scroll-mode t)

(require 'auto-complete)
(global-auto-complete-mode t)
