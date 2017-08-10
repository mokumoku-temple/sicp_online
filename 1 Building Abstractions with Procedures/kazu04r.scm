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

(define (h n) (A 2 n)) -> (A 1 (A 2 (- n 1))) -> (^ 2 (A 2 (- n 1))) -> (^ 2 (A 1 (A 2 (- (- n 1) 1)))) -> (^ 2 (^ 2 (A 2 (- (- n 1) 1)))) -> 2^n^n == (A 1 (* n n))

(define (k n) (* 5 n n))

;;------------------
;; 1.11
;;------------------

(define fun11recur
  (lambda (n)
    (cond
     ((<= n 3) n)
     (else (+ (fun11recur (- n 1)) (* 2 (fun11recur (- n 2))) (* 3 (fun11recur (- n 3))))))))

(define fun11iter
  (lambda (n)
    (let loop ((n n) (a 3) (b 2) (c 1))
      (cond
       ((<= n 3) a)
       (else
	(loop (- n 1) (+ a (* 2 b) (* 3 c)) a b))))))

;;------------------
;; 1.12
;;------------------
;;TODO

;; n = 1 1
;; n = 2 1 1
;; n = 3 1 2 1
;; n = 4 1 3 3 1
;; n = 5 1 4 6 4 1
;; ...
;; n = n 1 f(n-1,1)+f(n-1,2) f(n-1,2)+f(n-1,3) ... 1

;;------------------
;; 1.13
;;------------------
;;TODO

;;------------------
;; 1.14
;;------------------
;;TODO

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

;;------------------
;; 1.15
;;------------------
(define p-count 1)

(define (cube x) (* x x x))

(define (p x) (print p-count)(set! p-count (+ p-count 1)) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

;; gosh> (sine 12.15)
;; 1
;; 2
;; 3
;; 4
;; 5
;; -0.39980345741334

;; (sine 12.15) -> (p (sine (/ 12.15 3))) -> (p (p (sine (/ (/ 12.15 3))))) ->
;; (sine a) -> (p (sine (/ a 3))) -> (p (p (sine (/ a/3 3)))) -> (p (p (p (sine (/ a/9 3)))))

;; ステップ Θ(n) ?
;; スペース Θ(n) ?



