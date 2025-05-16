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

(provide 'init-ui)
