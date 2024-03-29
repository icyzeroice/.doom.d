;;;  cnfont.el -*- lexical-binding: t; -*-

;; ---------------------------------------------------------
;; Chinese aligment
;; ABCDefghIJKLMNopqrstUVWXYZ
;; 一二三四五六七八九十十三字
;; ---------------------------------------------------------
;; https://github.com/tumashu/cnfonts
;; https://lists.gnu.org/archive/html/emacs-devel/2006-12/msg00285.html


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

;; https://github.com/tumashu/cnfonts
(use-package! cnfonts
  :defer t
  :init
  ;; Q: :init 是加载包后立刻执行，:config 在 :init 后执行，导致 cnfonts 先创建了 profile1
  ;;    并没有用上 :config 中用户自定义配置
  ;; (cnfonts-mode 1)
  ;; `cnfonts-set-font' 帮助我们应用当前字体大小配置
  ;; (cnfonts-set-font)

  :config
  (setq cnfonts-directory (concat doom-user-dir "modules/personal/fonts/cnfonts/")
        cnfonts-profiles '("adobe-jetbrains")
        cnfonts-use-system-type t
        cnfonts-personal-fontnames '(;; English Fontset
                                     ("JetBrains Mono" "Ubuntu Mono")
                                     ;; Chinese Fontset
                                     ("Source Han Sans VF" "Source Han Serif VF")))

  :hook (('after-make-frame-functions . cnfonts-mode) ('window-setup-hook . cnfonts-mode))
  )
