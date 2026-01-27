(define-module (systems macos main)
  #:use-module (systems common command)
  #:use-module (systems common interactive))

(define ansible-config-file "systems/macos/ansible.cfg")
(define setup-playbook-file "systems/macos/playbook/setup.yml")

(command (display "Command Not Found\n"))

(command 'ping
         (ping! ansible-config-file))

(command 'setup
         (playbook! ansible-config-file setup-playbook-file))

(command 'install 'cljfmt
         (cljfmt!))

(command 'connect 'github
         (github!))
