(define (max x y z) 
  (define (square x) (* x x))
  (define (sum-of-square x y) (+ (square x) (square y)))
  (cond 
   ((and (> x y) (> y z)) (sum-of-square x y))
   ((and (> x y) (> z y)) (sum-of-square x z))
   (else (sum-of-square y z))))




