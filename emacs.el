;; -*- lexical-binding: t -*-

(defvar my-mode-map (make-sparse-keymap))

(define-minor-mode my-mode
 ""
 :global t
 :keymap my-mode-map
 :init-value t)

(add-to-list 'emulation-mode-map-alists `((my-mode . ,my-mode-map)))

(let (warned)
 (setq warned t)
 (define-key my-mode-map (kbd "C-c") (lambda () (interactive) (if warned (kill-emacs) (progn (setq warned t) (message "WARNING: file modified (once more to quit)") nil))))
 (add-hook 'before-change-functions (lambda (x y) (setq warned nil))))

(define-key my-mode-map (kbd "C-d") (lambda () (interactive) (call-process-region (region-beginning) (region-end) "xsel" 't nil nil "-bi")))
(define-key my-mode-map (kbd "C-y") (lambda () (interactive) (call-process "xsel" nil 't nil "-bo")))
(define-key my-mode-map (kbd "C-x") 'save-buffer)
(define-key my-mode-map (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "S-<left>") 'backward-word)
(global-set-key (kbd "S-<right>") 'forward-word)

(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

(define-key input-decode-map "\e[1~" [home])
(define-key input-decode-map "\e[4~" [end])

(set-face-background 'region "white")
(set-face-foreground 'region "black")

(define-key my-mode-map (kbd "M-|") (let ((current-prefix-arg '(4))) 'shell-command-on-region))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-level (quote interactive))
 '(column-number-mode t)
 '(delete-auto-save-files t)
 '(describe-char-unidata-list
   (quote
    (name old-name general-category bidi-class decomposition mirrored uppercase lowercase titlecase)))
 '(electric-indent-mode nil)
 '(font-lock-global-modes nil)
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(scroll-error-top-bottom t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tab-width 4)
 '(use-empty-active-region t)
 '(vc-follow-symlinks nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-catchall-clause-face ((t nil)))
 '(agda2-highlight-coinductive-constructor-face ((t nil)))
 '(agda2-highlight-coverage-problem-face ((t (:foreground "color-217"))))
 '(agda2-highlight-datatype-face ((t nil)))
 '(agda2-highlight-field-face ((t nil)))
 '(agda2-highlight-function-face ((t nil)))
 '(agda2-highlight-inductive-constructor-face ((t nil)))
 '(agda2-highlight-keyword-face ((t (:foreground "color-219"))))
 '(agda2-highlight-module-face ((t nil)))
 '(agda2-highlight-number-face ((t nil)))
 '(agda2-highlight-positivity-problem-face ((t (:foreground "color-217"))))
 '(agda2-highlight-postulate-face ((t nil)))
 '(agda2-highlight-primitive-face ((t nil)))
 '(agda2-highlight-primitive-type-face ((t nil)))
 '(agda2-highlight-record-face ((t nil)))
 '(agda2-highlight-string-face ((t (:foreground "color-40"))))
 '(agda2-highlight-symbol-face ((t (:foreground "color-219"))))
 '(agda2-highlight-termination-problem-face ((t (:foreground "color-217"))))
 '(agda2-highlight-unsolved-constraint-face ((t (:foreground "color-226"))))
 '(agda2-highlight-unsolved-meta-face ((t (:foreground "color-226")))))
