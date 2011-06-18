(add-to-list 'load-path "~/.emacs.d/elisp/skk")
(require 'skk-setup)
;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;;漢字登録時、送り仮名が厳密に正しいかをチェック
(setq skk-check-okurigana-on-touroku t)
;; SKK-Server
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)