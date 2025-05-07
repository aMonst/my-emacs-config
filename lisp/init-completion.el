;; Completion settings -*- lexical-binding: t -*-

(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode))

(use-package consult
  :ensure t
  :bind
  (("C-s" . consult-line)))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :hook
  (after-init . marginalia-mode))

(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :custom
  (corfu-auto t) ; 自动补全
  (corfu-auto-deply 0) ; 立即触发
  (corfu-min-width 1) ; 小窗口也提示
  :init
  (corfu-history-mode) ; 记住补全历史
  (corfu-popupinfo-mode)) ; 显示补全文档

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-ispell)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-symbol)
  (add-to-list 'completion-at-point-functions #'cape-line))

(provide 'init-completion)
