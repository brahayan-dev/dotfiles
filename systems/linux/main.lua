(define-module (systems linux main)
  #:use-module (systems common command)
  #:use-module (systems common interactive)
  #:use-module (systems linux internal))

(define ansible-config-file "systems/linux/ansible.cfg")
(define setup-playbook-file "systems/linux/playbook/setup.yml")

(command (display "Command Not Found\n"))

(command 'ping
         (ping! ansible-config-file))

(command 'setup
         (playbook! ansible-config-file setup-playbook-file))

(command 'change 'icon
         (icon!))

(command 'install 'cljfmt
         (cljfmt!))

(command 'install 'clojure
         (clojure!))

(command 'connect 'github
         (github!))
