(require 'mk-org)
(require 'mk-zettelkasten)
(require 'crafted-ui)
(require 'crafted-completion)
(require 'crafted-editing)
(require 'crafted-ide)
(require 'crafted-python)

(crafted-package-install-package 'sml-mode)

(crafted-package-install-package 'ace-window)
(global-set-key (kbd "M-o") #'ace-window)

(crafted-package-install-package 'magit)

;; Switch to modus theme
(progn
  (disable-theme 'deeper-blue)
  (load-theme 'modus-operandi t))
(customize-set-variable 'crafted-startup-inhibit-splash t)

(set-face-attribute 'default nil :family "JetBrains Mono" :height 110 :weight 'regular)
(set-face-attribute 'fixed-pitch nil :family "JetBrains Mono" :height 110 :weight 'medium)
(set-face-attribute 'variable-pitch nil :family "JetBrains Mono" :height 110 :weight 'medium)
