;;;; mnas-format.asd

(defsystem #:mnas-format
  :description "Describe mnas-format here"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"    
  :version "0.1.0"
  :serial t
  :depends-on (#:cl-annot)
  :components ((:file "package")
               (:file "mnas-format")))
