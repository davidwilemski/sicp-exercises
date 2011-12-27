; Exercise 1.7.  
;
; The good-enough? test used in computing square roots 
; will not be very effective for finding the square roots of 
; very small numbers. Also, in real computers, arithmetic
; operations are almost always performed with limited precision. 
; This makes our test inadequate for very large numbers. 
;
; Explain these statements, with examples showing how the test fails 
; for small and large numbers. An alternative strategy for implementing
; good-enough? is to watch how guess changes from one iteration 
; to the next and to stop when the change is a very small fraction of 
; the guess. 
;
; Design a square-root procedure that uses this kind of end test. 
; Does this work better for small and large numbers?

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

; Answers:
;
; > (book-sqrt .0000001)
; 0.03125106561775382
; > (square .03125106561775382)
; 0.000976629102245155
; > 
;
; As you can see, for numbers smaller than the difference used in 
; good-enough? (.001 in this case), the answer to the square root becomes
; very inaccurate becaues in the eyes of this implementation of good-enough?,
; the answer is 'good enough'.
;
; > (book-sqrt 10000000000009)
;
; For very large numbers like the case above, the floating point operators will
; not have enough precision to ensure that the guess is close enough to the 
; correct answer and will continuously fail.

; This version of good-enough? will stop when the change in the size of the guess
; is less than one millionth the size of guess:
(define (relative-good-enough? guess x)
  (< (abs (- guess (/ x guess)))
     (/ guess 1000000)))

; Let's test it out:
(define (relative-sqrt guess x)
  (if (relative-good-enough? guess x)
    guess
    (relative-sqrt (improve guess x)
                   x)))

(define (new-sqrt x)
  (relative-sqrt 1.0 x))

; > (new-sqrt .0000001)
; 0.00031622776664863746
; > (square .00031622776664863746)
; 1.000000003995851e-07
; > (new-sqrt 10000000000009)
; 3162277.6640119036
; > (square 3162277.6640119036)
; 10000000024308.582
;
;
; Success! Well, sort of. We could probably improve the results a bit more
; in the large case by requriring an even smaller fraction in relative-good-enough?
; but, I say good enough for now :p
