(define-module (systems macos main)
  #:use-module (ice-9 match)
  #:use-module (systems common base)
  #:use-module (systems common interactive))

(define ansible-config-file "systems/macos/ansible.cfg")
(define setup-playbook-file "systems/macos/playbook/setup.yml")

(define (setup!)
  (playbook! ansible-config-file setup-playbook-file))

(define (install!)
  (match (->entity)
    ["doom" (doom!)]
    ["cljfmt" (cljfmt!)]))

(define (connect!)
  (match (->entity)
    ["github" (github!)]))

(match (->command)
  ["setup" (setup!)]
  ["install" (install!)]
  ["connect" (connect!)]
  ["ping" (ping! ansible-config-file)]
  [_ (display "Command Not Found\n")])
