;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
(setq doom-font (font-spec :family "Source Code Pro" :size 18 :weight 'semi-light)
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
(setq doom-theme 'doom-monokai-pro)

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

(use-package! rime
  :custom
  (default-input-method "rime")
  )

(add-to-list 'load-path "/home/jianan-xie/.emacs.d/site-lisp/emacs-application-framework")
(require 'eaf)
(require 'eaf-browser)


(require 'eaf-video-player)
(require 'eaf-music-player)
(require 'eaf-rss-reader)

(require 'eaf-terminal)
(require 'eaf-system-monitor)

(require 'eaf-pdf-viewer)
(require 'eaf-markdown-previewer)
(require 'eaf-org-previewer)
(require 'eaf-image-viewer)

(require 'eaf-file-manager)
(require 'eaf-file-browser)
(require 'eaf-file-sender)

(require 'eaf-mindmap)
(require 'eaf-jupyter)
(require 'eaf-camera)
(require 'eaf-airshare)

(require 'eaf-demo)
(require 'eaf-vue-demo)

    ;; Browser: Full-featured browser
    ;; PDF Viewer: The fastest PDF reader
    ;; Terminal: Full-featured terminal
    ;; Video Player: Video player base on Qt
    ;; Markdown Previewer: Markdown file previewer in Emacs
    ;; Org Previewer: Org file previewer in Emacs
    ;; Music Player: Music player, support playlist and an audio visualization
    ;; RSS Reader: RSS reader, rendering html content in expected
    ;; File Manager: File manager, support file real-time preview
    ;; Mindmap: Mindmap with full-featured keyboard operation
    ;; Jupyter: Jupyter in Emacs
    ;; Image Viewer: Picture viewer, supporting real-time zoom rotation
    ;; Camera: Use camera in Emacs
    ;; System Monitor: System monitor base on Vue.js
    ;; Netease Cloud Music: EAF frontend for NetEase cloud music
    ;; File Browser: Browse file in mobile phone
    ;; File Sender: Share file between Emacs and mobile phone
    ;; Airshare: Share text between Emacs and mobile phone
    ;; Demo: EAF Application demo base on Qt
    ;; Vue Demo: EAF Application demo base on Vue.js


(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)
  ) ;; unbind, see more in the Wiki

(global-set-key (kbd "M-Y") 'yank)

(defun vsplit-projectile-scratch ()
  (interactive)
  (+evil/window-vsplit-and-follow)
  (doom/switch-to-project-scratch-buffer)
  )

(map! :leader
      "hy" #'set-frame-font
      "w;" #'vsplit-projectile-scratch
      )
