(cl:in-package #:predicament)

(define-condition floating-point-underflow (arithmetic-error)
  ()
  (:report (lambda (condition stream)
             (format stream
                     "A floating-point underflow has occurred.  The~@
                      operation that signaled this condition was~@
                      ~s~@
                      and the operands to that operation were~@
                      ~s"
                     (arithmetic-error-operation condition)
                     (arithmetic-error-operands condition)))))

(setf (documentation 'floating-point-underflow 'type)
      (format nil
              "Class precedence list:
               floating-point-underflow, arithmetic-error, error, serious-condition, condition, t~@
               ~@
               An instance of this condition is signaled as a result~@
               of an underflow of a floating-point operation."))
