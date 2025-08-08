;; -*- lexical-binding: t -*-

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-dracula t))

(set-face-attribute 'default nil
		    :family "Source Code Pro"
		    :height 120)

(use-package rime
  :ensure t
  :custom
  (default-input-method "rime")
  (rime-posframe-properties
      (list :background-color "#333333"
            :foreground-color "#dcdccc"
            :font "WenQuanYi Micro Hei Mono-14"
            :internal-border-width 10))
  (rime-user-data-dir "~/.config/rime")
  (rime-show-candidate 'posframe))

(use-package helpful
  :ensure t
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h s" . helpful-symbol)
   ))

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 0.7))

(use-package all-the-icons
  :ensure t
  :when (display-graphic-p)
  :commands all-the-icons-install-fonts)

(use-package all-the-icons-completion
  :ensure t
  :hook ((after-init . all-the-icons-completion-mode)
	 (marginalia-mode . all-the-icons-completion-mode)))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 30)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-icon t)
  (setq doom-modeline-lsp t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
  (setq doom-modeline-check-simple-format t)
  )

(provide 'init-ui)
