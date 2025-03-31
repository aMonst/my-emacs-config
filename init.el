(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'basic)
(require 'package-conf)
(require 'init-ui)
(require 'init-evil)

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'no-error 'no-message)
