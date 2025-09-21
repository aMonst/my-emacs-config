(require 'lsp-mode)
(setq compilation-read-command nil)

(defun my/general-compile-command ()
  (concat "bear --output " (projectile-project-root) "compile_commands.json -- make -k"))

(defun my/run-program()
  (interactive)
  (shell-command (concat (projectile-project-root) executable-path)))

(defun my/rebuild-program ()
  (interactive)
  (let ((root (file-name-as-directory (projectile-project-root))))
    (shell-command (concat "make clean -C " root))
    (setq compile-command (concat "bear --output " root "compile_commands.json" " -- make -k -C " root))
    (compile compile-command)))

(defun my/cmake-general-compile-command ()
  (concat "cmake -B " (projectile-project-root) "build -DCMAKE_BUILD_TYPE=Debug " (projectile-project-root)
          " && ln -sf " (projectile-project-root) "build/compile_commands.json " (projectile-project-root) "compile_commands.json"
          " && cmake --build " (projectile-project-root) "build --config Debug"))

(defun my/cmake-rebuild-program ()
  (interactive)
  (let ((root (file-name-as-directory (projectile-project-root))))
    (shell-command (concat "rm -rf " root "build"))
    (setq compile-command (my/cmake-general-compile-command))
    (compile compile-command)))

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
                           (lsp-deferred)
                           (setq projectile-project-compilation-cmd (my/cmake-general-compile-command))
                           (evil-define-key 'normal c++-mode-map (kbd "<f7>") #'projectile-compile-project)
                           (evil-define-key 'normal c++-mode-map (kbd "C-<f7>") #'my/cmake-rebuild-program)
                           (evil-define-key 'normal c++-mode-map (kbd "C-<f5>") #'my/run-program)))
(provide 'cpp)
