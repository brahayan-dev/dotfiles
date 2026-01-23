(define-module (systems common interactive)
  #:export (doom!
            github!
            cljfmt!))

(define (doom!)
  (let* ((home (getenv "HOME"))
         (emacs (string-append home "/.config/emacs"))
         (doom (string-append emacs "/bin/doom"))
         (repo (string-append "git clone --depth 1 https://github.com/doomemacs/doomemacs " emacs)))
    (system* "rm" "-rf" emacs)
    (system repo)
    (chdir emacs)
    (system* doom
             "install"
             "--no-config"
             "--install"
             "--color"
             "--force"
             "--env")))

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
