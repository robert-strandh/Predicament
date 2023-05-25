(cl:in-package #:predicament)

(define-condition program-error (error)
  ())

(setf (documentation 'program-error 'type)
      (format nil
              "Class precedence-list:~@
               program-error, error, serious-condition, condition, t~@
               ~@
               An instance of this class can be used to represent errors~@
               resulting from incorrect program syntax, both at compile~@
               time and at run time."))
