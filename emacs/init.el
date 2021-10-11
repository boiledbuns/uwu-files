(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar (contains action buttons for stuff like save)
(tooltip-mode -1)           ; Disable tooltips

(menu-bar-mode -1)          ; Disable the menu bar

(load-theme 'wombat)

;; Make ESC quit prompts
;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-set-key (kbd "/") ')
;;(setq mac-command-modifier '\')

;; require the "package" package for packagement management
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))


(package-initialize)
;; install packages id package archive doesn't exist 
(unless package-archive-contents
  (package-refresh-contents))

;; install if not installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
 (setq use-package-always-ensure t)  
;; ctrl-h v: describe variable
;; ensure will make it walays try to download the package if not available

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(add-hook 'prog-mode-HOOK' display-line-numbers-mode)

(global-set-key "\\" 'execute-extended-command)
