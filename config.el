;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "icyzeroice"
      user-mail-address "ziv3@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org-mode-base/")

;; https://github.com/hlissner/doom-emacs/issues/2913
(after! org
  (setq org-startup-folded t)
  (setq org-todo-keywords '((sequence "IDEA(i)" "TODO(t)" "BUSY(b)" "WAIT(w)" "PUSH(p)" "|" "DONE(d)" "KILL(k)")))
  (setq org-log-into-drawer "LOGBOOK")
  ;; https://orgmode.org/manual/Attachment-options.html#Attachment-options
  (setq org-attach-dir-relative t)
  (setq org-attach-preferred-new-method 'dir)
  ;; https://emacs-china.org/t/emacs/15765/7
  ;; org-export-with-tags nil
  )

;; >>> [org-roam] >>>
(setq org-roam-directory (concat org-directory "roam/"))
(setq org-roam-dailies-directory "journal/")
;; (setq org-roam-v2-ack t)

;; org-roam-capture-templates
;; https://org-roam.discourse.group/t/why-omit-the-timestamp-in-ref-note-filenames/1125/2
;; org-roam-capture-ref-templates '(("r" "ref" plain "%?" :if-new
;;                                   (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;                                   :unnarrowed t))

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Time-Parsing.html
;; 之前这样写，虽然 org-roam 正常，但是 org-journal 不能工作
;; (setq org-roam-dailies-capture-templates
;;       '(("d" "default" entry
;;          "* %?"
;;          :target (file+head "%<%Y-%m-%d-%V-%u>.org"
;;                             "#+title: %<(%V/52) %Y %B %d, %A>\n"))))

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))


;; >>> org mode more settings >>>
(setq org-agenda-files (list (concat org-directory "agenda/")
                     (concat org-roam-directory "journal/")))


;; https://stackoverflow.com/questions/3973896/emacs-org-mode-file-viewer-associations
(add-hook 'org-mode-hook
      '(lambda ()
             (setq org-file-apps
                   (append '(
                             ("\\.png\\'" . default)
                             ) org-file-apps ))))


;; >>> org mode enhanced plugins >>>
(setq org-download-method 'attach)
(setq org-journal-dir (concat org-roam-directory "journal/"))
(setq org-journal-file-format "%Y-%m-%d.org")
;; (setq org-journal-file-format "%Y-%m-%d-%V-%u.org")
(setq org-journal-date-prefix "#+title: ")
;; (setq org-journal-date-prefix "#+title: ")
(setq org-journal-date-format "%Y-%m-%d")
;; (setq org-journal-date-format "(%V/52) %Y %B %d, %A")
(setq org-journal-time-prefix "* ")
;; (setq org-journal-time-prefix "* ")
;; (setq org-journal-time-format "")
;; <<< [org-roam] <<<

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq ispell-dictionary "american")
(setq rmh-elfeed-org-files (list (concat org-roam-directory "elfeed.org")))

;; ---------------------------------------------------------
;; Plant UML
;; ---------------------------------------------------------
(setq plantuml-default-exec-mode 'jar)

(setq emojify-emoji-set "twemoji-v14")


(load! "features/emacs")

;; file ends here
