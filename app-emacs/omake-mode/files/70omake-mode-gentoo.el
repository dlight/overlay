
;;; lua-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'omake-mode "omake-mode" "Mode for editing OMake files" t)
(setq auto-mode-alist
      (append '(("^OMakefile$" . omake-mode))
	      '(("^OMakeroot$" . omake-mode))
              auto-mode-alist))
