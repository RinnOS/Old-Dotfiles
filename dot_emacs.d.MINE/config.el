(add-to-list 'display-buffer-alist
	'("\*vterm\*"
		(display-buffer-in-side-window)
		(window-height . 0.25)
		(side . bottom)
		(slot . 0)))

(setq tab-width 2)

(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'hungry)
(setq-default evil-shift-width 2)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package evil
	:init
	(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
	(setq evil-want-keybinding nil)
	(setq evil-vsplit-window-right t)
	(setq evil-split-window-below t)
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

(use-package all-the-icons
	:if (display-graphic-p)
	:commands all-the-icons-install-fonts)

(use-package emojify
	:hook (after-init . global-emojify-mode))

(use-package sudo-edit)

(use-package highlight-indent-guides
	:config
	(setq highlight-indent-guides-method 'fill)
	:hook (prog-mode . highlight-indent-guides-mode))

(use-package rainbow-delimiters
	:hook (prog-mode . rainbow-delimiters-mode))

(use-package undo-fu)

(use-package minimap)

(use-package neotree
	:config
	(setq neo-smart-open t)
	(setq projetile-switch-project-action 'neotree-projectile-action))

(use-package vterm)

(use-package yasnippet
	:config
	(setq yas-snippet-dirs
		'("~/.emacs.d/snippets"))
	(yas-global-mode 1))

(use-package smartparens
	:config
	(smartparens-global-mode 1))

(use-package projectile
	:init
	(setq projectile-project-search-path '("~/Projects" "/mnt/Vault/Projects"))
	:config
	(projectile-mode 1))

(use-package dashboard
	:config
	(dashboard-setup-startup-hook))

(use-package all-the-icons-dired)

(use-package company
	:config
	(setq company-idle-delay 0.1)
	(setq company-minimum-prefix-length 2))
(global-company-mode)

(use-package flycheck
	:init
	(global-flycheck-mode))

(use-package lsp-ui
	:commands lsp-ui-mode)

(use-package lsp-mode
	:init
	(setq lsp-keymap-prefix "C-c l")
	:hook
	((lsp-mode . lsp-enable-which-key-integration)
		(typescript-mode . lsp-deferred)
		(js2-mode . lsp-deferred)
		(json-mode . lsp-deferred))
	:commands (lsp lsp-deferred))

(use-package typescript-mode
	:mode "\\.ts\\'"
	:config
	(setq typescript-indent-level 2))

(use-package js2-mode
	:mode "\\.js\\'"
	:config
	(setq js2-basic-offset 2))

(use-package json-mode
	:mode "\\.json\\'"
	:config
	(setq js-indent-level 2))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(setq global-prettify-symbols-mode 1)

(global-display-line-numbers-mode 1)

(global-visual-line-mode t)

(setq minimap-window-location 'right)

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

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(setq dashboard-banner-logo-title "Welcome to Emacs!"
	dashboard-startup-banner 'logo
	;;dashboard-startup-banner "path/to/banner"
	dashboard-center-content nil
	dashboard-show-shortcuts t
	dashboard-set-heading-icons t
	dashboard-set-file-icons t
	;;dashboard-set-init-info "Some random string"
	dashboard-set-init-info t)

(setq dashboard-items '((recents  . 5)
						(bookmarks . 5)
						(projects . 5)
						(agenda . 5)))

(dashboard-modify-heading-icons '((recents  . "file-text")
								  (bookmarks . "book")))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "C-0") '(lambda () (interactive) (text-scale-adjust 0)))

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(nvmap :prefix "SPC"
	"h"				'(:ignore t :wk "help")
	"h r r"			'((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :wk "Reload emacs config")

	"h s"			'(:ignore t :wk "Snippets")
	"h s n"			'(yas-new-snippet :wk "New snippet"))

(nvmap :prefix "SPC"
	"f"				'(:ignore t :wk "File")
	"f s"			'(save-buffer :wk "Save buffer")
	"f S"			'(write-file :wk "Save as")
	"f R"			'(rename-file :wk "Rename")
	"f U"			'(sudo-edit :wk "Edit as root")
	"f D"			'(delete-file :wk "Delete")
	"f f"			'(find-file :wk "Find file")
	"f u"			'(sudo-edit-find-file :wk "Find file as root"))

(nvmap :prefix "SPC"
	"d"				'(:ignore t :wk "Dired")
	"d d"			'(dired :wk "Dired")
	"d j"			'(dired-jump :wk "Jump to dired"))

(nvmap :prefix "SPC"
	"w"				'(:ignore t :wk "Window")
	"w c"			'(evil-window-delete :wk "Close window")
	"w n"			'(evil-window-new :wk "New window")
	"w s"			'(evil-window-split :wk "Horizontal split window")
	"w v"			'(evil-window-vsplit :wk "Vertical split window")

	"w h"			'(evil-window-left :wk "Window left")
	"w j"			'(evil-window-down :wk "Window down")
	"w k"			'(evil-window-up :wk "Window up")
	"w l"			'(evil-window-right :wk "Window right")
	;; Arrow keys
	"w <left>"		'(evil-window-left :wk "Window left")
	"w <down>"		'(evil-window-down :wk "Window down")
	"w <up>"		'(evil-window-up :wk "Window up")
	"w <right>"		'(evil-window-right :wk "Window right")

	"w w"			'(evil-window-next :wk "Next window"))

(nvmap :prefix "SPC"
	"b"				'(:ignore t :wk "Buffers")
	"b b"			'(ibuffer :wk "Open ibuffer")
	"b k"			'(kill-current-buffer :wk "Kill current buffer")
	"b n"			'(next-buffer :wk "Next buffer")
	"b p"			'(previous-buffer :wk "Previous buffer")
	"b B"			'(ibuffer-list-buffers :wk "List buffers")
	"b K"			'(kill-buffer :wk "Kill buffer"))

(nvmap :prefix "SPC"
	"p"				'(:ignore t :wk "Project")
	"p a"			'(projectile-find-other-file :wk "Find other file")
	"p s"			'(projectile-switch-project :wk "Switch project"))

(nvmap :prefix "SPC"
	"n"				'(:ignore t :wk "Neotree")
	"n t"			'(neotree-toggle :wk "Toggle neotree")
	"n f"			'(neotree-find :wk "Find file")
	"n d"			'(neotree-dir :wk "Open directory")
	"n s"			'(neotree-show :wk "Show neotree")
	"n R"			'(neotree-rename-node :wk "Rename node")
	"n D"			'(neotree-delete-node :wk "Delete node")
	"n C"			'(neotree-create-node :wk "Create node")
	"n H"			'(neotree-hidden-file-toggle :wk "Toggle hidden files"))

(nvmap :prefix "SPC"
	"t"				'(:ignore t :wk "Toggle")
	"t t"			'(toggle-truncate-lines :wk "Toggle truncate lines")
	"t m"			'(minimap-mode :wk "Toggle minimap")
	"t f"			'(neotree-toggle :wk "Toggle neotree")
	"t v"			'(vterm-other-window :wk "Toggle vterm"))

(nvmap :prefix "SPC"
	"SPC"			'(:ignore t :wk "M-x")
	"."				'(find-file :wk "Find file")

	"u"				'(undo-fu-only-undo :wk "Undo")
	"r"				'(undo-fu-only-redo :wk "Redo"))

(add-to-list 'display-buffer-alist
	'("\*vterm\*"
		(display-buffer-in-side-window)
		(window-height . 0.25)
		(side . bottom)
		(slot . 0)))
