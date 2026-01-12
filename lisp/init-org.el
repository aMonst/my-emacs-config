(use-package org
  :ensure nil
  :mode ("\\.org\\'" . org-mode)
  :hook ((org-mode . visual-line-mode)
	 (org-mode . my/org-prettify-symbols))
  :commands (org-find-exact-headline-in-buffer org-set-tags)
  :custom-face
  ;; 设置org mode标题以及美级标题行的大小
  (org-document-title ((t (:height 1.75 :weight bold))))
  (org-level-1 ((t (:height 1.4 :weight bold))))
  (org-level-2 ((t (:height 1.35 :weight bold))))
  (org-level-3 ((t (:height 1.3 :weight bold))))
  (org-level-4 ((t (:height 1.25 :weight bold))))
  (org-level-5 ((t (:height 1.2 :weight bold))))
  (org-level-6 ((t (:height 1.15 :weight bold))))
  (org-level-7 ((t (:height 1.1 :weight bold))))
  (org-level-8 ((t (:height 1.05 :weight bold))))
  (org-level-9 ((t (:height 1.0 :weight bold))))

  ;; 设置代码块用上下边线包裹
  (org-block-begin-line ((t (:underline t :background unspecified))))
  (org-block-end-line ((t (:overline t :underline nil :background unspecified))))
  :config
  ;; 设置org mode中某些标签的显示字符
  (defun my/org-prettify-symbols()
    (setq-local prettify-symbols-alist
	  '(("[ ]" . 9744) ;; ☐
	    ("[x]" . 9745) ;; ☑
	    ("[-]" . 8863) ;; ⊟
	    ("#+begin_src" . 9998) ;; ✎
	    ("#+end_src" . 9633) ;; □
	    ("#+results:" . 9776) ;; ☰
	    ("#+attr_latex:" . "🄛")
	    ("#+attr_html:" . "🄗")
	    ("#+attr_org:" . "🄞")
	    ("#+name:" . "🄝")
	    ("#+caption:" . "🄒")
	    ("#+date:" . 128197) ;; 📅
	    ("#+author:" . 128100) ;; 💁
	    ("#+setupfile:" . 128221) ;;📝
	    ("#+email:" . 128231) ;;📧
	    ("#+startup" . 10034) ;; ✲
	    ("#+options:" . 9965) ;; ⛭
	    ("#+title:" . 10162) ;; ➲
	    ("#+subtitle:" . 11146) ;; ⮊
	    ("#+downloaded" . 8650) ;; ⇊
	    ("#+language:" . 128441) ;;🖹
	    ("#+begin_quote" . 187) ;; »
	    ("#+end_quote" . 171) ;; «
	    ("#+begin_results" . 8943) ;; ⋯
	    ("#+end_results" . 8943) ;; ⋯
	    ))
    (setq prettify-symbols-unprettify-at-point t)
    (prettify-symbols-mode 1))
  :custom
  (org-fontify-whole-heading-line t)
  (org-ellipsis " ▾")
  )

(use-package org-contrib
  :ensure t)

(use-package org-modern
  :ensure t
  :hook (after-init . (lambda ()
  			(setq org-modern-hide-stars 'leading)
  			(global-org-modern-mode t)))
  :config
  ;; 定义各级标题行字符
  (setq org-modern-star ["◉" "○" "✸" "✳" "◈" "◇" "✿" "❀" "✜"])
  (setq-default line-spacing 0.1)
  (setq org-modern-label-border 1)
  (setq org-modern-table-vectical 2)
  (setq org-modern-table-horizontal 0)

  ;; 列表符号美化
  (setq org-modern-list
  	'((?- . "•")
  	  (?+ . "◦")
  	  (?* . "▹")))
  ;; 代码块左边加上一条竖边线
  (setq org-modern-block-fringe t)

  ; 属性标签使用上述定义的符号，不由 org-modern 定义
  (setq org-modern-block-name nil)
  (setq org-modern-keyword nil)
  )

(use-package org-capture
  :ensure nil
  :custom
  (org-capture-templates nil)
  (org-capture-templates '(
			   ("r" "Reading List" entry
			    (file+olp "~/org/reading.org" "Reading" "Book")
			    "*** TODO 《%^{书名}》\n作者:%^{作者}\n出版社:%^{出版社}:\n备注:%^{备注}\n添加时间:%U\n"
			    :clock-int t
			    :clock-resume t)))
  :config
  (add-to-list 'org-capture-templates
	       `("b" "Blog" plain (file ,(concat "~/org/" (format-time-string "%Y-%m-%d.md")))
		 ,(concat "---\n"
			  "tile: %^{标题}\n"
			  "date: %U\n"
			  "categories: %^{分类}\n"
			  "tags: %^{标签}\n"
			  "draft: %^{草稿|true|false}\n"
			  "---\n"
			  "%?")))
  (add-to-list 'org-capture-templates
	       `("w" "Work Task" entry
		 (file+headline "~/org/working.org" "Work")
		 "* TODO %^{任务描述}  :%^{任务类型|dev|bugfix|env|doc|meeting}:\n  SCHEDULED: %^t\n  PRIORITY: %^{优先级|A|B|C|D}\n  %?\n  %i")))

(use-package org-agenda
  :ensure nil
  :custom
  (org-agenda-files (list "~/org/reading.org"
			   "~/org/blog.org"
			   "~/org/working.org"))
  (org-highest-priority ?A)
  (org-lowest-priority ?D)
  (org-default-priority ?D)

  (org-tag-alist `((:startgroup)
		   ("dev" . ?d)
		   ("bugfix" . ?B)
		   ("env" . ?E)
		   ("doc" . ?D)
		   ("reading" . ?R)
		   ("meeting" . ?M)
		   (:endgroup)
		   ("Sendto Tom" . ?T)
		   ("Sendto Jerry" . ?J)
		   ))
  (org-todo-keywords '(
		       (sequence "TODO(t)" "DOING(i)" "WAIT(w@/!)" "|" "DONE(d!)" "ABORT(a@)")
		       )))

(use-package org-pomodoro
  :ensure t
  :custom
  (org-prmodoro-length 25) ;每个番茄钟25分钟
  (org-pomodoro-short-break-length 5) ;; 短休5分钟
  (org-pomodoro-long-break-length) ;; 长休15分钟 (每4个番茄钟之后)
  (org-pomodoro-play-sounds-t) ;; 启用提示音
  )
(provide 'init-org)
