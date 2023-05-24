(cl:in-package #:predicament)

(define-condition unbound-slot (cell-error)
  ((%instance
    :initarg :instance
    :reader unbound-slot-instance))
  (:report (lambda (condition stream)
             (format stream
                     "Attempt to access the value of the slot named ~@
                      ~s of the instance~@
                      ~s~@
                      but the slot with that name is unbound."
                     (cell-error-name condition)
                     (unbound-slot-instance condition)))))

(setf (documentation 'unbound-slot 'type)
      (format nil
              "Class precedece list:~@
               unbound-slot, cell-error, serious-condition, condition, t~@
               ~@
               An instance of this class can be used to represent~@
               the error condition consisting of an attempt to access~@
               the value of an unbound slot.  The name of~@
               the unbound slot can be supplied by using the :NAME~@
               initarg defined by the superclass CELL-ERROR, and the name~@
               of the unbound slot can be read from the instance~@
               using the function CELL-ERROR-NAME also defined by the~@
               superclass CELL-ERROR."))
