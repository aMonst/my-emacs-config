(use-package dap-mode
  :ensure t
  :after (lsp-mode)
  :config
  (dap-auto-configure-mode) ; 可选：启用自动配置
  (require 'dap-cpptools)
  (setq dap-cpptools-debug-program '("~/.emacs.d/cpptools/extension/debugAdapters/bin/OpenDebugAD7"))
  (evil-define-key 'normal dap-mode-map (kbd "<f10>") #'dap-next)
  (evil-define-key 'normal dap-mode-map (kbd "<f9>") #'dap-breakpoint-toggle)
  (evil-define-key 'normal dap-mode-map (kbd "<f5>") #'dap-debug)
  )

(provide 'init-dap)
