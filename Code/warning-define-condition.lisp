(cl:in-package #:predicament)

(define-condition warning (condition)
  ())

(setf (documentation 'warning 'type)
      (format nil
              "Class precedece list:~@
               warning, condition, t~@
               ~@
               This class is the superclass of all types of warnings"))
