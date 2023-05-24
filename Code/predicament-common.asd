(asdf:defsystem #:predicament-common
  :serial t
  :components
  ((:file "warning-define-condition")
   (:file "serious-condition-define-condition")
   (:file "style-warning-define-condition")
   (:file "error-define-condition")
   (:file "cell-error-define-condition")
   (:file "undefined-function-define-condition")
   (:file "unbound-variable-define-condition")
   (:file "unbound-slot-define-condition")
   (:file "arithmetic-error-define-condition")
   (:file "division-by-zero-define-condition")
   (:file "floating-point-inexact-define-condition")))
