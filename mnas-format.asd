;;;; mnas-format.asd

(defsystem "mnas-format"
  :description "Describe mnas-format here"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"    
  :version "0.1.1"
  :serial nil
  :components
  ((:file "package")
   (:module "src" :depends-on ("package")
    :serial nil
    :components
    ((:file "mnas-format")))))
