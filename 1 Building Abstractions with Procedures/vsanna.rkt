#lang racket

;============================================
; 1.1 
;============================================

10

(+ 5 3 4)

(- 9 1)

(/ 6 2)

(+ (* 2 4) (- 4 6))

(define a 3)

(define b (+ a 1))

(+ a b (* a b))

(= a b)

(if (and (> b a) (< b (* a b)))
  b
  a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))


; 10
; 12
; 8
; 3
; 6
; 19
; #f
; 4
; 16
; 6
; 16


;============================================
; 1.2
;============================================

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;============================================
; 1.3
;============================================


(define (sum-multiple a b)
  (+ (* a a) (* b b)))

(define (sum-multipled-biggers a b c)
  (cond
    ((and (or (> b a) (= b a)) 
          (or (> c a) (= c a)))(sum-multiple b c))
    ((and (or (> b c) (= b c)) 
          (or (> a c) (= a c)))(sum-multiple a b))
    ((and (or (> a b) (= a b)) 
          (or (> c b) (= c b)))(sum-multiple a c))))


(sum-multipled-biggers 1 5 3)

;============================================
; 1.4
;============================================

; ほほー
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))


(a-plus-abs-b 100 -200)


; bが正であれば (+ a b)を行い
; bが0または負であれば(- a b)を行う

;============================================
; 1.5
;============================================

; 無限ループ
(define (p) (p))

; x = 0なら0を返し、そうでないならyを返す
(define (test x y)
  (if (= x 0)
    0
    y))


(test 0 (p))

; 作用的順序では先に引数を評価するので...まずはpを評価して
(test 0 (p)) ; p -> pに置き換わる
(test 0 (p)) ; 無限ループ！

; もし完全展開なら
(test 0 (p))
; 先に完全展開するので...
(if (= 0 0 )
  0
  (p)
  )
; ??? おそらくここで条件式がtrueだから無限ループにならず0が帰るね！と言いたいのだろうが、完全展開ならpを展開し始めて無限ループに陥るのでは...?







; # 復習
; 正規順序 = 「完全に展開してから簡約」
; 1. まず演算子と被演算子を評価
; 2. 結果の手続きを結果の引数に作用させる
;
; 作用的順序 = 「引数を評価してから、作用させる」
; 値が必要となるまで被演算子を評価しない
; 基本的演算子だけを持つ四季が出てくるまで被演算子の式の置き換えを繰り返す
;


; 正規順序
(sum-of-squares (+ 5 1) (* 5 2))
(+    (square (+ 5 1))      (square (* 5 2))  )
(+    (* (+ 5 1) (+ 5 1))   (* (* 5 2) (* 5 2)))
(+    (* 6 6)               (* 10 10))
(+    36                    100)
136


; 作用的順序 ... 引数を先に評価している! 
; (+　5 1), (* 5 2)の計算が1度で済む
(sum-of-squares (+ 5 1) (* 5 2))
(sum-of-squares 6 10)
(+    (square 6)      (square 10)  )
(+    36      100  )
136


;============================================
; 1.6
;============================================

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))


(define (improve guess x)
  (average guess (/ x guess)))


(define (average x y)
  (/ (+ x y) 2))


(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))  

(sqrt 2)



; 結論
; 無限ループになる
;
; new-ifが関数になるので、(good-enough? guess x) を評価する前に
; 常に引数である(sqrt-iter ( improve guess x) x)を先に評価しようとする
; ifは基本的演算子なので、作用的順序においては、ifが出た時点で演算子を被演算子に適用する。
; よって、ifなら条件をみて、場合によってはelse節に飛ばない。

;============================================
; 1.7
;============================================

(define (square x)
  (* x x))

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


(define (sqrt x)
    (sqrt-iter 1.0 x))



(sqrt 2)


;============================================
; 1.8
;============================================
