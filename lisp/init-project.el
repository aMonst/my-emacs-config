(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/projects/" "~/work/" "~/playground"))
  :config
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package counsel-projectile
  :ensure t
  :after(projectile)
  :init (counsel-projectile-mode))

(provide 'init-project)
