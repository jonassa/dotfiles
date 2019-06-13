(require 'package)
;; melpa funker ikke med https med nodeps-versjonen av Emacs på windows
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(set-frame-font "Roboto Mono 10")
(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C--") #'text-scale-decrease)



;; Forhindrer audible bell
;; (setq visible-bell t)
;; Forhindrer visible bell i tillegg til lyd
(setq ring-bell-function 'ignore)

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq custom-safe-themes t)
(setq-default right-fringe-width nil)
(setq-default left-fringe-width nil)
(save-place-mode 1) 
(savehist-mode 1)
(setq history-length 500)
;; (show-paren-mode)
(global-hl-line-mode)
(global-linum-mode)


;; Dreper minibuffer når du klikker deg ut av den
(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))
(global-set-key (kbd "C-c e") #'revert-buffer-no-confirm)
(global-set-key (kbd "C-c r") #'eval-buffer)


;; C-X C-J for dired-jump
(require 'dired-x)

(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "C-c i") #'find-user-init-file)


(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-org-config))

(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t))

(use-package counsel
  :ensure t
  :config
  (counsel-mode t))

(use-package swiper
  :ensure t
  :config
  (define-key swiper-map (kbd "M-q") 'minibuffer-keyboard-quit)
  (define-key swiper-map (kbd "M-r") 'swiper-query-replace)
  (global-set-key "\C-s" 'swiper))

(use-package company
  :ensure t
  :delight
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0.1))

(use-package which-key
  :ensure t
  :config
  ;; (which-key-mode)
  (setq which-key-idle-delay 0.1))

(use-package focus
  :ensure t)

;; Ting som kanskje egentlig ikke bør være på default, men for å prøve dem ut:
(global-prettify-symbols-mode t)
(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #' aggressive-indent-mode))
;; ===============

(use-package imenu-anywhere
  :ensure t
  :config
  (global-set-key (kbd "C-C t") #'imenu-anywhere))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode)
  (show-smartparens-global-mode))

(use-package flycheck
  :ensure t)

(use-package popwin
  :ensure t
  :config (popwin-mode)) 

;; Vil bli erstattet av evil og general
(global-set-key (kbd "<C-tab>") #'other-window)
;; Beste måten å escape på jeg klarte å finne
(global-set-key (kbd "<escape>") #'keyboard-escape-quit)
(global-set-key (kbd "M-q") #'keyboard-escape-quit)

(use-package imenu-list
  :ensure t
  :bind (("C-'" . imenu-list-smart-toggle))
  :config
  (setq imenu-list-focus-after-activation t
        imenu-list-auto-resize nil))

;; Default binding C-;
(use-package iedit
  :ensure t)
