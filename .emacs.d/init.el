(add-to-list 'load-path "~/.emacs.d/")

;(require 'ws-trim)
;(global-ws-trim-mode t)

(setq frame-title-format '("" "%b"))
(setq icon-title-format '("" "%b"))

; show column number in mode line: http://homepages.inf.ed.ac.uk/s0243221/emacs/
(column-number-mode 1)
(setq-default fill-column 79)

(when (eq system-type 'darwin)

      ;; default Latin font (e.g. Consolas)
      (set-face-attribute 'default nil :family "Monaco")

      ;; default font size (point * 10)
      ;;
      ;; WARNING!  Depending on the default font,
      ;; if the size is not supported very well, the frame will be clipped
      ;; so that the beginning of the buffer may not be visible correctly. 
      (set-face-attribute 'default nil :height 140)
      )

; Color theme http://www.emacswiki.org/emacs/ColorTheme
; (add-to-list 'load-path "~/.emacs.d/site-lisp")
; (require 'color-theme)
; (require 'color-theme-solarized)
; (setq color-theme-is-global t)
; (when window-system (color-theme-solarized-dark))
; (global-set-key "\M-od" 'color-theme-solarized-dark)
; (global-set-key "\M-o;" 'color-theme-solarized-light)

; (set-face-font 'menu "-*-fixed-medium-r-*-*-*-120-*-*-*-*-iso8859-*")
; fixed 7x15 = -*-fixed-medium-r-*-*-*-140-*-*-*-*-iso8859-*
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(tool-bar-mode nil)
 )

(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :background "gray90" :foreground "gray25" :height 1.0 :family "Liberation Mono")))))

(setq c-default-style "linux"
      c-basic-offset 4)

(load-library "tabbar")
(tabbar-mode 1)

; Turn off annoying bell and tabs insertion!
(setq bell-inhibit-time 10000)
(setq visible-bell 'top-bottom)
(setq ring-bell-function 'ignore)

; Matlab setup
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)

; Python setup from
; http://astropy.readthedocs.org/en/latest/development/codeguide_emacs.html?highlight=emacs
(setq-default indent-tabs-mode nil)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'indent-tabs-mode nil))))


;; Setup for Flymake code checking.
(require 'flymake)
(load-library "flymake-cursor")

;; Script that flymake uses to check code. This script must be
;; present in the system path.
(setq pycodechecker "pychecker")

(when (load "flymake" t)
  (defun flymake-pycodecheck-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list pycodechecker (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pycodecheck-init)))

(add-hook 'python-mode-hook 'flymake-mode)

(autoload 'forth-mode "gforth.el")
(autoload 'forth-block-mode "gforth.el")
(add-to-list 'auto-mode-alist '("\\.4th$" . forth-mode))

; Fix a dos file
(defun dos-to-unix ()
  (interactive)
  (beginning-of-buffer)
  (replace-string "\r\n" "\n"))

; Fix a mac file
(defun mac-to-unix ()
  (interactive)
  (beginning-of-buffer)
  (replace-string "\r" "\n"))

(global-set-key  [f1]   'tags-search)    
(global-set-key  [f2]   'tags-loop-continue) 
(global-set-key  [f3]   'tags-query-replace) 
(global-set-key  [f6]   'query-replace)      

(setq default-major-mode 'text-mode)
(setq tex-mode-hook 'turn-on-auto-fill)
(setq html-mode-hook 'turn-on-auto-fill)
(setq require-final-newline 1)

; Some of my personal keys
(global-set-key "\M-oo" 'open-rectangle)
(global-set-key "\M-oy" 'yank-rectangle)
(global-set-key "\M-ok" 'kill-rectangle)
(global-set-key "\M-os" 'string-rectangle)
(global-set-key "\M-of" 'flymake-mode)
(global-set-key "\C-x\C-l" 'goto-line)
(global-set-key "\C-t" 'isearch-forward)
(global-set-key "\C-u" 'replace-regexp)
(setq search-repeat-char 19)
(global-set-key "\C-xr" 'replace-string)
(fset 'up-open
   "xbeginning-of-linexopen-line")
(global-set-key "\C-o" 'up-open)

(put 'narrow-to-region 'disabled nil)
(setq auto-mode-alist (append auto-mode-alist '(("\\.F$" . fortran-mode))))
(setq auto-mode-alist (append auto-mode-alist '(("\\.for$" . fortran-mode))))
(setq auto-mode-alist (append auto-mode-alist '(("\\.pm$" . perl-mode))))
(setq auto-mode-alist (append auto-mode-alist '(("\\.pyx$" . python-mode))))

(setq fortran-comment-indent-style nil)

(setq scroll-step 1)
(setq auto-save-default t)
(setq auto-save-interval 250)
(setq inhibit-startup-message t)
(setq delete-auto-save-files t)
(setq-default fill-column 79)
(setq default-major-mode 'text-mode)
;


(define-key esc-map "og" 'goto-line)
(define-key esc-map "ol" 'what-line)

;
;
;     keypad definition
;
(define-key esc-map "OQ" 'describe-key-briefly)			; PF2
(define-key esc-map "OR" 'isearch-forward)			; PF3
(define-key esc-map "OS" 'kill-line)				; PF4
(define-key esc-map "Op" 'next-line)				; 0
(define-key esc-map "Oq" 'forward-word)				; 1
(define-key esc-map "Or" 'end-of-line)				; 2
(define-key esc-map "Os" 'forward-char)				; 3
(define-key esc-map "Ot" 'end-of-buffer)			; 4
(define-key esc-map "Ou" 'beginning-of-buffer)			; 5
(define-key esc-map "Ov" 'kill-region)				; 6
(define-key esc-map "Ox" 'scroll-up)				; 8
(define-key esc-map "Oy" 'query-replace)			; 9
(define-key esc-map "Om" 'kill-word)				; _
(define-key esc-map "Ol" 'delete-char)				; ,
(define-key esc-map "On" 'set-mark-command)			; .
;
(global-unset-key "\e\e")
;
(put 'downcase-region 'disabled nil)
