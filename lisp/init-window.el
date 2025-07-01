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

;; (use-package awesome-tab
;;   :load-path "~/.emacs.d/awesome-tab"
;;   :after general
;;   :custom
;;   (awesome-tab-show-tab-index 1)
;;   :config
;;   (awesome-tab-mode t)
;;   (my-leader-def
;;     :states '(normal)
;;     "gb" #'awesome-tab-ace-jump
;;     "gT" #'awesome-tab-backward-tab
;;     "gt" #'awesome-tab-forward-tab
;;     "1" #'awesome-tab-select-visible-tab
;;     "2" #'awesome-tab-select-visible-tab
;;     "3" #'awesome-tab-select-visible-tab
;;     "4" #'awesome-tab-select-visible-tab
;;     "5" #'awesome-tab-select-visible-tab
;;     "6" #'awesome-tab-select-visible-tab
;;     "7" #'awesome-tab-select-visible-tab
;;     "8" #'awesome-tab-select-visible-tab
;;     "9" #'awesome-tab-select-visible-tab))

(use-package shackle
  :ensure t
  :hook (after-init . shackle-mode)
  :custom
  (shackle-default-size 0.5)
  (shackle-default-alignment 'below)
  :config
  (setq shackle-rules
	'((term-mode :regexp t
		     :select t
		     :size 0.3
		     :align t
		     :popup t
		     :quit t))))

(use-package popper
  :ensure t
  :hook (after-init . popper-mode)
  :init
  (setq popper-reference-buffers
	'("\\*Messages\\*"
	  "\\*Async Shell Command\\*"
	  term-mode
	  help-mode
	  helpful-mode
	  "^\\*eshell.*\\*$"
	  eshell-mode
	  "^\\*shell.*\\*$"
	  shell-mode
	  ("\\*corfu\\*" . hide)))
  :config
  (my-leader-def
    "/" #'popper-toggle
    "t" #'popper-cycle
    "T" #'popper-toggle-type)
  )
(provide 'init-window)
