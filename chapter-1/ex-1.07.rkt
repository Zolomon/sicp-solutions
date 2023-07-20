#lang sicp

(define (square x) (* x x))

(define (good-enough? guess x)
  (newline)
  (display "squared guess: ")
  (display (square guess))
  (newline)
  (display "|")
  (display (square guess))
  (display " - ")
  (display x)
  (display "| = ")
  (display (abs (- (square guess) x)))
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough-scaled? previous-guess new-guess x)
  (if (< (abs (- previous-guess new-guess) 
(define (sqrt-iter2 guess x)
  (define (sqrt-iter2-inner previous-guess new-guess target)
    (if (new-guess-is-small-enough? previous-guess new-guess)
        guess
        (sqrt-iter2-inner new-guess (improve new-guess previous-guess target) target)
  ))
  (sqrt-iter2-inner guess guess target))

#| We see that the precision drops for small values between 1e-17 and 1e-16.
This means that smaller values are rounded down to zero.

> (= (- 1.0 1e-17) 1.0)
#t
> (= (- 1.0 1e-16) 1.0)
#f

The same happens for larger values.
We need to scale the epsilon value to take this into account.
|#


#|
(good-enough? 0.000000000000001  0.00000000000000000000000000001)
(good-enough? 0.00000000000001  0.000000000000000000000000001)
(good-enough? 0.0000000000001  0.0000000000000000000000001)
(good-enough? 0.000000000001  0.00000000000000000000001)
(good-enough? 0.00000000001  0.000000000000000000001)
(good-enough? 0.0000000001  0.000000000000000001)
(good-enough? 0.000000001  0.0000000000000001)
(good-enough? 0.00000001  0.00000000000001)
(good-enough? 0.0000001  0.00000000001)
(good-enough? 0.000001  0.000000001)
(good-enough? 0.0001  0.0000001)
(good-enough? 0.001  0.00001)
(good-enough? 0.01  0.001)
(good-enough? 1 1.1)
(good-enough? 3.0001 9)
|#

(for-loop 1.0 0.1)

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
