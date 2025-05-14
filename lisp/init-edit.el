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

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :custom
  (savehist-file (locate-user-emacs-file "custom/savehist")) ;; 设置保存文件的位置
  (savehist-additional-variables '(kill-rings shell-command-history)) ;; 额外保存剪切板和shell命令行历史
  (savehist-ignored-variables '(message-history)) ;; 不保存消息历史
  (history-delete-duplicates t) ;; 自动去重
  (history-length 1000) ;; 保存历史数据条目
  )
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-max-menu-item 10) ;; 最多只记录10条历史记录
  (recentf-save-file (locate-user-emacs-file "custom/.recentf")) ;; 定义保存历史记录的临时文件路径
  )

(use-package embark
  :ensure t
  :after consult
  :bind
  (("C-e" . embark-export)))

(use-package embark-consult
  :ensure t
  :after embark)

(use-package wgrep
  :ensure t
  :custom
  (wgrep-auto-save-buffer t) ;; 自动保存修改
  )

(provide 'init-edit)
