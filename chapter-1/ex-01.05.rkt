#lang sicp

#|

For this exercise I needed to refresh what normal-order evaluation and
applicative-order evaluation meant. Here is my understanding from the book:

## Normal-order evaluation => "Fully expand operators, then reduce"

Step 1. Substitute operand ex
Step 2. 

Example: 
(f 5)                                           =>
(sum-of-squares (+ 5 1)  (* 5 2))               =>
(+   (square (+ 5 1))    (square (* 5 2)))      =>
(+   (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))   =>
(+   (* 6       6)       (* 10      10))        =>
(+   36                  100)                   =>
136


## Applicative-order evaluation => "Evaluate the parameters, then apply" => "first evaluate operands, then operators, then apply resulting procedure to the resulting arguments"

Examaple:
(f 5)                                      => Step 1. Substitute operator => f into (sum-of-squares (+ a 1) (* a 2))
(sum-of-squares (+ a 1) (* a 2))           => Step 2. Substitute operands => Then substitute a to its bound value 5.
(sum-of-squares (+ 5 1) (* 5 2))           => Step 3. Apply procedure => Evaluate the operands, then repeat from step 1.
(+ (square 6) (square 10))                 =>
(+ (* 6 6)    (* 10 10))                   =>
(+ 36         100)                         =>
136
|#

;; For testing purposes
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(define (p) (p)) ;; Define P to be the application of itself.
(define (test x y)
  (if (= x 0) 0 y))

;; (test 0 (p))

;; Try this in the console
;; (test 0 (p)) ;; NOTE: (p) means to evaluate the definition p.

#|
What does (test 0 (p)) become with normal-order evaluation?
(test 0 (p))                                   => Step 1. Substitute operand expressions for parameters until only an expression with primitive operators
                                               => Step 2. Then evaluate
                                               => So we begin to expand each operand
(test 0 (p))                                   => 0 == 0, so we continue to expand (p)
(test 0 (p))                                   => the result of expanding (p) is (p), we are thus stuck in a loop.
...
(test 0 (p))


What does (test 0 (p)) become with applicative-order evaluation?

(test 0 (p))                                   => Step 1. Substitute operator => test is substituted with (if (= x 0) 0 y)
(if (= x 0) 0 y)                               => Step 2. Substitute operands => x == 0, y == (p)
(if (= 0 0) 0 (p))                             => Step 3. Apply procedure => Evaluate the predicate which will return 0
0
|#