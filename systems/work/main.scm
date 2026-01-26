(define-module (systems work main)
  #:use-module (systems common command)
  #:use-module (systems common interactive)
  #:use-module (systems work internal))

(command (display "Command Not Found\n"))

(command 'refresh 'nu
         (nu!))
