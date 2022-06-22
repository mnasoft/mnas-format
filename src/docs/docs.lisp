
(defpackage #:mnas-format/docs
  (:use #:cl ) 
  (:nicknames "MFORMAT/DOCS")
  (:export make-all)
  (:documentation "Пакет @b(mnas-format/docs) содержит функции
  генерирования и публикации документации."))

(in-package :mnas-format/docs)

(defun make-document ()
  (loop
    :for i :in
    '((:mnas-format          :mnas-format)
      )
    :do (apply #'mnas-package:document i)))

(defun make-graphs ()
  (loop
    :for i :in
    '(:mnas-format
      )
    :do (mnas-package:make-codex-graphs i i)))

(defun make-all (&aux
                   (of (if (find (uiop:hostname)
                                 mnas-package:*intranet-hosts*
                                 :test #'string=)
                           '(:type :multi-html :template :gamma)
                           '(:type :multi-html :template :minima))))
  "@b(Описание:) функция @b(make-all) служит для создания документации.

 Пакет документации формируется в каталоге
~/public_html/Common-Lisp-Programs/mnas-format.
"
  (mnas-package:make-html-path :mnas-format)
  (make-document)
  (make-graphs)
  (mnas-package:make-mainfest-lisp
   '(:mnas-format :mnas-format/docs)
   "Mnas-Format"
   '("Mykola Matvyeyev")
   (mnas-package:find-sources "mnas-format")
   :output-format of)
  (codex:document :mnas-format)
  (make-graphs)
  (mnas-package:copy-doc->public-html "mnas-format")
  (mnas-package:rsync-doc "mnas-format"))

;;;; (make-all)
