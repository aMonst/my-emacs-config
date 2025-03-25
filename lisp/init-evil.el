(use-package evil
  :ensure t
  :init
  (evil-mode)
  :custom
  (evil-want-C-u-scroll t))

(use-package general
  :ensure t
  :config
  (general-evil-setup t))

(general-create-definer my-leader-def
  :states '(normal insert visual emacs)
  :prefix "SPC"
  :non-normal-prefix "C-,")

(defun open-my-emacs-config()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun source-my-emacs-config()
  (interactive)
  (eval-buffer (get-buffer "~/.emacs.d/init.el")))

(my-leader-def
  "ss" 'open-my-emacs-config)

(my-leader-def
  "ee" 'source-my-emacs-config)

(provide 'init-evil)
