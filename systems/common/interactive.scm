(define-module (systems common interactive)
       #:export (doom!))

(define (doom!)
  (let* ((home (getenv "HOME"))
         (emacs (string-append home "/.config/emacs"))
         (doom  (string-append emacs "/bin/doom"))
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
