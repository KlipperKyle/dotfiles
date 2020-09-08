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
 '(column-number-mode t)
 '(completions-format (quote vertical))
 '(confirm-kill-emacs (quote y-or-n-p))
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
 '(electric-pair-mode t)
 '(electric-quote-mode t)
 '(eshell-cmpl-cycle-completions nil)
 '(eww-header-line-format "%u | %t")
 '(flyspell-use-meta-tab nil)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(org-agenda-files (quote ("~/org/todo.org")))
 ;; '(package-selected-packages
 ;;   (quote
 ;;    (docker-compose-mode dockerfile-mode restclient tabbar web-mode php-mode go-playground atomic-chrome go-mode yaml-mode markdown-mode htmlize)))
 '(safe-local-variable-values (quote ((sgml-basic-offset . 2))))
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
 '(sql-mysql-options (quote ("--prompt=mysql> ")))
 '(tabbar-mode t nil (tabbar))
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
 '(wdired-allow-to-change-permissions (quote advanced))
 '(yaml-mode-hook
   (quote
    (yaml-set-imenu-generic-expression turn-off-flyspell turn-off-auto-fill))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monospace" :foundry "unknown" :slant normal :weight normal :height 100 :width normal))))
 '(region ((t (:background "LightGoldenrod2"))))
 '(tabbar-default ((t (:inherit variable-pitch))))
 '(tabbar-modified ((t (:inherit tabbar-default :foreground "darkgreen" :box (:line-width 1 :color "white" :style released-button)))))
 '(tabbar-selected-modified ((t (:inherit tabbar-selected)))))

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

;; Global keybindings
(global-set-key (kbd "C-c q") 'quit-window)
(global-set-key (kbd "C-c r") 'revert-buffer)

;; Show inline completions.
(icomplete-mode)

;; Delete selection when typing over it.
(delete-selection-mode t)

;; tabbar-mode
;; customize to show all normal files in one group
;; (defun my-tabbar-buffer-groups ()
;;   "Returns the name of the tab group names the current buffer belongs to.

;; There are two groups: Emacs buffers (those whose name starts with '*', plus
;; dired buffers), and the rest.  This works at least with Emacs v24.2 using
;; tabbar.el v1.7.

;; https://www.emacswiki.org/emacs/TabBarMode"
;;   (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
;; 	      ((eq major-mode 'dired-mode) "emacs")
;; 	      (t "user"))))
;; (defun my-tabbar-buffer-groups-all ()
;;   (list "All"))
;; (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode.

Customized in ~/.emacs.d/init.el
Original in tabbar.el"
  (list
   (cond
    ((or (get-buffer-process (current-buffer))
         ;; Check if the major mode derives from `comint-mode' or
         ;; `compilation-mode'.
         (tabbar-buffer-mode-derived-p
          major-mode '(comint-mode compilation-mode)))
     "Process"
     )
    ((member (buffer-name)
             '("*scratch*" "*Messages*"))
     "Common"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    ((memq major-mode
           '(help-mode apropos-mode Info-mode Man-mode))
     "Help"
     )
    ((memq major-mode
           '(rmail-mode
             rmail-edit-mode vm-summary-mode vm-mode mail-mode
             mh-letter-mode mh-show-mode mh-folder-mode
             gnus-summary-mode message-mode gnus-group-mode
             gnus-article-mode score-mode gnus-browse-killed-mode))
     "Mail"
     )
    ((memq major-mode
	   '(org-mode org-agenda-mode))
     "Org"
     )
    ((string-prefix-p "*tramp/" (buffer-name))
     "Tramp"
     )
    (t
     ;; Return `mode-name' if not blank, `major-mode' otherwise.
     (if (and (stringp mode-name)
              ;; Take care of preserving the match-data because this
              ;; function is called when updating the header line.
              (save-match-data (string-match "[^ ]" mode-name)))
         mode-name
       (symbol-name major-mode))
     ))))


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
