;;;; mnas-format.lisp

(in-package #:mnas-format)

(annot:enable-annot-syntax)

@export
@annot.doc:doc
"@b(Пример использования:)
@begin[lang=lisp](code)
  (loop :for i :in '(1000000 100000 10000 1000 100 10 1 0.1 0.01 0.001 0.0001) :do
   (format t \"~A~%\" (mnas-format:round-val (* i 0.1234567891))))
=> 1.235e+5 12346. 1235. 123.5 12.35 1.235 0.1235 0.01235 1.235e-3 1.235e-4 1.235e-5
@end(code)
"
(defun round-val (a &optional (out nil))
  (cond
    ((and (numberp a ) (= a 0))            (format out "~A" (string-trim " " (format nil "~4,2F" a))))
    ((and (numberp a ) (< (abs a) 0.01))   (format out "~A" (string-trim " " (format nil "~6,3E" a))))
    ((and (numberp a ) (< (abs a) 0.1))    (format out "~A" (string-trim " " (format nil "~7,5F" a))))
    ((and (numberp a ) (< (abs a) 1))      (format out "~A" (string-trim " " (format nil "~7,4F" a))))
    ((and (numberp a ) (< (abs a) 10))     (format out "~A" (string-trim " " (format nil "~7,3F" a))))
    ((and (numberp a ) (< (abs a) 100))    (format out "~A" (string-trim " " (format nil "~7,2F" a))))
    ((and (numberp a ) (< (abs a) 1000))   (format out "~A" (string-trim " " (format nil "~7,1F" a))))
    ((and (numberp a ) (< (abs a) 10000))  (format out "~A" (string-trim " " (format nil "~7,0F" a))))
    ((and (numberp a ) (< (abs a) 100000)) (format out "~A" (string-trim " " (format nil "~7,0F" a))))
    ((and (numberp a ))                    (format out "~A" (string-trim " " (format nil "~6,3E" a))))
    (T                                     (format out "~A"    a))))

@export
@annot.doc:doc
"@b(Пример использования:)
@begin[lang=lisp](code)
 (loop :for i :in '(1000000 100000 10000 1000 100 10 1 0.1 0.01 0.001 0.0001 ) :do
   (format t \"~A \" (mnas-format:round-val_2 (* i 0.1234567891))))
=> 1.235e+5 12346. 1235. 123.5 12.35 1.235 0.1235 0.01235 1.235e-3
@end(code)
"
(defun round-val_2 (a &optional (out nil))
  (cond
    ((and (numberp a ) (= a 0))            (format out "~A" (string-trim " " (format nil "~,2F" a))))
    ((and (numberp a ) (< (abs a) 0.01))   (format out "~A" (string-trim " " (format nil "~,3E" a))))
    ((and (numberp a ) (< (abs a) 0.1))    (format out "~A" (string-right-trim "0" (string-trim " " (format nil "~,5F" a)))))
    ((and (numberp a ) (< (abs a) 1))      (format out "~A" (string-right-trim "0" (string-trim " " (format nil "~,4F" a)))))
    ((and (numberp a ) (< (abs a) 10))     (format out "~A" (string-right-trim "0" (string-trim " " (format nil "~,3F" a)))))
    ((and (numberp a ) (< (abs a) 100))    (format out "~A" (string-right-trim "0" (string-trim " " (format nil "~,2F" a)))))
    ((and (numberp a ) (< (abs a) 1000))   (format out "~A" (string-right-trim "0" (string-trim " " (format nil "~,1F" a)))))
    ((and (numberp a ) (< (abs a) 10000))  (format out "~A" (string-trim " " (format nil "~,0F" a))))
    ((and (numberp a ) (< (abs a) 100000)) (format out "~A" (string-trim " " (format nil "~,0F" a))))
    ((and (numberp a ))                    (format out "~A" (string-trim " " (format nil "~,3E" a))))
    (T                                     (format out "~A"    a))))

@export
@annot.doc:doc
"@b(Пример использования:)
@begin[lang=lisp](code)
(loop :for i :in '(1000000 100000 10000 1000 100 10 1 0.1 0.01 0.001 0.0001) :do
     (format t \"~A \" (mnas-format:round-val-10 (* i 0.1234567891))))
 => 1.235e+5 1.235e+4 1235 123 12 1.235 0.123 0.012 0.001 0.000 0.000 
@end(code)
"
(defun round-val-10 (a &optional (out nil))
  (cond
    ((null a)                              (format out "" ))
    ((and (numberp a ) (= a 0))            (format out "0" ))
    ((and (numberp a ) (< (abs a) 10))     (format out "~A" (string-trim " " (format nil "~7,3F" a))))
    ((and (numberp a ) (< (abs a) 10000))  (format out "~A" (round a)))
    ((and (numberp a ))                    (format out "~A" (string-trim " " (format nil "~6,3E" a))))
    (T                                     (format out "~A" a))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

@export
@annot.doc:doc
""
(defun round-1d-list (list-1d &key (round-func #'round-val))
  (mapcar #'(lambda (el) (funcall round-func el)) list-1d))

@export
@annot.doc:doc
""
(defun round-2d-list (list-2d &key (round-func #'round-val))
  (mapcar
   #'(lambda (list-1d)
       (mapcar
	#'(lambda (el)
	    (funcall round-func el))
	list-1d))
	  list-2d))


