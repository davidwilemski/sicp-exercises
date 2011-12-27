; Exercise 1.6
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (book-sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (ex1-6-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (ex1-6-sqrt-iter (improve guess x)
                           x)))

(define (1-6-sqrt x)
  (ex1-6-sqrt-iter 1.0 x))

; Question:
; What happens when Alyssa attempts to use this
; to compute square roots? Explain.
;
; Answer:
; The result is an infinite loop because new-if is defined as a function.
; This means that both then-clause and else-clause will be evaluated
; before determining which branch to take because of the evaluation order.
