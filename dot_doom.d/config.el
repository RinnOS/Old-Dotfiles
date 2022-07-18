(elcord-mode)

(after! treemacs
  (setq treemacs-width 25))

(after! elfeed
  (setq elfeed-search-filter "@1-months-ago +unread"))

(after! hl-todo
  (setq hl-todo-keyword-faces
        '(("FOO" . "#FF4500")
          )
        )
  )

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(load-theme 'doom-acario-dark t)

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.08)

;; Needed if using emacsclient. Otherwise, your fonts will be smaller than expected.
(add-to-list 'default-frame-alist '(font .  "Source Code Pro-11"))
;; Changes certain keywords to symbols, such as lambda!
(setq global-prettify-symbols-mode t)

(setq display-line-numbers-type t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(map! :leader
      (:prefix-map ("o" . "Org")
       :desc "Toggle buffer"       "b"              #'org-roam-buffer-toggle
       :desc "Find node"           "f"              #'org-roam-node-find
       :desc "Insert node"         "i"              #'org-roam-node-insert
       :desc "Ring goto"           "r g"            #'org-mark-ring-goto
       )

      (:prefix-map ("w" . "Window")
       :desc "Window left"         "<left>"       #'evil-window-left
       :desc "Window right"        "<right>"      #'evil-window-right
       :desc "window up"           "<up>"         #'evil-window-up
       :desc "Window down"         "<down>"       #'evil-window-down
       :desc "Goto next window"    "w"            #'evil-window-next
       :desc "Close window"        "c"            #'evil-window-delete
       :desc "New window"          "n"            #'evil-window-new
       :desc "Horizontal split"    "s"            #'evil-window-split
       :desc "Vertical split"      "v"            #'evil-window-vsplit
       )

      (:desc "Treemacs"            "t t t"          #'treemacs
       :desc "VTerm"               "v"              #'vterm
       )
      )

(global-set-key (kbd "<f8>") 'minimap-mode)

(global-set-key (kbd "<f7>") 'treemacs)

(global-set-key (kbd "<f5>") 'vterm)

(after! org
  :config
  (setq org-ellipsis " ▾")
  (setq org-hide-emphasis-markers t)
  (setq org-agenda-files '())
  )

(let ((org-dir "/mnt/Vault/OrgDir"))
  (unless (file-exists-p org-dir))

  (setq org-directory org-dir
        org-roam-directory org-dir))

(setq org-roam-capture-templates
      '(("d" "default" plain
         "%?"
         :if-new (file+head "${slug}.org" "#+TITLE: ${title}\n")
         :unnarrowed t)
        )
      )
