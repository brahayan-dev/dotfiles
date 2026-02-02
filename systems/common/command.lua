(define-module (systems common command)
  #:use-module (ice-9 rdelim)
  #:export (command))

(define ->args
  (compose cdr command-line))

(define (entity? e)
  (let ([args (->args)]
        [e- (symbol->string e)])
    (and [not (null? args)]
         [not (null? (list-tail args 1))]
         [equal? e- (cadr args)])))

(define (action? a)
  (let ([args (->args)]
        [a- (symbol->string a)])
    (and [not (null? args)]
         [equal? a- (car args)])))

(define-syntax command
  (syntax-rules []
    [(_ p)
     (and (null? (->args)) p)]
    [(_ a p)
     (and (action? a) p)]
    [(_ a e p)
     (and (action? a) (entity? e) p)]))
