(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar (contains action buttons for stuff like save)
(tooltip-mode -1)           ; Disable tooltips

(menu-bar-mode -1)          ; Disable the menu bar

;;(load-theme 'wombat)

;; Make ESC quit prompts
;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-set-key (kbd "/") ')
;;(setq mac-command-modifier '\')

;; require the "package" package for packagement management
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; straight package manager
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


(package-initialize)
;; install packages id package archive doesn't exist 
(unless package-archive-contents (package-refresh-contents))

;; install if not installed
;; (unless (package-installed-p 'use-package) (package-install 'use-package))
;; (require 'use-package)
;; (setq use-package-always-ensure t)  
;; ctrl-h v: describe variable
;; ensure will make it walays try to download the package if not available

;; =============================================
;; REGION INSTALL
;; =============================================

;; Evil
(straight-use-package 'evil)
(evil-mode 1)

;; (unless (package-installed-p 'helm) (package-install 'helm))
(straight-use-package 'helm)
(require 'helm)
(straight-use-package 'magit)
(straight-use-package 'lsp-mode)
(require 'lsp-mode)
(straight-use-package 'which-key)

(straight-use-package 'dracula-theme)

;; =============================================
;; REGION CONFIG
;; =============================================

(load-theme 'dracula t)
(setq default-frame-alist '((font . "Source Code Pro-14")))

(setq which-key-idle-delay 5000)
(which-key-mode)
(which-key-setup-minibuffer)

;; https://www.emacswiki.org/emacs/LineNumbers
(global-display-line-numbers-mode)

;; replace M-x with more ergonomic options
;; (global-set-key "\\" 'execute-extended-command)
;; (global-set-key "\\" 'helm-M-x)
;; (global-set-key "\\" ':)
(define-key evil-normal-state-map "\\" 'evil-ex)

;; (add-hook 'prog-mode-hook #'lsp)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(helm use-package evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
