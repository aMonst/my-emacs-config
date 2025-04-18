(use-package avy
  :ensure t
  :after general ;; 确保 general 插件已经安装
  :config
  (setq avy-timeout-seconds 0.5)
  (my-leader-def
    "f" #'avy-goto-char-timer))

(use-package multiple-cursors
  :ensure t
  :after general
  :config
  (my-leader-def
    ;;以 leader m 为前缀
    "m n" #'mc/mark-next-like-this ;; 标记下一个相同内容
    "m p" #'mc/mark-previous-like-this ;; 标记上一个相同内容
    "m a" #'mc/mark-all-like-this ;; 标记所有相同内容
    "m d" #'mc/skip-to-next-like-this ;; 跳过当前并标记下一个相同内容
    "m s" #'mc/mark-all-in-region ;; 在选区中使用多光标
    "m r" #'mc/reverse-region;; 反向选取光标
    "m e" #'mc/edit-lines ;; 进入多行编辑模式
    ))
