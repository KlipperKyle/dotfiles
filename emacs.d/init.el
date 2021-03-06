;; -*- mode: emacs-lisp -*-
;; ~/.emacs.d/init.el


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Setup ELPA and MELPA
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-width 80)
 '(auth-sources '("~/.authinfo.gpg"))
 '(column-number-mode t)
 '(completions-format 'vertical)
 '(confirm-kill-emacs 'y-or-n-p)
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "a4e6940f5c63f3c6759d35e6534eaa26ff14512aa61616a0584bda9f858c60b9" default))
 '(echo-keystrokes 0.001)
 '(electric-pair-mode t)
 '(electric-quote-mode t)
 '(eshell-cmpl-cycle-completions nil)
 '(eww-header-line-format "%u | %t")
 '(flyspell-use-meta-tab nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(org-agenda-files '("~/org/todo-personal.org"))
 '(org-export-backends '(ascii beamer html icalendar latex md odt))
 '(package-selected-packages
   '(edit-indirect solarized-theme jq-mode gemini-mode elpher jinja2-mode docker-compose-mode dockerfile-mode restclient web-mode php-mode go-playground atomic-chrome go-mode yaml-mode markdown-mode htmlize))
 '(safe-local-variable-values '((sgml-basic-offset . 2)))
 '(server-mode t)
 '(server-window 'switch-to-buffer-other-tab)
 '(sh-set-shell-hook
   '((lambda nil
       (if
	   (eq sh-shell 'rc)
	   (font-lock-mode 0)
	 (font-lock-mode 1)))))
 '(show-paren-mode t)
 '(split-height-threshold 90)
 '(sql-mysql-options '("--prompt=mysql> "))
 '(tab-bar-mode t)
 '(tab-bar-tab-name-function 'tab-bar-tab-name-current-with-count)
 '(text-mode-hook '(turn-on-flyspell text-mode-hook-identify))
 '(tool-bar-mode nil)
 '(tramp-shell-prompt-pattern
   "\\(?:^\\|
\\)[^]#$%>
]*#?[]#$%>]:? *\\(\\[[0-9;]*[a-zA-Z] *\\)*")
 '(w3m-fill-column 80)
 '(w3m-home-page "~/org/index.html")
 '(w3m-key-binding 'info)
 '(w3m-search-default-engine "duckduckgo")
 '(w3m-uri-replace-alist
   '(("\\`gg:" w3m-search-uri-replace "google")
     ("\\`ya:" w3m-search-uri-replace "yahoo")
     ("\\`bts:" w3m-search-uri-replace "debian-bts")
     ("\\`dpkg:" w3m-search-uri-replace "debian-pkg")
     ("\\`alc:" w3m-search-uri-replace "alc")
     ("\\`urn:ietf:rfc:\\([0-9]+\\)" w3m-pattern-uri-replace "http://www.ietf.org/rfc/rfc\\1.txt")
     ("\\`duckduckgo:" w3m-search-uri-replace "duckduckgo")
     ("\\`ddg:" w3m-search-uri-replace "duckduckgo")))
 '(wdired-allow-to-change-permissions 'advanced)
 '(yaml-mode-hook
   '(yaml-set-imenu-generic-expression turn-off-flyspell turn-off-auto-fill)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monospace" :foundry "unknown" :slant normal :weight normal :height 100 :width normal))))
 '(region ((t (:background "LightGoldenrod2")))))

;; Use xdg-open, even if we are not running a full-fledged desktop
;; environment.  (See net/browse-url.el.gz)
(eval-after-load 'browse-url
  '(defun browse-url-can-use-xdg-open ()
    "Return non-nil if the \"xdg-open\" program can be used.
xdg-open is a desktop utility that calls your preferred web
browser.

This is customized in ‘~/.emacs’."
    (and (getenv "DISPLAY")
	 (executable-find "xdg-open")
	 ;; xdg-open may call gnome-open and that does not wait for its child
	 ;; to finish.  This child may then be killed when the parent dies.
	 ;; Use nohup to work around.  See bug#7166, bug#8917, bug#9779 and
	 ;; http://lists.gnu.org/archive/html/emacs-devel/2009-07/msg00279.html
	 (executable-find "nohup"))))

