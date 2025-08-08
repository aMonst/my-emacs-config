(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-auto-configure t
	lsp-log-io nil
	lsp-completion-provider :capf
	lsp-enablesymbol-highlighting t))

(use-package lsp-ui
  :ensure t
  :after (lsp-mode)
  :hook(lsp-mode . lsp-ui-mode)
  :config
  (lsp-ui-doc-enable t)
  (lsp-ui-peek-enable t)
  (setq lsp-ui-doc-position 'top)
  (define-key lsp-ui-mode-map (kbd "gh") #'lsp-ui-doc-glance))

(use-package flycheck
 :ensure t
 :config
 (setq truncate-lines nil) ; 如果单行信息很长会自动换行
 :hook
 (prog-mode . flycheck-mode))

(use-package tree-sitter
  :ensure t
  :hook (prog-mode . tree-sitter-hl-mode)
  :config
  (global-tree-sitter-mode))
  

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)

(use-package ts-fold
  :load-path "~/.emacs.d/ts-fold"
  :config
  (global-ts-fold-mode 1)
  (with-eval-after-load 'evil
    (evil-define-key 'normal 'global
      "zc" #'ts-fold-close
      "zo" #'ts-fold-open)))

(use-package expand-region
  :ensure t  ; 从ELPA自动安装
  :bind ("C-=" . er/expand-region)
  :config
  (defun my/incremental-expand-region()
    (interactive)
    (if (region-active-p)
	(er/expand-region 1)
      (er/mark-word))
    (setq deactivate-mark nil))
  (defun my/contract-region()
    (interactive)
    (if (region-active-p)
	(er/contract-region 1)
      (call-interactively 'evil-backward-char)))
  (with-eval-after-load 'evil
    (dolist (state '(normal visual motion))
      (evil-define-key state 'global (kbd "RET") nil)
      (evil-define-key state 'global (kbd "<backspace>") nil))
    (evil-define-key 'normal 'global (kbd "RET") #'my/incremental-expand-region)
    (evil-define-key 'normal 'global (kbd "<backspace>") #'my/contract-region)))

(provide 'init-lsp)
