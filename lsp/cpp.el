(require 'lsp-mode)

(add-hook 'c++-mode-hook (lambda ()
		      (setq lsp-project-identification-methods
			    '(:root ("compile_commands.json" ".git" ".clangd" "CMakeLists.txt" "Makefile")))
		      (setq lsp-clients-clangd-args
			    '("-background-index"
			      "--clang-tidy"
			      "--completion-style=detailed"))
		      (setq-local completion-at-point-functions
				  '(
				    cape-file
				    cape-keyword
				    cape-dabbrev))
		      (lsp-deferred)))
(provide 'cpp)
