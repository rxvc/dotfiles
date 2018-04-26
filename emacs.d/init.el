(package-initialize)

(setq load-path
              (append
               (mapcar
                'expand-file-name
                '(
                  "~/.emacs.d/main"
                  )) load-path))

(require 'emacs-keys)
(require 'emacs-packages)
(require 'emacs-custom) 
(require 'emacs-vars)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Load monokai theme
(load-theme 'monokai t)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(add-to-list 'default-frame-alist '(height . 500))
(add-to-list 'default-frame-alist '(width . 270))

(require 'powerline)
(powerline-default-theme)