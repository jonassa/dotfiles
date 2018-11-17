(server-start)

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq-default default-directory "~/")
(setq default-directory "~/")
(cd "~/")

(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "defuns")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Backup files
(setq temporary-file-directory "~/.emacs.d/backup/")
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))
(setq version-control t		;; Use version numbers for backups.
    kept-new-versions 10	;; Number of newest versions to keep.
    kept-old-versions 0	;; Number of oldest versions to keep.
    delete-old-versions t	;; Don't ask to delete excess backup versions.
    backup-by-copying t	;; Copy all files, don't rename them.
    vc-make-backup-files t)	;; Also backup versioned files.

(save-place-mode 1) 
(savehist-mode 1)
(setq history-length 500)

(global-hl-line-mode)
(global-linum-mode)
(global-highlight-parentheses-mode)
(show-paren-mode)

(electric-pair-mode t)
(setq-default
 tab-width 4
 word-wrap t
 )


(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq custom-safe-themes t)
(setq-default right-fringe-width nil)
(setq-default left-fringe-width nil)

(setq select-enable-clipboard nil)
(setq initial-buffer-choice "~/.emacs.d/init.el")
(setq dired-dwim-target t)


;; Fix annoying stuff
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t)
(let ((inhibit-message t)))

(setq initial-scratch-message "")
(setq-default message-log-max nil)
(if (get-buffer "*Messages*")
    (kill-buffer "*Messages*"))
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))


(fset 'yes-or-no-p 'y-or-n-p)



(use-package evil
  :ensure t
  :init
  (setq evil-want-integration nil)
  ;; (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-mode))
  (evil-set-initial-state 'completion-list-mode 'normal) ;må være etter evil load

