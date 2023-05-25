(cl:in-package #:predicament)

(define-condition style-warning (condition)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream "A style warning was signaled."))))

(setf (documentation 'style-warning 'type)
      (format nil
              "Class precedece list:~@
               style-warning, warning, condition, t~@
               ~@
               Instances of this class can be used to represent~@
               situations where some code is conforming, but still~@
               not acceptable, for instance becuase it is unidiomatic~@
               or inefficient."))
