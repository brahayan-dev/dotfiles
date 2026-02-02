--[[(define-module (systems common interactive)
  #:use-module (ice-9 rdelim)
  #:export (github!
            cljfmt!
            ping!
            playbook!))

(define (github!)
  (let* ((home (getenv "HOME"))
         (user (getenv "USER"))
         (ssh-key-path (string-append home "/.ssh/" user "_rsa.pub"))
         (ssh-key-title (string-append user "-ssh")))
    (system* "git" "remote" "set-url" "origin" "git@github.com:brahayan-dev/dotfiles.git")
    (system* "gh" "auth" "login")
    (system* "gh" "auth" "refresh"
             "-h" "github.com"
             "-s" "admin:ssh_signing_key")
    (system* "gh" "ssh-key" "add"
             ssh-key-path
             "-t"
             ssh-key-title)))

(define (cljfmt!)
  (begin
    (system* "sudo" "mkdir" "-p" "/usr/local/bin")
    (system* "curl" "-fsSL"
             "-o" "/tmp/cljfmt-install.sh"
             "https://raw.githubusercontent.com/weavejester/cljfmt/HEAD/install.sh")
    (system* "/bin/bash" "/tmp/cljfmt-install.sh")))

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

]]
