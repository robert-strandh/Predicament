(cl:in-package #:predicament)

(define-condition error (condition)
  ())

(setf (documentation 'warning 'type)
      (format nil
              "Class precedece list:~@
               error, serious-condition, condition, t~@
               ~@
               This class is the superclass of all condition classes~@
               where an instance represents an error."))
