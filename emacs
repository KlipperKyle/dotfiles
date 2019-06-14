;; -*- mode: emacs-lisp -*-
;; ~/.emacs

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
 '(org-export-backends (quote (ascii html icalendar man md odt texinfo)))
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
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 100 :width normal)))))

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
(global-set-key (kbd "<mouse-6>") (lambda () (interactive) ()))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) ()))
(global-set-key (kbd "<Scroll_Lock>") (lambda () (interactive) ()))

;; Use cperl-mode instead of perl-mode
;; <https://www.emacswiki.org/emacs/CPerlMode>
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))
(setq cperl-indent-level 4)

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
;; <http://jblevins.org/projects/markdown-mode/>
;; <https://github.com/jrblevin/markdown-mode/tree/stable>
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; TWiki Mode
;; <https://github.com/christopherjwhite/emacs-twiki-mode>
;; Also: <http://www.twiki.org/cgi-bin/view/Support/UsingEmacsToEditTwiki>
;; Also: <https://addons.mozilla.org/en-US/seamonkey/addon/its-all-text/>
(autoload 'twiki-mode "twiki"
  "Major mode for editing TWiki markup" t)
(add-hook 'twiki-mode-hook 'turn-on-flyspell)
(add-to-list 'auto-mode-alist'("\\.twiki$" . twiki-mode))
(add-to-list 'auto-mode-alist'("\\.tmpl$" . twiki-mode))

;; Go Mode
;; <https://github.com/dominikh/go-mode.el>
(require 'go-mode-autoloads)

;; YAML Mode
;; <https://github.com/yoshiki/yaml-mode>
(autoload 'yaml-mode "yaml-mode")
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;; Org Mode
(setq org-publish-project-alist
      '(("org"
	 :base-directory "~/org"
	 :publishing-directory "~/org"
	 :publishing-function org-html-publish-to-html)))
(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROG(p)" "|" "DONE(d)")
	(sequence "BLOCKED(b)" "|")
	(sequence "|" "CANCELLED(c)")))
(setq org-todo-keyword-faces
      '(("INPROG" . "orange")
	("BLOCKED" . "purple")
	("CANCELLED" . "blue")))

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
