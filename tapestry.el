;;; tapestry.el --- description -*- lexical-binding: t; -*-

(require 'json)

(defun tapestry--start-server ()
(interactive)
(start-process "ssb-server" "ssb-server-buffer" "sbot" "server"))

(defun tapestry--stop-server ()
  (interactive)
  (process-send-eof "ssb-server")
(kill-buffer "ssb-server-buffer"))

(defun tapestry-publish (text)
  ; publish a message
  (shell-command-to-string
(concat "sbot publish --type post --text \"" text "\"")))

(defun tapestry-quick-message (message)
  ; Create a quick message from the minibuffer.  No use of RET, /n only.
  (interactive "sMessage: " )
(tapestry-publish message))

(provide 'tapestry)
;;; tapestry.el ends here
