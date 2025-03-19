;; 禁止菜单栏、工具栏、滚动条模式，禁止启动屏幕和文件对话框
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t) ;; 禁止启动画面

;; 显示行号
(setq display-line-numbers-type 'relative) ;;显示相对行号
(global-display-line-numbers-mode 1)

(provide 'basic)
