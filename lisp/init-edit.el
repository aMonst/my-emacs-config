(use-package avy
  :ensure t
  :after general ;; 确保 general 插件已经安装
  :config
  (setq avy-timeout-seconds 0.5)
  (my-leader-def
    "f" #'avy-goto-char-timer))

(use-package evil-multiedit
  :ensure t
  :after evil
  :config
  (evil-multiedit-default-keybinds)
  (my-leader-def
    "m m" #'evil-multiedit-match-and-next ; 标记当前符号并跳转下一个
    "m M" #'evil-multiedit-match-and-prev ; 标记当前符号并跳转上一个
    "m a" #'evil-multiedit-match-all ; 标记所有相同符号
    "m r" #'evil-multiedit-restore ; 恢复单光标模式
    "m c" #'evil-multiedit-toggle-or-restrict ; 切换选区/限制编辑区域
    ))

(provide 'init-edit)
