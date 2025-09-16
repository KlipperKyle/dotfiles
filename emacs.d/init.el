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

;; Custom lisp dir
(add-to-list 'load-path "~/.emacs.d/lisp")
;; Custom info files
(add-to-list 'Info-directory-list "~/.local/share/info")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-width 80)
 '(ange-ftp-default-user "anonymous")
 '(ange-ftp-generate-anonymous-password "")
 '(auth-sources '("~/.authinfo.gpg"))
 '(auto-hscroll-mode 'current-line)
 '(column-number-mode t)
 '(completions-format 'vertical)
 '(confirm-kill-emacs 'y-or-n-p)
 '(echo-keystrokes 0.001)
 '(electric-quote-mode t)
 '(elpher-open-urls-with-eww t)
 '(eww-suggest-uris
   '(eww-links-at-point thing-at-point-url-at-point eww-current-url
			(lambda nil
			  (concat "file://" (getenv "HOME")
				  "/org/index.html"))))
 '(flyspell-use-meta-tab nil)
 '(frame-resize-pixelwise t)
 '(indicate-buffer-boundaries t)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount
   '(0.1 ((shift) . hscroll) ((meta))
	 ((control meta) . global-text-scale) ((control) . text-scale)))
 '(mouse-wheel-scroll-amount-horizontal 10)
 '(org-export-backends '(ascii beamer html icalendar latex md odt))
 '(safe-local-variable-values
   '((vc-default-patch-addressee . "bug-gnu-emacs@gnu.org")
     (etags-regen-ignores "test/manual/etags/")
     (etags-regen-regexp-alist
      (("c" "objc") "/[ \11]*DEFVAR_[A-Z_ \11(]+\"\\([^\"]+\\)\"/\\1/"
       "/[ \11]*DEFVAR_[A-Z_ \11(]+\"[^\"]+\",[ \11]\\([A-Za-z0-9_]+\\)/\\1/"))
     (nxml-child-indent . 4) (c-indent-level . 4)
     (sgml-basic-offset . 2)))
 '(save-place-mode t)
 '(scroll-bar-mode 'left)
 '(show-paren-mode t)
 '(shr-width 80)
 '(split-height-threshold 90)
 '(sql-mysql-options '("--prompt=mysql> "))
 '(tab-always-indent 'complete)
 '(tab-bar-new-tab-to 'rightmost)
 '(tab-bar-tab-hints t)
 '(tab-bar-tab-name-function 'tab-bar-tab-name-current-with-count)
 '(text-mode-hook '(turn-on-flyspell text-mode-hook-identify))
 '(tool-bar-mode nil)
 '(wdired-allow-to-change-permissions 'advanced)
 '(whitespace-style
   '(face trailing tabs spaces newline missing-newline-at-eof empty
	  indentation space-after-tab space-before-tab space-mark
	  tab-mark newline-mark))
 '(window-resize-pixelwise t)
 '(yaml-mode-hook '(yaml-set-imenu-generic-expression turn-off-flyspell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monospace" :height 90))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(fixed-pitch-serif ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Noto Serif")))))

;; Custom theme dir
(setq custom-theme-directory "~/.emacs.d/themes")

