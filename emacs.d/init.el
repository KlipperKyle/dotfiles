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
 '(c-basic-offset 8)
 '(c-default-style
   (quote
    ((java-mode . "java")
     (awk-mode . "awk")
     (other . "k&r"))))
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
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-mouse org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (atomic-chrome go-mode yaml-mode markdown-mode htmlize)))
 '(scroll-bar-mode (quote left))
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
   "\\(?:^\\|\\)[^]#$%>
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
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/lisp"))

;; Scroll the screen "up" or "down" one line with C-z and M-z
;; From O'Reilly's *Unix Power Tools*, 3rd Ed., Sect. 19.7, pg. 361
(defun scroll-up-one () "Scroll up 1 line." (interactive)
       (scroll-up (prefix-numeric-value current-prefix-arg)))
(defun scroll-down-one () "Scroll down 1 line." (interactive)
       (scroll-down (prefix-numeric-value current-prefix-arg)))
(define-key global-map "\C-z" 'scroll-up-one)
(define-key global-map "\C-\M-z" 'scroll-down-one)

;; Get rid of "<mouse-?> is undefined" warnings (horizontal scroll in X11)
(define-key global-map (kbd "<mouse-6>") (lambda () (interactive) ()))
(define-key global-map (kbd "<mouse-7>") (lambda () (interactive) ()))

;; Annoyances with KVM switch
(define-key global-map (kbd "<Scroll_Lock>") (lambda () (interactive) ()))
(define-key global-map (kbd "<scroll>") (lambda () (interactive) ()))

;; Annoyances with Windows
(define-key global-map (kbd "<apps>") 'execute-extended-command)
(define-key global-map (kbd "<C-lwindow>") (lambda () (interactive) ()))
(define-key global-map (kbd "<C-rwindow>") (lambda () (interactive) ()))

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

;; Markdown Mode
;; Install from MELPA
(setq markdown-content-type "text/html; charset=utf-8")

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
      '((sequence "TODO(t)" "INPROG(i)" "|" "DONE(d)")
	(sequence "BLOCKED(b)" "|" "CANCELED(c)")))
(setq org-todo-keyword-faces
      '(("INPROG" . "orange")
	("BLOCKED" . "purple")
	("CANCELED" . "blue")))
(setq org-log-done 'time)

;; atomic-chrome
(setq atomic-chrome-buffer-open-style 'full)

;; ebuild-mode
(setq ebuild-mode-update-copyright nil)

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
