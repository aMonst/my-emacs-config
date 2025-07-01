(use-package eshell
  :ensure nil
  :config
  (defun eshell/j (&rest args)
    (let* ((argstr (mapconcat 'identity args " "))
	   (target (shell-command-to-string 
		    (concat "autojump " argstr))))
      (setq target (replace-regexp-in-string "\n" "" target))
      (if (file-directory-p target)
	  (eshell/cd target)
	(error "目录不存在: %s" target)))))

(use-package em-history
  :ensure nil
  :defer t
  :custom
  (eshell-history-size 1024)
  (eshell-his-ignoredups t)
  (eshell-save-history-on-exit t))

(use-package esh-mode
  :ensure nil
  :hook (eshell-mode . (lambda ()
			 (local-set-key (kbd "C-r") #'consult-history)))
  :bind (:map eshell-mode-map
	      ("C-r" . consult-history))
  :config
  (with-eval-after-load 'evil
			(evil-define-key '(normal insert) eshell-mode-map (kbd "C-r") #'consult-history)))

(use-package em-term
  :ensure nil
  :defer t
  :custom
  (eshell-visual-commands '("top" "htop" "less" "more" "lazygit"))
  (eshell-visual-subcommands '("git" "help" "lg"))
  (eshell-visual-options '("git" "--help" "--paginate"))
  (eshell-destroy-buffer-when-process-dies t))

(use-package eshell-git-prompt
  :ensure t
  :after esh-mode
  :config
  (eshell-git-prompt-use-theme 'powerline))

(use-package eshell-syntax-highlighting
  :ensure t ;; Install if not already installed.
  :after esh-mode
  :hook (eshell-mode . eshell-syntax-highlighting-global-mode)
  )

(use-package capf-autosuggest
  :ensure t
  :hook ((eshell-mode comint-mod) . capf-autosuggest-mode)
  )

(provide 'init-eshell)
