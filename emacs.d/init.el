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
 '(Man-width 78)
 '(column-number-mode t)
 '(completions-format (quote vertical))
 '(dired-mode-hook
   (quote
    ((lambda nil
       (set
	(make-local-variable
	 (quote mouse-1-click-follows-link))
	nil)
       (defun dired-insert-set-properties
	   (beg end)
	 nil)))))
 '(echo-keystrokes 0.001)
 '(electric-quote-mode t)
 '(eshell-cmpl-cycle-completions nil)
 '(eww-header-line-format "%u | %t")
 '(flyspell-use-meta-tab nil)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(org-agenda-files (quote ("~/org/todo.org")))
 '(org-export-backends (quote (ascii html icalendar man md odt texinfo)))
 ;; '(package-selected-packages
 ;;   (quote
 ;;    (w3m go-playground atomic-chrome go-mode yaml-mode markdown-mode htmlize)))
 '(safe-local-variable-values (quote ((sgml-basic-offset . 2))))
 '(server-port "9999")
 '(server-use-tcp t)
 '(sh-set-shell-hook
   (quote
    ((lambda nil
       (if
	   (eq sh-shell
	       (quote rc))
	   (font-lock-mode 0)
	 (font-lock-mode 1))))))
 '(show-paren-mode t)
 '(split-height-threshold 90)
 '(text-mode-hook
   (quote
    (turn-on-flyspell turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(tramp-shell-prompt-pattern
   "\\(?:^\\|
\\)[^]#$%>
]*#?[]#$%>]:? *\\(\\[[0-9;]*[a-zA-Z] *\\)*")
 '(w3m-fill-column 80)
 '(w3m-home-page "~/org/index.html")
 '(w3m-key-binding (quote info))
 '(w3m-search-default-engine "duckduckgo")
 '(w3m-uri-replace-alist
   (quote
    (("\\`gg:" w3m-search-uri-replace "google")
     ("\\`ya:" w3m-search-uri-replace "yahoo")
     ("\\`bts:" w3m-search-uri-replace "debian-bts")
     ("\\`dpkg:" w3m-search-uri-replace "debian-pkg")
     ("\\`alc:" w3m-search-uri-replace "alc")
     ("\\`urn:ietf:rfc:\\([0-9]+\\)" w3m-pattern-uri-replace "http://www.ietf.org/rfc/rfc\\1.txt")
     ("\\`duckduckgo:" w3m-search-uri-replace "duckduckgo")
     ("\\`ddg:" w3m-search-uri-replace "duckduckgo"))))
 '(wdired-allow-to-change-permissions (quote advanced)))
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

;; quit-window keybinding
(global-set-key (kbd "C-c q") 'quit-window)

;; Show inline completions
(icomplete-mode)

(defun infer-indentation-style () (interactive)
  "Infer indentation style from buffer contents.

If our source file uses tabs, we use tabs, if spaces spaces, and
if neither, we use the current indent-tabs-mode.

See https://www.emacswiki.org/emacs/NoTabs"
  (let ((space-count (how-many "^  " (point-min) (point-max)))
	(tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

;; atomic-chrome
(setq atomic-chrome-buffer-open-style 'full)

;; Use cperl-mode instead of perl-mode
;; <https://www.emacswiki.org/emacs/CPerlMode>
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-label-offset -4)

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
(require 'mode-local)
(setq-mode-local go-mode tab-width 4)

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
      '((sequence "TODO(t)" "INPROG(i!/!)" "|" "DONE(d!/!)")
	(sequence "BLOCKED(b!/!)" "|" "CANCELED(c!/!)")))
(setq org-todo-keyword-faces
      '(("INPROG" . "orange")
	("BLOCKED" . "purple")
	("CANCELED" . "blue")))
(setq org-log-done 'time)

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

;; python-mode
(add-hook 'python-mode-hook 'infer-indentation-style)
(require 'mode-local)
(setq-mode-local python-mode tab-width 4)

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
