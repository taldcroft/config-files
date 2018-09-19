;; From http://www.flycheck.org/en/latest/index.html
(require 'package)
(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; Do the “try Flycheck in your Emac session” instructions.
;; The (package-refresh-contents) is important for initial installation.

(setq frame-title-format '("" "%b"))
(setq icon-title-format '("" "%b"))

;; (set-scroll-bar-mode 'right)

(setq show-trailing-whitespace t)


;; Show trailing whitespace by default and allow for toggling
;; http://stackoverflow.com/questions/11700934/emacs-set-and-toggle-show-trailing-whitespace
(setq-default show-trailing-whitespace t)
(global-set-key "\M-ow" 'tf-toggle-show-trailing-whitespace)
(defun tf-toggle-show-trailing-whitespace ()
    "Toggle show-trailing-whitespace between t and nil"
    (interactive)
    (setq show-trailing-whitespace (not show-trailing-whitespace))
    (redraw-display))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "unknown" :family "Monaco"))))
 '(font-lock-string-face ((((class color) (background light)) (:foreground "VioletRed4"))))
 '(font-lock-variable-name-face ((((class color) (background light)) (:foreground "sienna"))))
 '(menu ((((type x-toolkit)) (:inherit variable-pitch :height 1.1))))
 '(tabbar-default ((t (:inherit variable-pitch :background "gray90" :foreground "gray25" :height 1.0)))))

(tool-bar-mode -1)

; http://amitp.blogspot.com/2007/04/emacs-buffer-tabs.html
(load-file "/Users/aldcroft/.xemacs/tabbar.el")
(tabbar-mode 1)

; show column number in mode line: http://homepages.inf.ed.ac.uk/s0243221/emacs/
(column-number-mode 1)

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
 '(spice-output-local "Gnucap")
 '(spice-simulator "Gnucap")
 '(spice-waveform-viewer "Gwave")
 '(tool-bar-mode nil))

;;; Python for Emacs setup
;;; E.g. http://jesselegg.com/archives/2010/02/25/emacs-python-programmers-part-1/

; (add-to-list 'load-path "~/.emacs.d/site-lisp/python-mode")
; (setq py-install-directory "~/.emacs.d/site-lisp/python-mode")
; (require 'python-mode)

; (require 'ipython)

; (add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))

(setq c-default-style "linux"
      c-basic-offset 4)

;;
;; Stuff from old .xemacs/init.el
;;

; Turn off annoying bell and tabs insertion!
(setq bell-inhibit-time 10000)
(setq visible-bell 'top-bottom)
(setq ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil)

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

(global-set-key  [f1]       'tags-search)
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
(setq-default fill-column 90)
(setq default-major-mode 'text-mode)

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
;(define-key esc-map "Ow" 'execute-extended-command)		; 7
(define-key esc-map "Ox" 'scroll-up)				; 8
(define-key esc-map "Oy" 'query-replace)			; 9
(define-key esc-map "Om" 'kill-word)				; _
(define-key esc-map "Ol" 'delete-char)				; ,
(define-key esc-map "On" 'set-mark-command)			; .
;
(global-unset-key "\e\e")

(global-set-key [mouse-6] 'backward-char)
(global-set-key [mouse-7] 'forward-char)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-hook 'python-mode-hook 'flycheck-mode)
