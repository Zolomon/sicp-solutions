#lang sicp
(define (square x) (* x x))
(define (sum x y z)
  (define (sum-square x y) (+ (square x) (square y)))
  (define a (max x y))
  (define b (max y z))
  (sum-square a b))

(sum 1 2 3)