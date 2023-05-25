(cl:in-package #:predicament)

(define-condition control-error (error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "An error of type CONTROL-ERROR was signaled~@
                      as a result of an invalid dynamic transfer~@
                      of control."))))

(setf (documentation 'control-error 'type)
      (format nil
              "Class precedence list:~@
               control-error, error, serious-condition, condition, t~@
               ~@
               An instance of this class can be used to signal an~@
               invalid dynamic transfer of control in a program.~@
               Typical uses for this class would be to signal a~@
               situation where the function THROW was invoked but~@
               no corresponding CATCH tag is active, or where~@
               a RETURN-FROM was attempted where the corresponding~@
               BLOCK name is no longer valid."))
