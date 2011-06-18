;; optionとcommandの入れ替え
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\M-?" 'help-for-help)
(define-key global-map "\C-z" 'undo)
(define-key global-map "\C-ci" 'indent-region)
(define-key global-map "\C-c\C-i" 'dabbrev-expand)
(define-key global-map "\C-c;" 'comment-region)
(define-key global-map "\C-c:" 'uncomment-region)
(define-key global-map "\C-\\" nil) 
(define-key global-map "\C-c " 'other-frame)

;; 画面分割
(define-key global-map "\C-t" 'follow-delete-other-windows-and-split)

;; recentf 
(define-key global-map "\C-c\C-e" 'recentf-open-files)

;; wdired-mode(編集モードを追加)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
