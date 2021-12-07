
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

;; For WSL2 using proxy
;; https://github.com/syl20bnr/spacemacs/issues/8984#issuecomment-321307979
(pcase system-type
('gnu/linux (progn (when (string-match "microsoft" (shell-command-to-string "uname -a"))
  (setq url-proxy-services
        (cons `("http"  . ,(concat (getenv "window_host") ":10809"))
              `(("https" . ,(concat (getenv "window_host") ":10809")))))))))

;; China elpa repos mirror
;; URL `http://elpa.emacs-china.org/'
;; URL `https://mirror.tuna.tsinghua.edu.cn/help/elpa/'
(setq configuration-layer-elpa-archives
'(("melpa-cn"             . "https://elpa.emacs-china.org/melpa/")
  ("org-cn"               . "https://elpa.emacs-china.org/org/")
  ("gnu-cn"               . "https://elpa.emacs-china.org/gnu/")
  ("marmalade-cn"         . "https://elpa.emacs-china.org/marmalade/")
  ("sunrise-commander-cn" . "https://elpa.emacs-china.org/sunrise-commander/")
  ("user42"               . "https://elpa.emacs-china.org/user42/")
  ("nongnu"               . "https://elpa.nongnu.org/nongnu/")))


;; ---------------------------------------------------------
;; Enable below code while in mac os.
;; More detail please refer to
;; http://0x100.club/wiki_emacs/mac-org-mode-output-pdf.html
;; ---------------------------------------------------------
(pcase system-type
  ('darwin (progn
              (setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2019/bin/x86_64-darwin/"))
              (setq exec-path (append exec-path '("/usr/local/texlive/2019/bin/x86_64-darwin/")))
              (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f"))

              ;; https://github.com/d12frosted/homebrew-emacs-plus#no-titlebar
              (setq frame-resize-pixelwise t)))

  ;; https://hungyi.net/posts/browse-emacs-urls-wsl/
  ;; https://www.reddit.com/r/bashonubuntuonwindows/comments/70i8aa/making_emacs_on_wsl_open_links_in_windows_web/
  ('gnu/linux (progn (when (string-match "microsoft" (shell-command-to-string "uname -a"))
                       ;; Try 1:
                       (setq browse-url-generic-program "/mnt/c/Windows/System32/cmd.exe"
                             browse-url-generic-args '("/c" "start" "")
                             browse-url-browser-function 'browse-url-generic)
                       ;; Try 2: https://stackoverflow.com/questions/25261200/no-usable-browser-found-error-when-using-emacs-to-browse-hyperspec/25261294
                       ;; (setq browse-url-generic-program
                       ;;       (executable-find (getenv "BROWSER"))
                       ;;       browse-url-browser-function 'browse-url-generic)
                       ))))


;; file ends here
