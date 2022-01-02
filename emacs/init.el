;; notes
;; use 'describe-* class of commands for more info
;; C-h v
;; C-g to cancel
;; C-h w command-name to find keybindings for it
;; C-h k key-sequence to find command for keybinding

;; as instructed in straight installation docs: https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; https://www.emacswiki.org/emacs/EmacsClient
;; required for using emacsclient
;; ex. opening file in emacs from emacs (ansi-terminal)
(server-start)

;; why use use-package macro?
;; https://dev.to/jkreeftmeijer/emacs-package-management-with-straight-el-and-use-package-3oc8
;; basically allows you to specify dependency and configure it in single step
(straight-use-package 'use-package)
;; use straight by default
(use-package straight
  :custom (straight-use-package-by-default t))

;; unused for now - emacs has this built in
(defun _leader(key)
    (defconst leader-key "<SPC>")
    (format "%s %s" leader-key key)
)
;; evil mode cheat sheet
;; https://github.com/alycklama/evil-mode-cheat-sheet
;; evil readthedocs: https://evil.readthedocs.io/en/latest/settings.html
;; list vars and their vals: M-x customize-group RET evil RET
;; change them before loading the package
(use-package evil
  :init(progn
	 (setq evil-want-C-u-scroll t) 
	 (setq evil-want-C-d-scroll t) 
	 (setq evil-search-module evil-search)
  :ensure
  :config(progn
	   (evil-mode 1)
	   ;; (define-key evil-motion-state-map "\\" 'evil-ex)
	   ;;(define-key evil-motion-state-map (kbd "SPC") 'evil-ex)
	   (evil-define-key 'motion (kbd ";") 'evil-ex)
	   (global-set-key (kbd "C-c <left>") 'evil-window-prev)
	   (global-set-key (kbd "C-c <right>") 'evil-window-next)
	   (global-set-key (kbd "<esc>") 'keyboard-quit)
	   
	   ;;(define-key evil-motion-state-map (kbd "C-u") 'scroll-down)
	   ;;(define-key evil-motion-state-map (kbd "C-d") 'scroll-up)
	   ;;(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)
	   ;;(define-key evil-motion-state-map (kbd "C-d") 'evil-scroll-down)
	   ;; LEADER KEY equiv
	   ;; https://github.com/noctuid/evil-guide#leader-key
	   (evil-set-leader 'normal (kbd "<SPC>"))
	   (evil-define-key 'normal 'global (kbd "<leader>p") 'projectile-find-file)
	   )
)

;; dependencies
(use-package dracula-theme)
(use-package gruvbox-theme)

;; completion mechanism
;; https://github.com/abo-abo/swiper
(use-package ivy
  :init(progn
	   (setq ivy-use-virtual-buffers t) ;; adds recent files to ivy buffers 
	   (setq ivy-count-format "(%d/%d) ") ;; candidate count for ivy results
	)
  :config(progn
	   (ivy-mode 1)
	)
  )

;; finder (uses ivy)
(use-package swiper
  :config(progn
	  (global-set-key (kbd "C-s") 'swiper) 
	  (global-set-key (kbd "\\") 'swiper)
	  (global-set-key (kbd "s-f") 'swiper)
	)
  )

(use-package magit)

;; project management
;; https://docs.projectile.mx/projectile/usage.html
(use-package projectile
  :config(progn
	(projectile-mode +1)
	(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
	)
  )

;; (use-package vterm)

;;
(use-package lsp-mode
  :init
  ;; set pefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (rust-mode . lsp)
         ;; if you want which-key integration
         ;;(lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp)

(use-package command-log-mode)


;; language major modes
(use-package rust-mode)

;; https://github.com/manateelazycat/awesome-tab
;; (use-package awesome-tab
  ;; :config
  ;; (awesome-tab-mode t))
;; 
;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)


(load-theme 'gruvbox t)
;; some additional emacs config
(setq inhibit-startup-message t)
;;(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar (contains action buttons for stuff like save)
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)          ; Disable the menu bar
;; macos port of emacs does not support tab-bar-mode yet
;; https://www.reddit.com/r/emacs/comments/ek3ai3/emacs27_tabbar_with_cocoa_builds_not_working/
;; (tab-bar-mode 1)

;; disable messages bufer since it's annoying
;;(setq-default message-log-max nil)

;; https://www.emacswiki.org/emacs/
(setq global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)

;; (defalias 'q 'delete-window)

(defun zsh ()
  (interactive)
  (ansi-term "/bin/zsh" "term")
)

;; mac keys: https://emacs.stackexchange.com/questions/26616/how-to-use-a-macs-command-key-as-a-control-key

;; key bindings
;; https://www.masteringemacs.org/article/mastering-key-bindings-emacs
;; command = interactive function
;; can only invoke commands through keybindings
;; - it must also have no args
(defun rw-emacs-config ()
  (interactive)
  (message "opening init.d")
  (find-file "~/.emacs.d/init.el")
)

;; from: https://www.emacswiki.org/emacs/KillingBuffers
(defun close-and-kill-this-pane ()
      "If there are multiple windows, then close this pane and kill the buffer in it also."
      (interactive)
      (kill-this-buffer)
      (if (not (one-window-p))
          (delete-window)))

;; custom keybindings
(global-set-key (kbd "s-w") 'close-and-kill-this-pane)
(global-set-key (kbd "M-s-<left>") 'previous-buffer)
(global-set-key (kbd "M-s-<right>") 'next-buffer)

;; from: https://www.emacswiki.org/emacs/LineNumbers
(defcustom display-line-numbers-exempt-modes
  '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode)
  "Major modes on which to disable line numbers."
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "Turn on line numbers except for certain major modes.
Exempt major modes are defined in `display-line-numbers-exempt-modes'."
  (unless (or (minibufferp)
              (member major-mode display-line-numbers-exempt-modes))
    (display-line-numbers-mode)))