;; (load-theme 'tango)
;; (load-theme 'modus-operandi)
;; (load-theme 'acme-kt)

;; ffap
(setq ffap-require-prefix t
      ffap-bindings
      '((global-set-key [S-mouse-2] 'ffap-at-mouse)
	(global-set-key [remap find-file] 'find-file-at-point)))
(ffap-bindings)

;; Scroll the screen "up" or "down" one line with C-z and M-z
;; From O'Reilly's *Unix Power Tools*, 3rd Ed., Sect. 19.7, pg. 361
(defun scroll-up-one () "Scroll up 1 line." (interactive)
       (scroll-up (prefix-numeric-value current-prefix-arg)))
(defun scroll-down-one () "Scroll down 1 line." (interactive)
       (scroll-down (prefix-numeric-value current-prefix-arg)))
(global-set-key (kbd "C-z") 'scroll-up-one)
(global-set-key (kbd "C-M-z") 'scroll-down-one)

;; Windows
(global-set-key (kbd "<apps>") 'execute-extended-command)
(global-set-key (kbd "<C-lwindow>") (lambda () (interactive) ()))
(global-set-key (kbd "<C-rwindow>") (lambda () (interactive) ()))

;; Global keybindings
(global-set-key (kbd "C-c f") 'eww-open-file)
(global-set-key (kbd "C-c i") 'imenu)
(global-set-key (kbd "C-c q") 'quit-window)
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c t") 'shell)
(global-set-key (kbd "C-c w") 'eww)
(global-set-key (kbd "C-x 4 B") 'bookmark-jump-other-window)
(global-set-key (kbd "C-x r B") 'bookmark-jump-other-window)
(global-set-key [C-M-mouse-2] 'xref-find-definitions-at-mouse)
(global-set-key [C-M-mouse-3] 'imenu)

;; Default frame parameters
;; See (emacs)Frame Parameters
(add-to-list 'default-frame-alist '(width . 90))
(add-to-list 'default-frame-alist '(height . 36))

;; Use editorconfig everywhere
(if (locate-library "editorconfig")
    (progn
      (setq editorconfig-mode-lighter nil)
      (editorconfig-mode 1)))

;; Whether to delete selection when typing over it.
(delete-selection-mode 0)

;; Recursive minibuffer
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode 1)

(defun infer-indentation-style () (interactive)
  "Infer indentation style from buffer contents.

If our source file uses tabs, we use tabs, if spaces spaces, and
if neither, we use the current indent-tabs-mode.

See https://www.emacswiki.org/emacs/NoTabs"
  (let ((space-count (how-many "^  " (point-min) (point-max)))
	(tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

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
(setq calendar-mark-diary-entries-flag nil
      calendar-mark-holidays-flag t
      calendar-today-visible-hook '(calendar-mark-today))

;; cperl-mode
;; Use cperl-mode instead of perl-mode
;; <https://www.emacswiki.org/emacs/CPerlMode>
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

;; Use default indentation, but if you want to set custom indendation,
;; here is how to do it.

;; (setq cperl-indent-level 8
;;       cperl-continued-statement-offset 8
;;       cperl-label-offset -8)

;; Load pod-mode
(if (locate-library "pod-mode")
    (progn (require 'pod-mode)
	   (add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
	   (add-to-list 'auto-mode-alist '("\\.rakudoc$" . pod-mode))))

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

;; jinja2-mode
(add-hook 'jinja2-mode-hook 'turn-off-flyspell)

;; mail-mode
;; Make Thunderbird email replies load with the correct mode
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))
;; Mutt support.
(add-to-list 'auto-mode-alist '("/tmp/mutt.*" . mail-mode))

;; markdown-mode
;; Install from MELPA
(setq-default markdown-content-type "text/html; charset=utf-8"
	      markdown-command "cmark")

;; Org Mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-cb" 'org-switchb)
(setq org-directory "~/org"
      org-agenda-files "~/org/agenda-files"
      org-agenda-include-diary nil
      org-startup-indented t
      org-todo-keyword-faces '(("INPROG" . "orange")
			       ("BLOCKED" . "purple")))

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
	   (_ url))))
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
	   (_ url))))))

;; python-mode
(add-hook 'python-mode-hook 'infer-indentation-style)

;; sh-mode
;; Don’t use sh-mode for rc scripts.  It is broken.
(add-to-list 'interpreter-mode-alist '("rc" . prog-mode))

;; shell-mode
;; Use emacsclient instead of a “normal” editor.
(setenv "EDITOR" "emacsclient")
;; If this causes problems, e.g. on Alpine, then set it to nil.
;; (setq explicit-shell-file-name "/bin/bash")

;; xterm-mouse-mode
(xterm-mouse-mode 1)

;; yaml-mode
;; *.sls: SaltStack conf files
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))

;; Local overrides
(if (file-readable-p "~/.emacs.d/prv.el")
    (load "~/.emacs.d/prv.el"))
(if (file-readable-p "~/.emacs.d/init-local.el")
    (load "~/.emacs.d/init-local.el"))

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
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
