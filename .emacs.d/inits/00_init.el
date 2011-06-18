;;info
(require 'info)
(add-to-list 'Info-additional-directory-list "~/.emacs.d/info")

;;auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
(add-to-list 'load-path auto-install-directory)
;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;;自動バイトコンパイル
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
 
(show-paren-mode 1)
(setq backup-inhibited t)
(setq delete-auto-save-files t)
(setq completion-ignore-case t)
(partial-completion-mode 1)
(icomplete-mode 1)

;; タブ設定
(setq-default indent-tabs-mode nil) 
;; 履歴の保存
(savehist-mode 1)
(setq history-length 1000)
;; カーソル位置の記憶
(setq-default save-place t)
(require 'saveplace)
;; GCの設定
(setq gc-cons-threshold (* 50 gc-cons-threshold))
;; ミニバッファの再帰的呼出
(setq enable-recursive-minibuffers t)
;; キーストロークを素早く表示
(setq echo-keystrokes 0.1)
;; yesじゃなくてyで大丈夫にする
(defalias 'yes-or-no-p 'y-or-n-p)

;; バッファ名をユニークニする
;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-foward-angle-brackets)
;; (setq uniquify-ignore-buffers-re "*[^*]+*")

;; デバッグ
;; (setq debug-on-error t)                 

;; 行末空白の自動削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
