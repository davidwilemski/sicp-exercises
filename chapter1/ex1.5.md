# exercise 1.5
Explain the difference between using applicative-order evaluation
and normal-order evaluation on the following bit of code:

``
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
``

##Answer
Using applicative order, the arguments to the procedure are
evaluated before evaluating the `if` combination (or even the rest 
of the `test` procedure`). This results in an infinite recursive
loop that will never terminate. 

This is not the case using normal-order evaluation.
