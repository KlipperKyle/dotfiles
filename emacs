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
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
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

;; Hooks
;;(setq flyspell-mode-hook nil)
;;(add-hook 'flyspell-mode-hook
;;	  (lambda () (
;;		      if (bound-and-true-p flyspell-mode)
;;			 (flyspell-buffer))))

(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/lisp"))

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
