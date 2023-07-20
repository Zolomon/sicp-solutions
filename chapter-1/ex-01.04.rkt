#lang sicp
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

#|

If b is larger than 0, then we return the operator procedure '+', otherwise '-'.
This is then applied via `(<insert operator here> a b)` once evaluated.

|#