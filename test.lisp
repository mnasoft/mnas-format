;;;; test.lisp

(in-package #:mnas-format)

(annot:enable-annot-syntax)

(round-foo 12345678)

(*
 (round 999.9999 0.01)
 0.01)

(format nil "~,4,-2,'*,' F" 22456654.46879)

(format nil "~2d" 505)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

@export
@annot.doc:doc
"@b(Пример использования:)
@b(Переменые:)
@begin(list)
 @item(value         - значение округляемое и преобразуемое в строку;)
 @item(out           - поток вывода;)
 @item(digits        - количество значащих цифр в окончательном представлении числа;)
 @item(zero-trailing - выполнять отбрасывание незначащих нулей;)
 @item(dp-trailing   - выполнять отбрасывание десятичной точки;)
 @item(decimal-point - десятичная точка;)
@end(list)

@begin[lang=lisp](code)
  (loop :for i :in '(1000000 100000 10000 1000 100 10 1 0.1 0.01 0.001 0.0001) :do
   (format t \"~A~%\" (mnas-format:round-val (* i 0.1234567891))))
=> 1.235e+5 12346. 1235. 123.5 12.35 1.235 0.1235 0.01235 1.235e-3 1.235e-4 1.235e-5
@end(code)
"
(defun round-foo (value &key (out nil) (digits 4) (zero-trailing t) (dp-trailing   t) (decimal-point "."))
  (typecase value
    (integer (format out "~d" value))
    (string  (format out "~a" value))
    (number  (format out "~f" "value"))
    (t 'error)))

(let* ((num 99.999)
       (digits 4)
       (stepen (1+ (floor (log num  10) 1))))
  (expt  10  (- stepen digits))
  (format nil "~,4,-2,'*,' F" (round num (expt 10 (- stepen digits)))))