;; Custom lisp dir
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Custom theme dir
(setq custom-theme-directory "~/.emacs.d/themes")

;; Solarized colors
(setq solarized-distinct-fringe-background t
      solarized-high-contrast-mode-line nil
      solarized-use-variable-pitch nil
      solarized-height-minus-1 1.0	; was 0.8
      solarized-height-plus-1 1.0	; was 1.1
      solarized-height-plus-2 1.0	; was 1.15
      solarized-height-plus-3 1.0	; was 1.2
      solarized-height-plus-4 1.0)	; was 1.3
(load-theme 'solarized-light)

;; Scroll the screen "up" or "down" one line with C-z and M-z
;; From O'Reilly's *Unix Power Tools*, 3rd Ed., Sect. 19.7, pg. 361
(defun scroll-up-one () "Scroll up 1 line." (interactive)
       (scroll-up (prefix-numeric-value current-prefix-arg)))
(defun scroll-down-one () "Scroll down 1 line." (interactive)
       (scroll-down (prefix-numeric-value current-prefix-arg)))
(global-set-key "\C-z" 'scroll-up-one)
(global-set-key "\C-\M-z" 'scroll-down-one)

;; Get rid of "<mouse-?> is undefined" warnings (horizontal scroll in X11)
(global-set-key (kbd "<mouse-6>") (lambda () (interactive) ()))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) ()))

;; Annoyances with KVM switch
(global-set-key (kbd "<Scroll_Lock>") (lambda () (interactive) ()))
(global-set-key (kbd "<scroll>") (lambda () (interactive) ()))

