;;;; mnas-format.lisp

(in-package #:mnas-format)

(defun round-val (a &optional (out nil))
  "Пример использования:
 (loop for i in '(1000000 100000 10000 1000 100 10 1 0.1 0.01  ) do
   (format t \"~A~%\" (mnas-format:round-val (* i 0.1234567891))))
"
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

(defun round-val_2 (a &optional (out nil))
    "Пример использования:
 (loop for i in '(1000000 100000 10000 1000 100 10 1 0.1 0.01  ) do
   (format t \"~A~%\" (mnas-format:round-val_2 (* i 0.1234567891))))
 (loop for i in '(1000000 100000 10000 1000 100 10 1 0.1 0.01  ) do
   (format t \"~A~%\" (mnas-format:round-val_2 (* i 0.1))))
"
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

(export 'round-val-10)
(defun round-val-10 (a &optional (out nil))
  "Пример использования:
 (loop for i in '(1000000 100000 10000 1000 100 10 1 0.1 0.01  ) do
   (format t \"~A~%\" (mnas-format:round-val (* i 0.1234567891))))
"
  (cond
    ((null a)                              (format out "" ))
    ((and (numberp a ) (= a 0))            (format out "0" ))
    ((and (numberp a ) (< (abs a) 10))     (format out "~A" (string-trim " " (format nil "~7,3F" a))))
    ((and (numberp a ) (< (abs a) 10000))  (format out "~A" (round a)))
    ((and (numberp a ))                    (format out "~A" (string-trim " " (format nil "~6,3E" a))))
    (T                                     (format out "~A" a))))
