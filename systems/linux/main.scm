(define-module (systems linux main)
  #:use-module (ice-9 match)
  #:use-module (systems common base)
  #:use-module (systems common interactive))

(define ansible-config-file "systems/linux/ansible.cfg")
(define setup-playbook-file "systems/linux/playbook/setup.yml")

(define (setup!)
  (playbook! ansible-config-file setup-playbook-file))

(define (icon!)
  (let* ((home (getenv "HOME"))
         (icon (string-append home "/.local/share/icons/doom.png"))
         (desktop-file "/usr/share/applications/emacs.desktop")
         (sed-pattern (string-append "s|Icon=.*|Icon=" icon "|")))
    (system* "mkdir" "-p" (string-append home "/.local/share/icons"))
    (system* "wget"
             "https://raw.githubusercontent.com/eccentric-j/doom-icon/master/cute-doom/doom.png"
             "-O" icon)
    (system* "sudo" "sed" "-i" sed-pattern desktop-file)))

(define (editor!)
  (begin (doom!) (icon!)))

(define (install!)
  (match (->entity)
    ("doom" (editor!))))

(define (connect!)
  (match (->entity)
    ("github" (github!))))

(match (->command)
  ("setup" (setup!))
  ("install" (install!))
  ("connect" (connect!))
  ("ping" (ping! ansible-config-file))
  (_ (display "Command Not Found\n")))
