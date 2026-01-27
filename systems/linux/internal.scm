(define-module (systems linux internal)
  #:use-module (systems common interactive)
  #:export (icon!
            clojure!))

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

(define (clojure!)
  (begin
    (system* "curl" "-L" "-O"
             "https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh")
    (system* "chmod" "+x" "linux-install.sh")
    (system* "sudo" "./linux-install.sh")))
