(define-module (systems work main)
  #:use-module (systems common command)
  #:use-module (systems common interactive)
  #:use-module (systems work internal))

(define ansible-config-file "systems/work/ansible.cfg")
(define setup-playbook-file "systems/work/playbook/setup.yml")

(command (display "Command Not Found\n"))

(command 'ping
         (ping! ansible-config-file))

(command 'setup
         (playbook! ansible-config-file setup-playbook-file))

(command (display "Command Not Found\n"))

(command 'refresh 'nu
         (nu!))
