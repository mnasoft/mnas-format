#|
  This file is a part of mnas-format project.
|#

(defsystem "mnas-format-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("mnas-format"
               "prove")
  :components ((:module "tests"
			:components
			((:test-file "mnas-format"))))
  :description "Test system for mnas-format"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
