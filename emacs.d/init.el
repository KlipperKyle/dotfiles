;; -*- mode: emacs-lisp -*-
;; ~/.emacs.d/init.el

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Setup ELPA and MELPA
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-width 80)
 '(auth-sources '("~/.authinfo.gpg"))
 '(auto-hscroll-mode 'current-line)
 '(column-number-mode t)
 '(completions-format 'vertical)
 '(confirm-kill-emacs 'y-or-n-p)
 '(echo-keystrokes 0.001)
 '(electric-quote-mode t)
 '(flyspell-use-meta-tab nil)
 '(frame-resize-pixelwise t)
 '(indicate-buffer-boundaries t)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(org-export-backends '(ascii beamer html icalendar latex md odt))
 '(safe-local-variable-values
   '((nxml-child-indent . 4)
     (c-indent-level . 4)
     (sgml-basic-offset . 2)))
 '(save-place-mode t)
 '(scroll-bar-mode 'left)
 '(sh-set-shell-hook
   '((lambda nil
       (if
	   (eq sh-shell 'rc)
	   (font-lock-mode 0)
	 (font-lock-mode 1)))))
 '(show-paren-mode t)
 '(shr-width 80)
 '(split-height-threshold 90)
 '(sql-mysql-options '("--prompt=mysql> "))
 '(tab-bar-new-tab-to 'rightmost)
 '(tab-bar-tab-hints t)
 '(tab-bar-tab-name-function 'tab-bar-tab-name-current-with-count)
 '(text-mode-hook '(turn-on-flyspell text-mode-hook-identify))
 '(tool-bar-mode nil)
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
 '(window-resize-pixelwise t)
 '(yaml-mode-hook
   '(yaml-set-imenu-generic-expression turn-off-flyspell turn-off-auto-fill)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 110 :width normal))))
 '(fixed-pitch ((t (:family "Ubuntu Mono"))))
 '(fixed-pitch-serif ((t (:family "Ubuntu Mono"))))
 '(region ((t (:extend t :background "LightGoldenrod2")))))

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
;; (require 'solarized)
;; (require 'solarized-palettes)
;; (setq solarized-distinct-fringe-background t
;;       solarized-high-contrast-mode-line nil
;;       solarized-use-variable-pitch nil
;;       solarized-height-minus-1 1.0	; was 0.8
;;       solarized-height-plus-1 1.0	; was 1.1
;;       solarized-height-plus-2 1.0	; was 1.15
;;       solarized-height-plus-3 1.0	; was 1.2
;;       solarized-height-plus-4 1.0)	; was 1.3
;; (solarized-create-theme-file 'light 'solarized-light-kt
;;   solarized-light-color-palette-alist
;;   '((custom-theme-set-faces
;;      theme-name
;;      `(minibuffer-prompt ((,class (:foreground ,blue)))))))
;; (solarized-create-theme-file 'dark 'solarized-dark-kt
;;   solarized-light-color-palette-alist
;;   '((custom-theme-set-faces
;;      theme-name
;;      `(minibuffer-prompt ((,class (:foreground ,blue)))))))
;; (load-theme 'solarized-light-kt)

(load-theme 'acme-kt)

;; ffap
(setq ffap-require-prefix t
      ffap-bindings
      '((global-set-key [S-mouse-2] 'ffap-at-mouse)
	(global-set-key [C-S-mouse-2] 'ffap-menu)
	(global-set-key [remap find-file] 'find-file-at-point)))
(ffap-bindings)

;; Scroll the screen "up" or "down" one line with C-z and M-z
;; From O'Reilly's *Unix Power Tools*, 3rd Ed., Sect. 19.7, pg. 361
(defun scroll-up-one () "Scroll up 1 line." (interactive)
       (scroll-up (prefix-numeric-value current-prefix-arg)))
(defun scroll-down-one () "Scroll down 1 line." (interactive)
       (scroll-down (prefix-numeric-value current-prefix-arg)))
(global-set-key "\C-z" 'scroll-up-one)
(global-set-key "\C-\M-z" 'scroll-down-one)

;; Get rid of "<mouse-?> is undefined" warnings (horizontal scroll in X11)
;; (global-set-key (kbd "<mouse-6>") (lambda () (interactive) ()))
;; (global-set-key (kbd "<mouse-7>") (lambda () (interactive) ()))

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
;; (global-set-key (kbd "C-x \\") 'multishell-pop-to-shell)
;; (global-set-key (kbd "C-x C-\\") 'multishell-list)
(global-set-key (kbd "C-x M-\\") 'ansi-term)
(global-set-key (kbd "C-x |") 'eshell)
(global-set-key (kbd "C-x 4 B") 'bookmark-jump-other-window)
(global-set-key (kbd "C-x 7") 'rename-buffer)
(global-set-key (kbd "C-x 9") 'quit-window)
(global-set-key (kbd "C-x r B") 'bookmark-jump-other-window)
(global-set-key (kbd "C-x t t") 'tab-bar-select-tab)

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

;; calendar
;; Drop holidays of other religions.  Extra Ecclesiam nulla salus!
(setq calendar-christian-all-holidays-flag t)
(setq holiday-other-holidays
      '(;; Other holy days of obligation in the US
	(holiday-fixed 1 1 "Circumcision of Our Lord")
	(holiday-fixed 11 1 "All Saints Day")
	(holiday-fixed 12 8 "Immaculate Conception")
	;; Other major Christian holidays
	(holiday-float 10 0 -1 "Feast of Christ the King")))
(setq calendar-holidays
      (append holiday-general-holidays holiday-local-holidays
	  holiday-other-holidays holiday-christian-holidays
	  holiday-solar-holidays))
(setq calendar-mark-diary-entries-flag t
      calendar-mark-holidays-flag t
      calendar-today-visible-hook '(calendar-mark-today))

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

;; elpher
(defun elpher-reset-cache ()
  (interactive)
  (setq elpher-content-cache (make-hash-table :test 'equal)))

;; go-mode
;; Install from MELPA
;; (require 'mode-local)
;; (setq-mode-local go-mode tab-width 4)

;; info-mode
;; Include /usr/share/info/emacs
(setq Info-additional-directory-list '("/usr/share/info/emacs"))

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
(setq org-directory "~/org")
(setq org-agenda-files (concat org-directory "/agenda-files")
      org-agenda-include-diary t)
(setq org-publish-project-alist
      '(("org"
	 :base-directory "~/org"
	 :publishing-directory "~/org"
	 :publishing-function org-html-publish-to-html)))
;; (setq org-todo-keywords
;;       '((sequence "TODO(t!/!)" "INPROG(i!/!)" "|" "DONE(d!/!)")
;; 	(sequence "BLOCKED(b!/!)" "|" "CANCELED(c!/!)")))
;; (setq org-todo-keyword-faces
;;       '(("TODO" . "red")
;; 	("INPROG" . "orange")
;; 	("DONE" . "darkgreen")
;; 	("BLOCKED" . "purple")
;; 	("CANCELED" . "blue")))
;; (setq org-log-done 'time)
;; (setq org-fontify-done-headline nil)

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

;; shell-mode
;; If this causes problems, e.g. on Alpine, then set it to nil
(setq explicit-shell-file-name "/bin/bash")

;; web-mode
(setq-default web-mode-markup-indent-offset 2)

;; yaml-mode
;; *.sls: SaltStack conf files
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))

;; Local overrides
(if (file-readable-p "~/.emacs.local")
    (load "~/.emacs.local")
  nil)

;; Start Emacs server
(require 'server)
(unless (server-running-p)
  (server-mode))

;; Misc (stuff appends here)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
