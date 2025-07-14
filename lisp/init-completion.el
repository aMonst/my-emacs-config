;; Completion settings -*- lexical-binding: t -*-

(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode))

(use-package consult
  :ensure t)

(use-package ripgrep
  :ensure t
  :after consult
  :bind
  (("C-s" . consult-ripgrep))
  )

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :hook
  (after-init . marginalia-mode))

(use-package cape
  :ensure t
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-ispell)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol)
  (add-to-list 'completion-at-point-functions #'cape-line))

(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :custom
  (corfu-auto t) ; 自动补全
  (corfu-auto-delay 0) ; 立即触发
  (corfu-min-width 1) ; 小窗口也提示
  :init
  (corfu-history-mode) ; 记住补全历史
  (corfu-popupinfo-mode)) ; 显示补全文档


(use-package yasnippet
  :ensure t
  :hook ((after-init . yas-reload-all)
	 ((prog-mode LaTeX-mode org-mode) . yas-minor-mode))
  :config
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"
	  "~/.emacs.d/doom-snippets")))

(use-package doom-snippets
  :ensure nil
  :load-path "~/.emacs.d/doom-snippets"
  :after yasnippet)

(provide 'init-completion)
