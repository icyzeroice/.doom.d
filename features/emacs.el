
;; (defun hyouka/unicode ()
;;         (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
;;         (set-language-environment 'utf-8)
;;         (set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
;;         (setq locale-coding-system 'utf-8)
;;         (set-default-coding-systems 'utf-8)
;;         (set-terminal-coding-system 'utf-8)
;;         (set-selection-coding-system
;;         (if (eq system-type 'windows-nt)
;;             ;; https://rufflewind.com/2014-07-20/pasting-unicode-in-emacs-on-windows
;;             'utf-16-le
;;           'utf-8))
;;         (prefer-coding-system 'utf-8))

;; (after! org
;;   (hyouka/unicode))

;; https://emacs-china.org/t/topic/4513
(setq system-time-locale "C")

;; file ends here
