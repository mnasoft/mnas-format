#|
  This file is a part of mnas-format project.
|#

(defsystem "mnas-format"
  :version "0.1.0"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ()
  :components ((:module "src"
			:components
			((:file "mnas-format"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "mnas-format-test"))))
