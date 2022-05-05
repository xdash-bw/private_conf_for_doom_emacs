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

(setq doom-font (font-spec :family "Fira Code" :weight 'bold :size 15))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

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


;; ------------------------------------------
;; global On/Off
;; ------------------------------------------
(setq evil-escape-key-sequence "fd")
(menu-bar-mode t)
(tool-bar-mode t)
(setq-hook! '(c-mode-hook c++-mode-hook) lsp-mode -1)  ; C/C++


;; ============================================================================================================
;; 定义 global Map
;; ============================================================================================================
(defun vsplit-scratch ()
  (interactive)
  (+evil/window-vsplit-and-follow)
  (doom/switch-to-scratch-buffer)
  )

(defun vsplit-project-scratch ()
  (interactive)
  (+evil/window-vsplit-and-follow)
  ;; (doom/switch-to-scratch-buffer)
  (doom/switch-to-project-scratch-buffer)
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

(global-set-key (kbd "C-c h") 'evil-window-left)
(global-set-key (kbd "C-c j") 'evil-window-down)
(global-set-key (kbd "C-c k") 'evil-window-up)
(global-set-key (kbd "C-c l") 'evil-window-right)

(global-set-key (kbd "C-M-Y") 'yank)

(global-set-key (kbd "M-H") nil)
(global-set-key (kbd "M-H") 'org-metaleft)
(global-set-key (kbd "M-l") 'org-metaright)

(global-set-key (kbd "C-1") 'doom/open-scratch-buffer)
(global-set-key (kbd "C-2") 'vsplit-scratch)
(global-set-key (kbd "C-3") 'persp-add-buffer)
(global-set-key (kbd "C-4") 'eaf-open-browser-with-history)
(global-set-key (kbd "C-5") 'eaf-open-browser)
(global-set-key (kbd "C-9") 'persp-switch-to-buffer)
;;------------------------------------------------------------
;; evil keymap
;;------------------------------------------------------------
(map! :leader
      "hy" #'set-frame-font
      "o1" #'org-overview
      "o2" #'org-show-children
      ;;---------------------------------------------
      ;; window operator
      ;;---------------------------------------------
      "w;" #'vsplit-scratch
      "w:" #'vsplit-project-scratch
      "w[" #'+evil/window-vsplit-and-follow
      ;;---------------------------------------------
      ;; other
      ;;---------------------------------------------
      "pI" #'projectile-ibuffer
      "hh" #'treemacs
      ;;---------------------------------------------
      ;; lsp
      ;;---------------------------------------------
      "ll" #'lsp
      )


;; ============================================================================================================
;; use package
;; ============================================================================================================
;;------------------------------------------------------------------
;; rime
;;------------------------------------------------------------------
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
     rime-predicate-after-ascii-char-p
     ;; 在中文字符且有空格之后
     rime-predicate-space-after-cc-p
     ;; 将要输入的为大写字母时
     rime-predicate-current-uppercase-letter-p
     ))
  )


;;------------------------------------------------------------------
;; youdao
;;------------------------------------------------------------------
(use-package! youdao-dictionary
  :config
  (with-eval-after-load 'evil
    (map! :leader
          ;;---------------------------------------------
          ;; other ui
          ;;---------------------------------------------
          "k1" #'youdao-dictionary-search-at-point+
          "k2" #'youdao-dictionary-search-at-point
          "k3" #'eaf-open-browser-with-history
          "k4" #'eaf-open-office
          )))


;;------------------------------------------------------------------
;; counsel-etags
;;------------------------------------------------------------------
(use-package! counsel-etags
  :config
  (with-eval-after-load 'evil
    (map! :leader
          ;;---------------------------------------------
          ;; counsel etags
          ;;---------------------------------------------
          "ke" #'counsel-etags-find-tag-at-point
          "kE" #'counsel-etags-find-tag
          "ks" #'counsel-etags-grep
          "kS" #'counsel-etags-grep-current-directory
          "ki" #'counsel-etags-list-tag-in-current-file
          "kI" #'counsel-etags-list-tag
          )))


;;------------------------------------------------------------------
;; counsel-gtags
;;------------------------------------------------------------------
(defun save-and-update-gtags ()
  (interactive)
  (save-buffer)
  (citre-global-update-database))

(use-package! counsel-gtags
  :config
  (counsel-gtags-mode t)

  (with-eval-after-load 'evil
    (map! :leader
          ;;---------------------------------------------
          ;; counsel gtags
          ;;---------------------------------------------
          ;; "k8" #'counsel-gtags-find-reference-other-window
          "fs" #'save-and-update-gtags
          "kc" #'counsel-gtags-create-tags
          "ku" #'citre-global-update-database
          "kd" #'counsel-gtags-find-definition
          "kD" #'counsel-gtags-find-definition-other-window
          "kg" #'counsel-gtags-find-reference
          "kG" #'counsel-gtags-find-reference-other-window
          "kf" #'counsel-gtags-find-file
          "kF" #'counsel-gtags-find-file-other-windw
          "k[" #'counsel-gtags-go-backward
          "k]" #'counsel-gtags-go-forward))

  (global-set-key (kbd "M-n") 'company-gtags))


;;------------------------------------------------------------------
;; centaur-tabs
;;------------------------------------------------------------------
(use-package! centaur-tabs
  ;; :ensure t
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-group-by-projectile-project)
  (with-eval-after-load 'evil
    (define-key evil-normal-state-map (kbd "M-[") 'centaur-tabs-backward-tab)
    (define-key evil-normal-state-map (kbd "M-]") 'centaur-tabs-forward-tab)
    (define-key evil-normal-state-map (kbd "M-{") 'centaur-tabs-move-current-tab-to-left)
    (define-key evil-normal-state-map (kbd "M-}") 'centaur-tabs-move-current-tab-to-right))
  (global-set-key (kbd "M-[") 'centaur-tabs-backward-tab)
  (global-set-key (kbd "M-]") 'centaur-tabs-forward-tab)
  (global-set-key (kbd "M-{") 'centaur-tabs-move-current-tab-to-left)
  (global-set-key (kbd "M-}") 'centaur-tabs-move-current-tab-to-right))


;;------------------------------------------------------------------
;; eaf
;;------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(require 'eaf-terminal)
(require 'eaf-image-viewer)
(require 'eaf-git)
(require 'eaf-file-manager)
(require 'eaf-file-sender)

(defun eaf-goto-left-tab ()
  (interactive)
  (centaur-tabs-backward-tab))

(defun eaf-goto-right-tab ()
  (interactive)
  (centaur-tabs-forward-tab))


(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework/"
  :custom
  ;; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up_page "C-f" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down_page "C-b" eaf-pdf-viewer-keybinding)
  (eaf-bind-key eaf-goto-left-tab "J" eaf-browser-keybinding)
  (eaf-bind-key eaf-goto-right-tab "K" eaf-browser-keybinding)
  (eaf-bind-key nil "M-Q" eaf-browser-keybinding)
  ) ;; unbind, see more in the Wiki

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
