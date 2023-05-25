(cl:in-package #:predicament)

(define-condition parse-error (error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream "A parse error has occurred."))))

(setf (documentation 'parse-error 'type)
      (format nil
              "Class precedence list:
               parse-error, error, serious-condition, condition, t~@
               ~@
               An instance of this condition class is signaled as~@
               a result of an error occurring during parsing."))
