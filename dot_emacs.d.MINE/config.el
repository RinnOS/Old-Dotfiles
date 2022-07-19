(require 'package)
(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/"))
(package-refresh-contents)
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-install 'use-package))
(setq use-package-always-ensure t)

(use-package evil
	:init		;; Tweak evil's configuration before loading it
	(setq evil-want-integration t) ;; This is optional since it's already set to t by default
	(setq evil-want-keybinding nil)
	(setq evil-vsplit-window-right t)
	(setq evil-split-window-bewlo t)
	(evil-mode))

(use-package evil-collection
	:after evil
	:config
	(evil-collection-init))

(use-package general
	:config
	(general-evil-setup t))

(use-package doom-themes)

(use-package doom-modeline)
(doom-modeline-mode 1)

(use-package which-key)
(which-key-mode)

(use-package ivy
	:defer 0.1
	:diminish
	:bind
	(("C-c C-r" . ivy-resume)
	 ("C-x B" . ivy-switch-buffer-other-window))
	:custom
	(setq ivy-count-format "(%d/%d) ")
	(setq ivy-use-virtual-buffers t)
	(setq enable-recursive-minibuffers t)
	:config
	(ivy-mode))

(use-package ivy-rich
	:after ivy
	:custom
	(ivy-virtual-abbreviate 'full
	 ivy-rich-switch-buffer-align-virtual-buffer t
	 ivy-rich-path-style 'abbrev)
	:config
	(ivy-set-display-transformer 'ivy-switch-buffer
					     'ivy-rich-switch-buffer-transformer)
	(ivy-rich-mode 1)) ;; this gets us descriptions in M-x.

(use-package swiper
	:after ivy
	:bind (("C-s" . swiper)
		   ("C-r" . swiper)))

(use-package counsel
	:after ivy
	:config
	(counsel-mode))

(use-package projectile
	:config
	(projectile-global-mode 1))

(use-package all-the-icons
	:if (display-graphic-p))

(use-package dashboard
	:config
	(dashboard-setup-startup-hook))

(setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

(load-theme 'doom-acario-dark t)

(set-face-attribute 'default nil
	:font "SauceCodePro Nerd Font 11"
	:weight 'medium)
(set-face-attribute 'variable-pitch nil
	:font "Ubuntu Nerd Font 11"
	:weight 'medium)
(set-face-attribute 'fixed-pitch nil
	:font "SauceCodePro Nerd Font 11"
	:weight 'medium)

(add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))

(setq-default line-spacing 0.08)
(setq global-prettify-symbols-mode t)

(setq dashboard-banner-logo-title "Emacs Is More Than Just A Text Editor")
(setq dashboard-startup-banner 'logo)
;;(setq dashboard-startup-banner "")
(setq dashboard-center-content nil)
(setq dashboard-show-shortcuts t)
;;(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(dashboard-modify-heading-icons '((recents . "file-text")
								  (bookmarks . "book")))
(add-to-list 'dashboard-items '(agenda) t)
(setq dashboard-week-agenda t)
(setq dashboard-items '((recents . 5)
						(bookmarks . 5)
						(projects . 5)
						(agenda . 5)
						(registers . 5)))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(setq display-line-numbers-type t)

(global-visual-line-mode t)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "C-0") '(lambda () (interactive) (text-scale-adjust 0)))

(nvmap :prefix "SPC"
	"b"		'(:ignore b :which-key "Buffer")
	"b b"	'(ibuffer :which-key "Ibuffer")
	"b k"	'(kill-current-buffer :which-key "Kill current buffer")
	"b n"	'(next-buffer :which-key "Next buffer")
	"b p"	'(previous-buffer :which-key "Previous buffer")
	"b B"	'(ibuffer-list-buffers :which-key "Ibuffer list buffers")
	"b K"	'(kill-buffer :which-key "Kill buffer"))

(nvmap :prefix "SPC"
	"e"		'(:ignore e :which-key "Eshell")
	"e h"	'(counsel-esh-history :which-key "Eshell history")
	"e s"	'(eshell :which-key "Eshell"))

(nvmap :prefix "SPC"
	"f"		'(:ignore f :which-key "File")
	"f r"	'(counsel-recentf :which-key "Recent files"))

(nvmap :prefix "SPC"
	"w"		'(:ignore w :which-key "Window")
	"w c"	'(evil-window-delete :which-key "Close window")
	"w n"	'(evil-window-new :which-key "New window")
	"w s"	'(evil-window-split :which-key "Horizontal split window")
	"w v"	'(evil-window-vsplit :which-key	"Vertical split window")

	"w h"	'(evil-window-left :which-key "Window left")
	"w j"	'(evil-window-down :which-key "Window down")
	"w k"	'(evil-window-up :which-key "Window up")
	"w l"	'(evil-window-right :which-key "Window right")
	;; Arrow keys
	"w <left>"	'(evil-window-left :which-key "Window left")
	"w <down>"	'(evil-window-down :which-key "Window down")
	"w <up>"	'(evil-window-up :which-key "Window up")
	"w <right>"	'(evil-window-right :which-key "Window right")

	"w w"	'(evil-window-next :which-key "Goto next window"))

(nvmap :prefix "SPC"
	"t"		'(:ignore t :which-key "Toggle")
	"t t"	'(toggle-truncate-lines :which-key "Toggle truncate lines"))

(nvmap :prefix "SPC"
	"h"		'(:ignore h :which-key "Help")
	"h r r"	'((lambda () (interative) (load-file "~/.emacs.d/init.el")) :which-key "Reload emacs config"))

(nvmap :prefix "SPC"
	"SPC"	'(counsel-M-x :which-key "M-x")
	"."		'(find-file :which-key "Find file"))
