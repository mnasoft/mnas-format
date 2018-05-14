#|
  This file is a part of mnas-format project.
|#

(defsystem "mnas-format-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("mnas-format"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "mnas-format"))))
  :description "Test system for mnas-format"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
