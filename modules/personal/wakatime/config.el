;; https://github.com/wakatime/wakatime-mode

;; download wakatime-cli from:
(use-package! wakatime-mode
  ;; :commands cnfonts-mode
  :init
  (global-wakatime-mode)
  :config
  (setq wakatime-api-key "caead82a-2ebd-4328-8aed-8956b65e77a7")
  )
