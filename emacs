(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(perl-indent-level 8)
 '(sh-basic-offset 8)
 '(sh-indentation 8)
 '(show-paren-mode t)
 '(standard-indent 8)
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
(add-hook 'twiki-mode-hook 'turn-on-visual-line-mode)
(add-to-list 'auto-mode-alist'("\\.twiki$" . twiki-mode))
(add-to-list 'auto-mode-alist'("\\.tmpl$" . twiki-mode))

;; Misc (stuff appends here)
(put 'scroll-left 'disabled nil)
