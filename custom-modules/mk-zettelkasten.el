(crafted-package-install-package 'org-roam)

(customize-set-variable 'org-roam-directory "~/alexandria/org/roam")

(require 'org-roam)

(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
	(file-name-directory
	 (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))

  ;; Add org-roam-node-type to display-template
  (customize-set-variable 'org-roam-node-display-template
   (concat "${type:10} | ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

(customize-set-variable 'org-roam-capture-templates '(
						      ("p" "Permanent" plain
						       "%?"
						       :if-new (file+head "Permanent/${slug}.org"
									  "#+title: ${title}\n")
						       :immediate-finish t
						       :unnarrowed t)

						      ("l" "Literatur" plain
						       "%?"
						       :if-new (file+head "references/${slug}.org"
									  "#+title: ${title}\n")
						       :immediate-finish t
						       :unnarrowed t)))

(global-set-key (kbd "C-c n r f")  #'org-roam-node-find)
(global-set-key (kbd "C-c n r i") #'org-roam-node-insert)
(global-set-key (kbd "C-c n r t") #'org-roam-tag-add)
(global-set-key (kbd "C-c n r T") #'org-roam-tag-remove)
(global-set-key (kbd "C-c n r r") #'org-roam-ref-add)
(global-set-key (kbd "C-c n r R") #'org-roam-ref-remove)
(global-set-key (kbd "C-c n r n") #'org-roam-capture)

(provide 'mk-zettelkasten)
