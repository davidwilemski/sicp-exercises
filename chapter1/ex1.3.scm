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
        ((and (>= z y) (>= x y)) 
         (sum-squares z x))
        (else 
         (sum-squares x y)))) ; they're all equal