(use-package evil-collection
  :after evil
  :ensure t
  :init
  (setq evil-collection-mode-list nil)
  (dolist (mode '(help
				 dired
				 company
				 (package-menu package)
				 (buff-menu "buff-menu")
				 neotree
				 ))
	(add-to-list 'evil-collection-mode-list mode))
  ;; (add-to-list 'evil-collection-mode-list 'help)
  ;; (add-to-list 'evil-collection-mode-list 'dired)
  ;; (add-to-list 'evil-collection-mode-list 'company)
  ;; (add-to-list 'evil-collection-mode-list '(package-menu package))
  ;; (add-to-list 'evil-collection-mode-list '(buff-menu "buff-menu"))
  ;; (add-to-list 'evil-collection-mode-list 'neotree)
  :config
  (evil-collection-init))

(use-package evil-visualstar
  :ensure t
  :config
  (global-evil-visualstar-mode))

(use-package evil-anzu
  :ensure t)

(use-package company
  :ensure t
  :delight
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (require 'color)
  (let ((bg (face-attribute 'default :background)))
	(custom-set-faces
	 `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
	 `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
	 `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
	 `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
	 `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))
  (general-define-key
   :keymaps 'company-active-map
   "C-n" 'company-select-next
   "C-p" 'company-select-previous)
  (setq company-idle-delay 0.1)
  )

(define-key evil-insert-state-map (kbd "C-n") 'company-select-next)
(define-key evil-insert-state-map (kbd "C-p") 'company-select-previous)

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode)
  (setq company-quickhelp-delay nil)
  (define-key company-active-map (kbd "M-h") 'company-quickhelp-manual-begin)
  )

(use-package rainbow-delimiters
  :ensure t
  :config
  :delight
  (rainbow-delimiters-mode))
 
(use-package drag-stuff
  :ensure t
  :config
  :delight
  (drag-stuff-global-mode 1))

(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (setq helm-buffers-fuzzy-matching t
		helm-M-x-fuzzy-match t
		helm-recentf-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-autoresize-max-height 30)
  (general-define-key
   :keymaps 'helm-map
   "C-j" 'helm-next-line
   "C-k" 'helm-previous-line
   "C-q" 'helm-delete-minibuffer-contents
   "<tab>" 'helm-execute-persistent-action
   "C-z" 'helm-select-action
  )
  (setq helm-swoop-pre-input-function
		(lambda () nil))
  )

(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "M-q" 'minibuffer-keyboard-quit
   "C-j" 'ivy-next-line
   "C-k" 'ivy-previous-line 
   "M-j" 'ivy-next-line
   "M-k" 'ivy-previous-line 
   "C-q" 'ivy-kill-line
   )
  )

(use-package counsel
  :ensure t
  :config
  (counsel-mode t)
  (setenv "FZF_DEFAULT_COMMAND"
		  (string-trim (shell-command-to-string ". ~/.zshrc; echo -n $FZF_DEFAULT_COMMAND")))
  )

(use-package swiper
  :ensure t
  :config
  (define-key swiper-map (kbd "M-q") 'minibuffer-keyboard-quit)
  (define-key swiper-map (kbd "M-r") 'swiper-query-replace))

(use-package neotree
  :ensure t
  :config
  (setq neo-theme 'icons)
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  )

(use-package delight
  :ensure t
  ;;TODO Needs some work
  :config
  (delight '(
			 (my-intercept-mode nil)
			 ))
  )

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
)

(use-package all-the-icons-dired
  :ensure t)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


(use-package helpful
  :ensure t
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (general-def 'normal helpful-mode-map
	"q" 'quit-window
	"<tab>" 'forward-button
	"<backtab>" 'backward-button
	"d" 'scroll-up-command
	"u" 'scroll-down-command
	"f" 'scroll-up-command
	"b" 'scroll-down-command
	"C-o" 'help-go-back
	"C-i" 'help-go-forward
	"?" 'describe-mode
	"r" 'help-follow
	)
  )


;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-map (kbd "C-C") 'abort-recursive-edit)
(define-key minibuffer-local-map (kbd "M-q") 'abort-recursive-edit)
(define-key evil-ex-completion-map (kbd "M-q") 'abort-recursive-edit)
(define-key evil-ex-completion-map (kbd "M-n") 'next-history-element)
(define-key evil-ex-completion-map (kbd "M-p") 'previous-history-element)
(define-key evil-ex-completion-map (kbd "C-n") 'next-history-element)
(define-key evil-ex-completion-map (kbd "C-p") 'previous-history-element)



(use-package general
  :ensure t)

(general-create-definer leader-def
  :states 'normal
  :prefix "SPC"
  :keymaps 'override
  ;; Kan være for invasive, må vurderes
  ;; Funker dog ikke for info-mode, f.eks, men er ikke farlig så lenge man kan quitte med q
  ;; Tror grunnen er at info remapper space, og override keymappen fungerer først og fremst
  ;; for å override evil.
)

(leader-def
  "f" 'counsel-fzf
  "e" 'revert-buffer-no-confirm
  "s" 'evil-write
  "r" 'eval-buffer
  "p" 'clipboard-yank
  "b" 'helm-mini
  "ha" 'helm-apropos
  )

;; Override evil
;; (general-def 'normal 'override
;;   "<C-tab>" 'evil-window-next
;;   "<C-S-iso-lefttab>" 'evil-window-prev
;;   "C-q" 'evil-window-delete
;;   "C-n" 'next-buffer
;;   "C-p" 'previous-buffer
;;   "C-S-n" 'make-frame-command
;;   "M-1" 'delete-other-windows
;;   "M-2" 'evil-window-split
;;   "M-3" 'evil-window-vsplit
;;   )

;; Override anything
;; C-Q og ting bundet i insert state av meg har tydeligvis fortsatt høyere prioritet
;; enn denne, men det er like greit så lenge disse tingene funker for normal state i
;; alle major modes som info, help, org osv.
(defvar my-intercept-mode-map (make-sparse-keymap)
  "Keymap for my-intercept-mode.")

(define-minor-mode my-intercept-mode
  "Global minor mode with highest precedence keybindings."
  :lighter " intercept"
  :init-value t
  :global t)

(general-def my-intercept-mode-map
  "C-q" 'evil-window-delete
  "C-n" 'next-buffer
  "C-p" 'previous-buffer
  "<C-tab>" 'evil-window-next 
  "<C-S-iso-lefttab>" 'evil-window-prev
  "C-S-n" 'make-frame-command
  "M-1" 'delete-other-windows
  "M-2" 'evil-window-split
  "M-3" 'evil-window-vsplit
  "<C-backspace>" 'switch-to-last-buffer
  "C-S-q" 'kill-this-buffer
  )

(my-intercept-mode)
(add-hook 'minibuffer-setup-hook (lambda () (my-intercept-mode -1)))
(add-hook 'minibuffer-exit-hook (lambda () (my-intercept-mode 1)))



(general-def
  "M-x" 'helm-M-x
)

(general-def 'motion
  "M-q" 'evil-normal-state
  "j" 'evil-next-visual-line
  "k" 'evil-previous-visual-line
  "L" 'evil-end-of-visual-line
  "H" 'evil-first-non-blank-of-visual-line
  "J" 'evil-forward-paragraph
  "K" 'evil-backward-paragraph
)

(general-def '(normal visual)
  "s" 'evil-search-forward
  "S" 'evil-search-backward
)

(general-def 'normal
  "H" 'mwim-beginning-of-code-or-line
  "M-w" 'evil-forward-word-begin
  "M-W" 'evil-forward-WORD-begin
  "M-B" 'evil-backward-WORD-begin
  "M-e" 'evil-forward-word-end
  "M-E" 'evil-forward-WORD-end
  "M-u" 'undo-tree-undo
  "M-U" 'undo-tree-redo
  "M-j" 'evil-next-visual-line
  "M-k" 'evil-previous-visual-line
  "M-h" 'evil-backward-char
  "M-l" 'evil-forward-char
  "M-L" 'evil-end-of-visual-line
  "M-H" 'evil-first-non-blank-of-visual-line

  "M-J" 'evil-join
  "M-K" 'newline
  "M-d" (kbd "yyp")
  "J" nil
  "U" 'undo-tree-redo
  "+" 'evil-repeat
  "\\" 'evil-ex-repeat
  "Q" (lambda () (interactive) (evil-execute-macro 1 "@q"))
  "ø" 'evil-ex
  "æ" 'helm-M-x
  "C-J" (kbd "4jzz")
  "C-K" (kbd "4kzz")
  "C-S-J" 'move-line-down
  "C-S-K" 'move-line-up
  "gj" 'move-line-down
  "gk" 'move-line-up
  "M-n" 'evil-paste-pop-next
  "M-p" 'evil-paste-pop
  "," 'goto-last-change
  ";" 'goto-last-change-reverse
  "<backspace>" (kbd "``")
  "C-n" 'next-buffer
  "C-p" 'previous-buffer
  "C-S-C" 'clipboard-kill-ring-save
  "C-S-V" 'clipboard-yank
  "go" 'insert-line-below
  "gO" 'insert-line-above
  "C-s" 'helm-swoop
)

(general-def 'visual
    "<" 'evil-shift-left-visual
    ">" 'evil-shift-right-visual
    "TAB" 'evil-shift-right-visual
    "<backtab>" 'evil-shift-left-visual
    "C-S-J" 'drag-stuff-down
    "C-S-K" 'drag-stuff-up
	"M-d" (kbd "yP")
)

(general-def 'insert
  "M-q" 'evil-normal-state
  "C-q" 'clear-line
  "C-d" 'delete-char
  ;; ikke funksjoner som finnes, må lages
  "C-S-C" 'clipboard-kill-ring-save
  "C-S-V" 'clipboard-yank
  "<C-backspace>" 'backward-kill-word
  "C-SPC" 'company-complete
)

;; Escape and do
(general-def '(insert visual)
  "M-u" (lambda () (interactive) (evil-normal-state) (undo-tree-undo))
  "M-U" (lambda () (interactive) (evil-normal-state) (undo-tree-redo))
  "M-o" 'evil-open-below
  "M-O" 'evil-open-above
  "M-j" (lambda () (interactive) (evil-normal-state) (evil-next-visual-line))
  "M-k" (lambda () (interactive) (evil-normal-state) (evil-previous-visual-line))
  "M-h" (lambda () (interactive) (evil-normal-state) (evil-backward-char))
  "M-l" (lambda () (interactive) (evil-normal-state) (evil-forward-char))
  ;; "M-J" (lambda () (interactive) (evil-normal-state) (evil-forward-paragraph))
  ;; "M-K" (lambda () (interactive) (evil-normal-state) (evil-backward-paragraph))
  "M-H" (lambda () (interactive) (evil-normal-state) (evil-first-non-blank-of-visual-line))
  "M-L" (lambda () (interactive) (evil-normal-state) (evil-end-of-visual-line))
  "M-w" (lambda () (interactive) (evil-normal-state) (evil-forward-word-begin))
  "M-W" (lambda () (interactive) (evil-normal-state) (evil-forward-WORD-begin))
  "M-b" (lambda () (interactive) (evil-normal-state) (evil-backward-word-begin))
  "M-B" (lambda () (interactive) (evil-normal-state) (evil-backward-WORD-begin))
  "M-e" (lambda () (interactive) (evil-normal-state) (evil-forward-word-end))
  "M-E" (lambda () (interactive) (evil-normal-state) (evil-forward-WORD-end))
)

(general-unbind '(normal)
  :with 'ignore
  "<M-backspace>"
  "RET"
)

(general-define-key
 :keymaps 'Info-mode-map
 "C-i" 'Info-history-forward
 "<tab>" 'Info-next-reference
 )

(set-frame-font "Fira Mono 11")

;; (load-theme 'zerodark t)
;; (zerodark-setup-modeline-format)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-spacegrey t)
(doom-themes-neotree-config)
(doom-themes-org-config)

(require 'solaire-mode)
(add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
(add-hook 'after-revert-hook #'turn-on-solaire-mode)
(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
;; To enable solaire-mode unconditionally for certain modes:
(add-hook 'ediff-prepare-buffer-hook #'solaire-mode)
;; Toggle denne for å se hva som funker best med forskjellige themes
;(solaire-mode-swap-bg)
;; Add if it fucks with modeline
(setq solaire-mode-remap-modeline nil)

(setq doom-neotree-file-icons 'simple)
(setq doom-neotree-project-size 1)
(setq doom-neotree-folder-size 1.05)
(setq doom-neotree-chevron-size 0.8)
(setq doom-neotree-line-spacing 2)
(setq doom-neotree-enable-variable-pitch t)


(require 'spaceline-config)
(spaceline-emacs-theme)
(setq spaceline-buffer-size-p nil)
(setq spaceline-minor-modes-p nil)
(setq spaceline-projectile-root-p t)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
(setq powerline-default-separator 'arrow-fade)
;; Not compatible with spaceline
;; (use-package minions
;;   :ensure t
;;   :config (minions-mode 1))

(add-to-list 'evil-emacs-state-modes 'inferior-python-mode)
