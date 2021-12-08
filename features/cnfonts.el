;;;  cnfont.el -*- lexical-binding: t; -*-

;; ---------------------------------------------------------
;; Chinese aligment
;; Oh, MyGod! 中文对齐了吗Example
;; ---------------------------------------------------------
;; https://github.com/tumashu/cnfonts
;; https://lists.gnu.org/archive/html/emacs-devel/2006-12/msg00285.html

;; (cnfonts-mode)


;; EXP:
;; if come into the error like "cannot open file cnfonts/v4/profile1.el",
;; you can use `cnfonts-regenerate-profile' to create it

;; EXP:
;; Please download fonts:
;;   - https://source.typekit.com/source-han-serif/cn/
;;   - https://github.com/adobe-fonts/source-han-serif/tree/release/
;;   - https://github.com/adobe-fonts/source-han-sans/tree/release/
;;   - https://www.jetbrains.com/lp/mono/#how-to-install
;;
;; direct download from:
;;   - https://github.com/adobe-fonts/source-han-sans/raw/release/Variable/OTC/SourceHanSans-VF.otf.ttc
;;   - https://github.com/adobe-fonts/source-han-serif/raw/release/Variable/OTC/SourceHanSerif-VF.otf.ttc
;;   - https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip

;; font config copied from cnfonts package
(defun hyouka/cnfonts ()

  (set-language-environment "UTF-8")

  ;; (if (display-graphic-p)
  ;;     (pcase system-type
  ;;       ('windows-nt (progn (set-face-attribute
  ;;                            'default nil
  ;;                            :font (font-spec :name "-outline-Consolas-bold-italic-normal-mono-*-*-*-*-c-*-iso10646-1"
  ;;                                             :weight 'normal
  ;;                                             :slant 'normal
  ;;                                             :size 10.0))
  ;;                           (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;                             (set-fontset-font
  ;;                              (frame-parameter nil 'font)
  ;;                              charset
  ;;                              (font-spec :name "-outline-微软雅黑-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
  ;;                                         :weight 'normal
  ;;                                         :slant 'normal
  ;;                                         :size 12.0)))))

  ;;       ('darwin (progn (set-face-attribute
  ;;                        'default nil
  ;;                        :font (font-spec :name "-*-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
  ;;                                         :weight 'normal
  ;;                                         :slant 'normal
  ;;                                         :size 12.5))
  ;;                       (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;                         (set-fontset-font
  ;;                          (frame-parameter nil 'font)
  ;;                          charset
  ;;                          (font-spec :name "-*-Hiragino Sans GB-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
  ;;                                     :weight 'normal
  ;;                                     :slant 'normal
  ;;                                     :size 15.0)))))

  ;;       (code (progn (cnfonts-mode)
  ;;                    (message "Unhandled system-type %S" code)))))

  (if (display-graphic-p)

      (set-face-attribute
       'default nil
       :font (font-spec :name "-outline-JetBrains Mono-bold-italic-normal-mono-*-*-*-*-c-*-iso10646-1"
                        :weight 'normal
                        :slant 'normal
                        :size 12.0))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font
       (frame-parameter nil 'font)
       charset
       (font-spec :name "-outline-Source Han Serif VF-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 16.0)))
    )

  )


(hyouka/cnfonts)


;; file ends here
