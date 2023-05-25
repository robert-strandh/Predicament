(cl:in-package #:predicament)

(define-condition simple-error (simple-condition error)
  ())

(setf (documentation 'simple-error 'type)
      (format nil
              "Class precedence list:~@
               simple-error, simple-condition, error, serious-condition, condition, t~@
               ~@
               An instance of this class is created when one of the~@
               functions ERROR or CERROR is invoked with a format control~@
               as the first argument."))