;; Annoyances with Windows
(global-set-key (kbd "<apps>") 'execute-extended-command)
(global-set-key (kbd "<C-lwindow>") (lambda () (interactive) ()))
(global-set-key (kbd "<C-rwindow>") (lambda () (interactive) ()))

;; Global keybindings
(global-set-key (kbd "C-c q") 'quit-window)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-x \\") 'shell)
(global-set-key (kbd "C-x M-\\") 'ansi-term)
(global-set-key (kbd "C-x |") 'eshell)
(global-set-key (kbd "C-x 7") 'rename-buffer)
(global-set-key (kbd "C-x 9") 'quit-window)

;; Whether to delete selection when typing over it.
(delete-selection-mode 0)

(defun infer-indentation-style () (interactive)
  "Infer indentation style from buffer contents.

If our source file uses tabs, we use tabs, if spaces spaces, and
if neither, we use the current indent-tabs-mode.

See https://www.emacswiki.org/emacs/NoTabs"
  (let ((space-count (how-many "^  " (point-min) (point-max)))
	(tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

;; tramp
;; http://wikemacs.org/index.php/TRAMP
;; https://www.gnu.org/software/tramp/#Multi_002dhops
;; Allow ssh+sudo to get remote root
;; (if (locate-library "tramp")
;;     (eval-after-load "tramp"
;;       '(progn
;; 	 (add-to-list 'tramp-default-proxies-alist
;; 		      '(nil "\\`root\\'" "/ssh:%h:"))
;; 	 (add-to-list 'tramp-default-proxies-alist
;; 		      '((regexp-quote (system-name)) nil nil)))))

;; atomic-chrome
(setq atomic-chrome-buffer-open-style 'full)

;; Use cperl-mode instead of perl-mode
;; <https://www.emacswiki.org/emacs/CPerlMode>
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))
(setq cperl-indent-level 8
      cperl-continued-statement-offset 8
      cperl-label-offset -8)

;; ebuild-mode
(setq-default ebuild-mode-update-copyright nil)

;; New eww (web browser) buffer
(defun eww-new (url)
  (interactive
   (let* ((uris (eww-suggested-uris))
	  (prompt (concat "Enter URL or keywords"
			  (if uris (format " (default %s)" (car uris)) "")
			  ": ")))
     (list (read-string prompt nil nil uris))))
  (switch-to-buffer (generate-new-buffer "*eww*"))
  (eww-mode)
  (eww url))

;; go-mode
;; Install from MELPA
;; (require 'mode-local)
;; (setq-mode-local go-mode tab-width 4)

;; mail-mode
;; Make Thunderbird email replies load with the correct mode
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))

;; markdown-mode
;; Install from MELPA
(setq-default markdown-content-type "text/html; charset=utf-8")

;; Org Mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-publish-project-alist
      '(("org"
	 :base-directory "~/org"
	 :publishing-directory "~/org"
	 :publishing-function org-html-publish-to-html)))
(setq org-todo-keywords
      '((sequence "TODO(t!/!)" "INPROG(i!/!)" "|" "DONE(d!/!)")
	(sequence "BLOCKED(b!/!)" "|" "CANCELED(c!/!)")))
;; (setq org-todo-keyword-faces
;;       '(("INPROG" . "orange")
;; 	("BLOCKED" . "purple")
;; 	("CANCELED" . "blue")))
(setq org-log-done 'time)

;; Open Gemini and Gopher links in elpher
(eval-after-load 'org
  '(progn
     (org-link-set-parameters "gemini"
			      :follow #'org-gemini-follow
			      :export #'org-gemini-export)
     (org-link-set-parameters "gopher"
			      :follow #'org-gopher-follow
			      :export #'org-gopher-export)
     (defun org-gemini-follow (path)
       "Follow a gemini:// link in an org-mode doc"
       (require 'elpher)
       (elpher-go (concat "gemini:" path)))
     (defun org-gemini-export (link desc backend)
       "Export a gemini:// link in an org-mode doc"
       (let ((url (concat "gemini:" link))
	     (desc (or desc (concat "gemini:" link))))
	 (pcase backend
	   (`html (format "<a href=\"%s\">%s</a>" url desc))
	   (`latex (format "\\href{%s}{%s}" url desc))
	   (`texinfo (format "@uref{%s,%s}" url desc))
	   (`ascii (format "%s (%s)" url desc))
	   (t url))))
     (defun org-gopher-follow (path)
       "Follow a gopher:// link in an org-mode doc"
       (require 'elpher)
       (elpher-go (concat "gopher:" path)))
     (defun org-gopher-export (link desc backend)
       "Export a gopher:// link in an org-mode doc"
       (let ((url (concat "gopher:" link))
	     (desc (or desc (concat "gopher:" link))))
	 (pcase backend
	   (`html (format "<a href=\"%s\">%s</a>" url desc))
	   (`latex (format "\\href{%s}{%s}" url desc))
	   (`texinfo (format "@uref{%s,%s}" url desc))
	   (`ascii (format "%s (%s)" url desc))
	   (t url))))))

(defun org-todo-at-date (date)
  "Run org-todo as though it had been executed at some prior time
that is interactively selected using org-read-date.

This is particularly useful if you use the org-habits module and
you are late to file the completion of a habit.  If you complete
the habit with org-todo it will be completed for the current day,
and scheduled to repeat at the next repeat interval based on the
current date.  If you use org-todo-at-date and set the
appropriate date, the task will be scheduled to repeat as though
the task had been completed on the specified date.

https://www.emacswiki.org/emacs/OrgMode"
  (interactive (list (org-time-string-to-time (org-read-date))))
  (cl-flet ((org-current-effective-time (&rest r) date)
	    (org-today (&rest r) (time-to-days date)))
    (org-todo)))

;; php-mode
;; [f5] switches between mhtml-mode and php-mode
;; (if (fboundp 'php-mode)
;;     (progn
;;       (add-hook 'php-mode-hook (lambda ()
;; 				 (define-key php-mode-map [f5] 'mhtml-mode)))
;;       (add-hook 'mhtml-mode-hook (lambda ()
;; 				   (define-key mhtml-mode-map [f5]
;; 				     (lambda () (interactive)
;; 				       (flyspell-mode 0)
;; 				       (php-mode)))))))

;; python-mode
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (if indent-tabs-mode
;; 		(setq tab-width 4
;; 		      python-indent-offset 4))))
(add-hook 'python-mode-hook 'infer-indentation-style)

;; web-mode
(setq-default web-mode-markup-indent-offset 2)

;; Local overrides
(if (file-readable-p "~/.emacs.local")
    (load "~/.emacs.local")
  nil)

;; Misc (stuff appends here)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
