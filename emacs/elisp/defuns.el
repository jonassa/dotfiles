(provide 'defuns)

(defun my-command-error-function (data context caller)
  "Ignore the buffer-read-only, beginning-of-buffer,
end-of-buffer signals; pass the rest to the default handler."
  (when (not (memq (car data) '(buffer-read-only
                                beginning-of-buffer
                                end-of-buffer
				text-read-only)))
    (command-error-default-function data context caller)))

(setq command-error-function #'my-command-error-function)

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t)
  (message "Buffer reverted"))

(defun clear-line ()
  "Clear line, preserving newline and autoindent"
  (interactive)
  (kill-whole-line 0)
  (indent-relative))

(defun evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun insert-line-below ()
  "Insert an empty line below the cursor"
  (interactive)
  (evil-open-below 1)
  (evil-normal-state))

(defun insert-line-above ()
  "Insert an empty line above the cursor"
  (interactive)
  (evil-open-above 1)
  (evil-normal-state))

(defun switch-to-last-buffer ()
  (interactive)
  (switch-to-buffer nil))

(defun switch-theme (theme)
  ;; This interactive call is taken from `load-theme'
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes))))))
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme theme t))
