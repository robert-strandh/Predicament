(cl:in-package #:predicament)

(define-condition cell-error (error)
  ((%name
    :initarg :name
    :reader cell-error-name)))

(setf (documentation 'cell-error 'type)
      (format nil
              "Class precedece list:~@
               cell-error, error, serious-condition, condition, t~@
               ~@
               This class is used to represent errors resulting~@
               from the unsuccessul attempt to access a location.~@
               The initialization argument :NAME to MAKE-CONDITION~@
               is used to indicate the name of the offending cell.~@
               This name can be accessed by a call to the function~@
               CELL-ERROR-NAME with an instance of this condition~@
               class as an argument."))
