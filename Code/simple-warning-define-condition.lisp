(cl:in-package #:predicament)

(define-condition simple-warning (simple-condition warning)
  ())

(setf (documentation 'simple-warning 'type)
      (format nil
              "Class precedence list:~@
               simple-warning, simple-condition, warning, condition, t~@
               ~@
               An instance of this class is created when the function WARN~@
               is invoked with a format control as the first argument."))
