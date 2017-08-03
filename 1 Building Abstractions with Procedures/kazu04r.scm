;;------------------
;; 1.9
;;------------------

(define inc
  (lambda (x)
    (+ x 1)))

(define dec
  (lambda (x)
    (- x 1)))

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

;;(+ 4 5)
;;(inc (+ 3 5))
;;(inc (inc (+ 2 5)))
;;(inc (inc (inc (+ 1 5))))
;;(inc (inc (inc (inc (+ 0 5))))
;;(inc (inc (inc (inc 5)))
;;(inc (inc (inc 6))
;;(inc (inc 7))
;;(inc 8)
;;9


(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

;;(+ 4 5)
;;(+ 3 6)
;;(+ 2 7)
;;(+ 1 8)
;;(+ 0 9)
;;9

;;------------------
;; 1.10
;;------------------

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n)) -> 2n

(define (g n) (A 1 n)) -> (A 0 (A 1 (- n 1))) -> (* 2 (A 1 (- n 1))) -> (* 2 (A 0 (A 1 (- (- n 1) 1)))) -> (* 2 (* 2 (A 1 (- (- n 1) 1)))) -> 2^n

(define (h n) (A 2 n)) -> (A 1 (A 2 (- n 1))) -> (^ 2 (A 2 (- n 1))) -> (^ 2 (A 1 (A 2 (- (- n 1) 1)))) -> (^ 2 (^ 2 (A 2 (- (- n 1) 1)))) -> 2^n^n == (A 1 16)

(define (k n) (* 5 n n))


