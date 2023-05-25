(cl:in-package #:predicament)

(define-condition error (serious-condition)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream "An error has occurred."))))

(setf (documentation 'error 'type)
      (format nil
              "Class precedece list:~@
               error, serious-condition, condition, t~@
               ~@
               This class is the superclass of all condition classes~@
               where an instance represents an error."))
