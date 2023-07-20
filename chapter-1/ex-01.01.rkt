#lang sicp

10                                  ;; 10
(+ 5 3 4)                           ;; 12
(- 9 1)                             ;; 8
(/ 6 2)                             ;; 3
(+ (* 2 4) (- 4 6))                 ;; (+ 8 -2) => 6
(define a 3)                        ;; Nothing, defines a := 3
(define b (+ a 1))                  ;; Nothing, defines b := a + 1 => b := 4
(+ a b (* a b))                     ;; (+ 3 4 (* 3 4)) => (+ 3 4 12) => 19
(= a b)                             ;; #f => false

(if (and (> b a) (< b (* a b)))     ;; 4 > 3 && 4 < 12 => b => 4
    b
    a)

(cond ((= a 4) 6)                   ;; b == 4 => (+ 6 7 a) => (+ 6 7 3) => 16
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))              ;; (+ 2 b) => 6

(* (cond ((> a b) a)                ;; (* b (+ a 1)) => 16
         ((< a b) b)
         (else -1))
   (+ a 1))