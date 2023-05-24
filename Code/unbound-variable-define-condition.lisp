(cl:in-package #:predicament)

(define-condition unbound-variable (cell-error)
  ()
  (:report (lambda (condition stream)
             (format stream
                     "Attempt to access the value of the variable named ~@
                      ~s~@
                      but the variable with that name is unbound."
                     (cell-error-name condition)))))

(setf (documentation 'unbound-variable 'type)
      (format nil
              "Class precedece list:~@
               unbound-variable, cell-error, serious-condition, condition, t~@
               ~@
               An instance of this class can be used to represent~@
               the error condition consisting of an attempt to access~@
               the value of an unbound variable.  The name of~@
               the unbound variable can be supplied by using the :NAME~@
               initarg defined by the superclass CELL-ERROR, and the name~@
               of the unbound variable can be read from the instance~@
               using the function CELL-ERROR-NAME also defined by the~@
               superclass CELL-ERROR."))
