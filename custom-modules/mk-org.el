(require 'crafted-org)

(customize-set-variable 'org-log-into-drawer t)
(add-hook 'org-mode-hook #'org-indent-mode)

(provide 'mk-org)
