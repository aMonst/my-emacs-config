(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dirvish
  :ensure t
  :hook (after-init . dirvish-override-dired-mode)
  :bind(:map dired-mode-map
	     ("C-x d" . dirvish)
	     ("y" . dired-do-copy) ;; 拷贝粘贴
	     ("d" . dired-do-delete) ;; 删除
	     ("r" . dired-do-rename) ;; 重命名
	     ("a" . dired-create-empty-file) ;; 创建空文件
	     ("+" . dired-create-directory) ;; 创建文件
	     ("SPC" . nil) ;; 取消空格键的绑定
	     )
  :config
  (with-eval-after-load 'evil
    (evil-define-key 'normal dired-mode-map "r" 'dired-do-rename)) ;; 排除evil模式下默认键的覆盖
  (my-leader-def
    "j" #'dired-goto-file)
  )

(provide 'init-dired)
