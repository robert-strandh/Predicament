(cl:in-package #:predicament)

(define-condition undefined-function (cell-error)
  ())

(setf (documentation 'undefined-function 'type)
      (format nil
              "Class precedece list:~@
               undefined-function, cell-error, serious-condition, condition, t~@
               ~@
               An instance of this class can be used to represent~@
               the error condition consisting of an attempt to access~@
               the definition of an undefined function.  The name of~@
               the undefined function can be supplied by using the :NAME~@
               initarg defined by the superclass CELL-ERROR, and the name~@
               of the undefined function can be read from the instance~@
               using the function CELL-ERROR-NAME also defined by the~@
               superclass CELL-ERROR."))
