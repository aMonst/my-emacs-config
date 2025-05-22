;; 禁止菜单栏、工具栏、滚动条模式，禁止启动屏幕和文件对话框
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t) ;; 禁止启动画面

;; 显示行号
(setq display-line-numbers-type 'relative) ;;显示相对行号
(global-display-line-numbers-mode 1)

(setq make-backup-files nil)                                  ; 不自动备份
(setq auto-save-default nil)                                  ; 不使用Emacs自带的自动保存

(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs #'y-or-n-p)   ; 在关闭 Emacs 前询问是否确认关闭，防止误触
(electric-pair-mode t)            ; 自动补全括号
(column-number-mode t)            ; 在 Mode line 上显示列号
(global-auto-revert-mode t)         ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)          ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）

(add-hook 'prog-mode-hook #'hs-minor-mode)  ; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号

(setq custom-file (expand-file-name "~/.emacs.d/custom/custom.el"))
(load custom-file 'no-error 'no-message)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(provide 'init-basic)
