(define (square x) (* x x))

(define (sum-squares x y)
  (+ (square x) (square y)))

(define (sum-max-squares x y z)
  (cond ((and (>= x z) (>= y z)) 
         (sum-squares x y))
        ((and (>= x y) (>= z y)) 
         (sum-squares x z))
        ((and (>= y x) (>= z x)) 
         (sum-squares y z))
        (else 
         (sum-squares x y)))) ; they're all equal

; testing:
;> (sum-max-squares 0 1 1)
;2
;> (sum-max-squares 1 1 0)
;2
;> (sum-max-squares 1 0 1)
;2
;> (sum-max-squares 1 1 1)
;2