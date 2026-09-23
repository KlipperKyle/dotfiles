;; -*- mode: emacs-lisp; lexical-binding: t; -*-
;; ~/.emacs.d/init-local.el

;; Termux GNU Emacs 30.1: unbreak scrolling
(load-library "mwheel")
(xterm-mouse-mode 1)
(setq mouse-wheel-scroll-amount
      '(1
	((shift) . hscroll)
	((meta))
	((control meta) . global-text-scale)
	((control) . text-scale)))

;; Don’t use treesit
(setopt treesit-enabled-modes nil)
