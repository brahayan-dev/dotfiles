(define-module (systems work main)
  #:use-module (ice-9 match)
  #:use-module (systems common base)
  #:use-module (systems common interactive))

(define (nu-update-proj)
  (begin
    (system* "nu" "proj" "update" "cljdev")
    (system* "nu" "proj" "update" "nudev")
    (system* "nu" "proj" "update" "nucli")))

(define (nu-dev-bd)
  (system* "nu" "dev" "bd" "--countries" "br,mx,co"))

(define (nu-creds-br)
  (system* "nu" "aws" "shared-role-credentials" "refresh"
           "--account-alias" "br-staging"))

(define (nu-certs)
  (begin
    (system* "nu-co" "certs" "setup" "--env" "prod")
    (system* "nu-co" "certs" "setup" "--env" "staging")
    (system* "nu-ist" "certs" "setup" "--env" "prod")
    (system* "nu-ist" "certs" "setup" "--env" "staging")
    (system* "nu-mx" "certs" "setup" "--env" "prod")
    (system* "nu-mx" "certs" "setup" "--env" "staging")))

(define (nu-jwt-co)
  (begin
    (system* "nu-co" "auth" "jwt" "--env" "prod")
    (system* "nu-co" "auth" "jwt" "--env" "staging")))

(define (nu-tokens-stg)
  (begin
    (system* "nu-co" "auth" "get-refresh-token" "--env" "staging" "--force")
    (system* "nu-ist" "auth" "get-refresh-token" "--env" "staging" "--force")
    (system* "nu-mx" "auth" "get-refresh-token" "--env" "staging" "--force")
    (system* "nu-co" "auth" "get-access-token" "--env" "staging")
    (system* "nu-ist" "auth" "get-access-token" "--env" "staging")
    (system* "nu-mx" "auth" "get-access-token" "--env" "staging")))

(define (nu!)
  (begin
    (nu-update-proj)
    (nu-dev-bd)
    (nu-creds-br)
    (nu-certs)
    (nu-jwt-co)
    (nu-tokens-stg)))

(define (refresh!)
  (match (->entity)
    ["nu" (nu!)]))

(match (->command)
  ["refresh" (refresh!)]
  [_ (display "Command Not Found\n")])
