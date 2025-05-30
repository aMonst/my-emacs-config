(use-package ace-window
  :ensure t
  :after general
  :hook (dired-mode . (lambda ()
			(setq-local aw-ignore-on t)))
  :config
  (my-leader-def
    :states '(normal visual)
    ";" #'ace-window
    "l" #'evil-window-left
    "h" #'evil-window-right
    "j" #'evil-window-down
    "k" #'evil-window-up
  ))

(use-package awesome-tab
  :load-path "~/.emacs.d/awesome-tab"
  :after general
  :custom
  (awesome-tab-show-tab-index 1)
  :config
  (awesome-tab-mode t)
  (my-leader-def
    :states '(normal)
    "gb" #'awesome-tab-ace-jump
    "gT" #'awesome-tab-backward-tab
    "gt" #'awesome-tab-forward-tab
    "1" #'awesome-tab-select-visible-tab
    "2" #'awesome-tab-select-visible-tab
    "3" #'awesome-tab-select-visible-tab
    "4" #'awesome-tab-select-visible-tab
    "5" #'awesome-tab-select-visible-tab
    "6" #'awesome-tab-select-visible-tab
    "7" #'awesome-tab-select-visible-tab
    "8" #'awesome-tab-select-visible-tab
    "9" #'awesome-tab-select-visible-tab))

(provide 'init-window)
