;; -*- mode: emacs-lisp -*-
;; ~/.emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-xdg-open))
 '(c-basic-offset 8)
 '(c-default-style
   (quote
    ((java-mode . "java")
     (awk-mode . "awk")
     (other . "k&r"))))
 '(column-number-mode t)
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
 '(flyspell-use-meta-tab nil)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(org-export-backends (quote (ascii html icalendar latex md odt texinfo)))
 '(org-link-frame-setup
   (quote
    ((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame))))
 '(show-paren-mode t)
 '(text-mode-hook
   (quote
    (turn-on-flyspell turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))

;; Custom lisp dir
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/lisp"))

;; Get rid of "<mouse-?> is undefined" warnings (horizontal scroll in X11)
(global-set-key (kbd "<mouse-6>") (lambda () (interactive) ()))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) ()))

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

;; Org
(setq org-publish-project-alist
      '(("org"
	 :base-directory "~/org"
	 :publishing-directory "~/org"
	 :publishing-function org-html-publish-to-html)))

;; Local overrides
(if (file-readable-p "~/.emacs.local")
    (load "~/.emacs.local")
  nil)

;; Misc (stuff appends here)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
