(after! hl-todo
	(setq hl-todo-keyword-faces
		'(("FOO" . "#FF4500")
			)))

(setq yas-snippet-dirs
	'("~/.doom.d/snippets"
		))
(yas-global-mode 1)

(setq projectile-project-search-path '("~/Projects" "~/Documents/Projects" "/mnt/Vault/Projects"))

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

(load-theme 'doom-acario-dark t)

(setq display-line-numbers-type t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

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

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "C-0") '(lambda () (interactive) (text-scale-adjust 0)))

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "<f5>") 'vterm)
(global-set-key (kbd "<f7>") 'neotree)
(global-set-key (kbd "<f8>") 'minimap-mode)

(global-set-key (kbd "C-ö") 'comment-or-uncomment-region)

(map! :leader
	(:prefix-map ("w" . "Window")
		:desc "Close window" "c" #'evil-window-delete
		:desc "New window" "n" #'evil-window-new
		:desc "Horizontal split window" "s" #'evil-window-split
		:desc "Vertical split window" "v" #'evil-window-vsplit

		:desc "Window left" "h" #'evil-window-left
		:desc "Window right" "l" #'evil-window-right
		:desc "Window up" "k" #'evil-window-up
		:desc "Window down" "j" #'evil-window-down
		;; Arrow keys
		:desc "Window left" "<left>" #'evil-window-left
		:desc "Window right" "<right>" #'evil-window-right
		:desc "Window up" "<up>" #'evil-window-up
		:desc "Window down" "<down>" #'evil-window-down

		:desc "Next window" "w" #'evil-window-next))

(map! :leader
	(:prefix-map ("b" . "Buffers")
		:desc "Open ibuffer" "b" #'ibuffer
		:desc "Kill current buffer" "k" #'kill-this-buffer
		:desc "Next buffer" "n" #'next-buffer
		:desc "Previous buffer" "p" #'previous-buffer
		:desc "List buffers" "B" #'list-buffers
		:desc "Kill buffer" "K" #'kill-buffer))

(map! :leader
	(:prefix-map ("n" . "Neotree")
		:desc "Toggle neotree" "t" #'neotree-toggle
		:desc "Find file" "f" #'neotree-find
		:desc "Open directory" "d" #'neotree-dir
		:desc "Show neotree" "s" #'neotree-show
		:desc "Rename node" "r" #'neotree-rename-node
		:desc "Delete node" "d" #'neotree-delete-node
		:desc "Create directory" "C" #'neotree-create-node-directory
		:desc "Create file" "c" #'neotree-create-node-file
		:desc "Toggle hidden files" "H" #'neotree-toggle-hidden-files))

(map! :leader
	(:prefix-map ("y" . "Yansippet")
		:desc "New snippet" "n" #'yas-new-snippet))

(map! :leader
	(:prefix-map ("t" . "Toggle")
		:desc "Toggle truncate lines" "t" #'toggle-truncate-lines
		:desc "Toggle minimap" "m" #'minimap-mode
		:desc "Toggle neotree" "n" #'neotree-toggle
		:desc "Toggle vterm" "v" #'vterm-toggle))

(map! :leader
	:desc "Undo" "u" #'undo-fu-only-undo
	:desc "Redo" "r" #'undo-fu-only-redo)
