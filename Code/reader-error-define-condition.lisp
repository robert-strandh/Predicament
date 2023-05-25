(cl:in-package #:predicament)

(define-condition reader-error (error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "An error occurred during a READ operation."))))

(setf (documentation 'reader-error 'type)
      (format nil
              "Class precedence list:~@
               reader-error, error, serious-condition, condition, t~@
               ~@
               An instance of this class can be used to represent~@
               errors signaled by READ."))
