;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "xdash-bw"
      user-mail-address "xdashproject@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Hack" :size 15)
     ;; doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13)
     )
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-operandi)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ============================================================================================================
;; 定义 global Map
;; ============================================================================================================

(defun vsplit-scratch ()
  (interactive)
  (+evil/window-vsplit-and-follow)
  (doom/switch-to-scratch-buffer)
  )

(global-set-key (kbd "M-H") nil)
(global-set-key (kbd "M-J") nil)
(global-set-key (kbd "M-K") nil)
(global-set-key (kbd "M-L") nil)
(global-set-key (kbd "C-1") nil)
(global-set-key (kbd "C-2") nil)
(global-set-key (kbd "C-3") nil)
(global-set-key (kbd "C-4") nil)
(global-set-key (kbd "C-5") nil)
(global-set-key (kbd "C-6") nil)
(global-set-key (kbd "C-7") nil)
(global-set-key (kbd "C-8") nil)
(global-set-key (kbd "C-9") nil)
(global-set-key (kbd "C-0") nil)
(global-set-key (kbd "M-Y") nil)
(global-set-key (kbd "M-N") nil)
(global-set-key (kbd "M-)") nil)

(global-set-key (kbd "M-q") nil)
(define-prefix-command 'ring-map)
(global-set-key (kbd "M-q") 'ring-map)
(global-set-key (kbd "M-q h") 'evil-window-left)
(global-set-key (kbd "M-q j") 'evil-window-down)
(global-set-key (kbd "M-q k") 'evil-window-up)
(global-set-key (kbd "M-q l") 'evil-window-right)

(global-set-key (kbd "C-c h") 'evil-window-left)
(global-set-key (kbd "C-c j") 'evil-window-down)
(global-set-key (kbd "C-c k") 'evil-window-up)
(global-set-key (kbd "C-c l") 'evil-window-right)

(global-set-key (kbd "M-Y") 'yank)



(global-set-key (kbd "C-`") 'doom/open-scratch-buffer)
(global-set-key (kbd "C-1") (kbd "<C-backspace>"))
(global-set-key (kbd "C-2") 'vsplit-scratch)
(global-set-key (kbd "C-3") 'persp-add-buffer)
(global-set-key (kbd "C-4") 'eaf-open-browser-with-history)
(global-set-key (kbd "C-5") 'eaf-restart-process)
(global-set-key (kbd "C-0") 'evil-window-delete)

(global-set-key (kbd "C-9") 'persp-switch-to-buffer)

;; (global-set-key (kbd "C-w") nil)
;; (global-set-key (kbd "<backspace>") 'fuckyou)


(map! :leader
      "hy" #'set-frame-font
      "w;" #'vsplit-scratch
      "k1" #'youdao-dictionary-search-at-point+
      "k2" #'youdao-dictionary-search-at-point
      "k3" #'eaf-open-browser-with-history
      "k4" #'eaf-open-office
      "w[" #'+evil/window-vsplit-and-follow

      "kd" #'counsel-etags-find-tag-at-point
      "ks" #'counsel-etags-grep
      "ki" #'counsel-etags-list-tag-in-current-file
      "kI" #'counsel-etags-list-tag

      "pI" #'projectile-ibuffer
      )


;; ============================================================================================================
;; 开始加载 package
;; ============================================================================================================

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-disable-predicates
   '(
     ;;
     rime-predicate-evil-mode-p
     rime-predicate-prog-in-code-p
     ;; 任意符号开头
     rime-predicate-punctuation-line-begin-p
     ;; 在英文字符串之后（必须为以字母开头的英文字符串）
     rime-predicate-after-alphabet-char-p
     ;; 任意英文字符后
     ;; rime-predicate-after-ascii-char-p
     ;; 在中文字符且有空格之后
     rime-predicate-space-after-cc-p
     ;; 将要输入的为大写字母时
     rime-predicate-current-uppercase-letter-p
     ))
  )

;; (add-to-list 'load-path "/home/jianan-xie/.emacs.d/site-lisp/emacs-application-framework")
;; (require 'eaf)
;; (require 'eaf-image-viewer)
;; ;; (require 'eaf-mermaid)
;; (require 'eaf-terminal)
;; (require 'eaf-file-manager)
;; (require 'eaf-camera)
;; (require 'eaf-airshare)
;; (require 'eaf-music-player)
;; (require 'eaf-vue-demo)
;; (require 'eaf-rss-reader)
;; (require 'eaf-git)
;; (require 'eaf-demo)
;; (require 'eaf-system-monitor)
;; (require 'eaf-netease-cloud-music)
;; (require 'eaf-mindmap)
;; (require 'eaf-org-previewer)
;; (require 'eaf-file-sender)
;; (require 'eaf-pdf-viewer)
;; (require 'eaf-jupyter)
;; (require 'eaf-markdown-previewer)
;; (require 'eaf-file-browser)
;; (require 'eaf-video-player)
;; (require 'eaf-browser)

;; (use-package! eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
;;   :custom
;;   ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;; (setq eaf-enable-debug t)
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   (browse-url-browser-function 'eaf-open-browser)
;;   :config
;;   (defalias 'browse-web #'eaf-open-browser)
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key nil "M-q" eaf-browser-keybinding)
;;   ) ;; unbind, see more in the Wiki

(eval-after-load "evil"
  '(progn
     (defvar last-focus-buffer nil
       "Buffer currently in focus.")

     (defun buffer-focus-handler ()
       (interactive)
       (when (not (buffer-live-p last-focus-buffer))
         (setq last-focus-buffer nil))
       (when (and (eq (window-buffer (selected-window))
                      (current-buffer))
                  (not (eq last-focus-buffer (current-buffer))))
         (setq last-focus-buffer (current-buffer))
         (when (derived-mode-p 'eaf-mode)
           (evil-insert-state))))

     (defun eaf-other-histoy-other-window ()
       (interactive)
       (+evil/window-vsplit-and-follow)
       (eaf-open-browser-with-history)
       )


     (add-hook 'buffer-list-update-hook #'buffer-focus-handler)))

;;; 具体参考 mode-line-mule-info 默认值，其中可能有其它有用信息
(setq mode-line-mule-info '((:eval (rime-lighter))))

(use-package! youdao-dictionary)

(use-package! counsel-etags)



(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(require 'eaf-terminal)
(require 'eaf-image-viewer)
(require 'eaf-git)
(require 'eaf-file-manager)
(require 'eaf-file-sender)

(use-package! eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  ;; (setq eaf-enable-debug t)
  (setq eaf-browser-enable-autofill t)
  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up_page "C-f" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down_page "C-b" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)
  ) ;; unbind, see more in the Wiki



;; lsp and gtags and ctags
(map! :leader
      "ll" #'lsp
      )


;; (use-package! lsp-jedi
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;   (add-to-list 'lsp-disabled-clients 'pyls)
;;   (add-to-list 'lsp-enabled-clients 'jedi)))

;; (setq lsp-jedi-executable-command "/home/jianan-xie/.local/bin/jedi-language-server")

;; (use-package! native-complete
;;   :ensure t
;;   ()
;;   )
