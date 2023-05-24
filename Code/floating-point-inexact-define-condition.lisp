(cl:in-package #:predicament)

(define-condition floating-point-inexact (arithmetic-error)
  ()
  (:report (lambda (condition stream)
             (format stream
                     "A floating-point trap has occurred.  The operation~@
                      that triggered this trap was: ~s~@
                      and the operands to that operation were:~@
                      ~s"
                     (arithmetic-error-operation condition)
                     (arithmetic-error-operands condition)))))

(setf (documentation 'floating-point-inexact 'type)
      (format nil
              "Class precedence list:~@
               floating-point-inexact, arithmetic-error, error, serious-condition, condition, t~@
               ~@
               An instance of this condition class can be signaled~@
               as a result of certain floating-point traps.  However~@
               it is implementation-dependent whether floating-point~@
               traps occur.  As a result, conforming programs can not~@
               rely on this condition being signaled."))
