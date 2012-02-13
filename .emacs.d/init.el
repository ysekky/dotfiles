; load path
(let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
 (add-to-list 'load-path default-directory)
 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
     (normal-top-level-add-subdirs-to-load-path)))


; 言語を日本語にする
(set-language-environment 'Japanese)
; uft-8 に
(prefer-coding-system 'utf-8)

; font
(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlomarugo")
(set-fontset-font "fontset-menlomarugo" 
		  'unicode
                  (font-spec :family "Hiragino Maru Gothic ProN" :size 16)
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-menlomaruugo"))

; auto_install 

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/lisp/")
;(add-to-list 'load-path auto-install-directory)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
;(setq ediff-window-setup-function 'ediff-setup-windows-plain)

; init-loader 分割
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits/") ; 設定ファイルがあるディレクトリを指定
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-hook 'php-mode-hook
         (lambda ()
             (require 'php-completion)
             (php-completion-mode t)
             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
             (when (require 'auto-complete nil t)
             (make-variable-buffer-local 'ac-sources)
             (add-to-list 'ac-sources 'ac-source-php-completion)
             (auto-complete-mode t))))


;;use cperl mode
(defalias 'perl-mode 'cperl-mode)

;; perl-completion
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
            (perl-completion-mode t)))

(add-hook  'cperl-mode-hook
           (lambda ()
             (when (require 'auto-complete nil t) ; no error whatever auto-complete.el is not installed.
               (auto-complete-mode t)
               (make-variable-buffer-local 'ac-sources)
               (setq ac-sources
                     '(ac-source-perl-completion)))))

;;Color
(if window-system (progn
		    (setq initial-frame-alist '((width . 1850) (height . 55)))
		    (set-background-color "Black")
		    (set-foreground-color "LightGray")
		    (set-cursor-color "Gray")
		    (set-frame-parameter nil 'alpha 90)
		    ))

;;mac key
(setq mac-option-modifier 'meta)

(require 'ido)
(ido-mode t)
;;Rinari
(add-to-list 'load-path "~/.emacs.d/elisp/rinari")
(require 'rinari)

(add-to-list 'load-path "~/.emacs.d/elisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
	  (lambda () (rinari launch)))


;;scss mode
(autoload 'scss-mode "scss-mode")
(setq scss-compile-at-save nil) ;; 自動コンパイルをオフにする
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;;yml mode

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
