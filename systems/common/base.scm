(define-module (systems common base)
	#:use-module (ice-9 rdelim)
	#:export (->args
		  ->command
		  ->entity
		  ping!
		  playbook!))

(define ->args
  (compose cdr command-line))

(define (->command) (car (->args)))
(define (->entity) (cadr (->args)))

(define vault-file "systems/common/.vault")
(define become-file "systems/common/.become")
(define host-file "systems/common/hosts.ini")

(define (set-ansible-config file)
  (setenv "ANSIBLE_CONFIG" file))

(define (make-file file content)
  (call-with-output-file file
    (lambda (port)
      (display content port))))

(define (ensure-file file message)
  (unless (file-exists? file)
    (begin
      (display message)
      (force-output)
      (let ((password (read-line)))
	(make-file file password)))))

(define (ensure-vault-file) (ensure-file vault-file "Vault Password:\n"))
(define (ensure-become-file) (ensure-file become-file "Become Password:\n"))

(define (playbook! config-file playbook-file)
  (begin
    (ensure-vault-file)
    (ensure-become-file)
    (set-ansible-config config-file)
    (system* "ansible-playbook"
	     "-c" "local"
	     "-i" host-file
	     "--vault-password-file" vault-file
	     "--become-password-file" become-file
	     playbook-file)))

(define (ping! config-file)
  (begin
    (set-ansible-config config-file)
    (system* "ansible" "-i" host-file "Workstation" "-c" "local" "-m" "ping")))
