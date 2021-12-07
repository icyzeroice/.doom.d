;;;  cnfont.el -*- lexical-binding: t; -*-

;; ---------------------------------------------------------
;; Chinese aligment
;; Oh, MyGod! 中文对齐了吗Example
;; ---------------------------------------------------------
;; https://github.com/tumashu/cnfonts
;; https://lists.gnu.org/archive/html/emacs-devel/2006-12/msg00285.html

;; (cnfonts-mode)

;; font config copied from cnfonts package
(defun hyouka/cnfonts ()

  (set-language-environment "UTF-8")

  (pcase system-type

    ('windows-nt (progn (set-face-attribute
                         'default nil
                         :font (font-spec :name "-outline-Consolas-bold-italic-normal-mono-*-*-*-*-c-*-iso10646-1"
                                          :weight 'normal
                                          :slant 'normal
                                          :size 10.0))
                        (dolist (charset '(kana han symbol cjk-misc bopomofo))
                          (set-fontset-font
                           (frame-parameter nil 'font)
                           charset
                           (font-spec :name "-outline-微软雅黑-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
                                      :weight 'normal
                                      :slant 'normal
                                      :size 12.0)))))

    ('darwin (progn (set-face-attribute
                     'default nil
                     :font (font-spec :name "-*-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                                      :weight 'normal
                                      :slant 'normal
                                      :size 12.5))
                    (dolist (charset '(kana han symbol cjk-misc bopomofo))
                      (set-fontset-font
                       (frame-parameter nil 'font)
                       charset
                       (font-spec :name "-*-Hiragino Sans GB-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
                                  :weight 'normal
                                  :slant 'normal
                                  :size 15.0)))))

    (code (progn (cnfonts-mode)
                 (message "Unhandled system-type %S" code)))))


(hyouka/cnfonts)


;; file ends here
