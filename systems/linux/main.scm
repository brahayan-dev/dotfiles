(define-module (systems linux main)
	#:use-module (ice-9 match)
	#:use-module (systems common base)
	#:use-module (systems common interactive))

(define ansible-config-file "systems/linux/ansible.cfg")
(define setup-playbook-file "systems/linux/playbook/setup.yml")

(define (setup!)
  (playbook! ansible-config-file setup-playbook-file))

(define (install!)
  (match package
	 ("doom" (doom!))))

(match command
       ("setup" (setup!))
       ("install" (install!))
       ("ping" (ping! ansible-config-file))
       (_ (display "Command Not Found\n")))
