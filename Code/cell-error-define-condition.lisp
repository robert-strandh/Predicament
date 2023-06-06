(cl:in-package #:predicament)

(defgeneric cell-error-name (cell-error))

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

(setf (documentation 'cell-error-name 'function)
      (format nil
              "Syntax: cell-error-name cell-error~@
               ~@
               This function returns the information supplied by~@
               the initarg :NAME to MAKE-CONDITION when the condition~@
               type to be instantiated is (a subclass of) CELL-ERROR.~@
               ~@
               When the subclass is UNBOUND-SLOT, this function should~@
               return the name of the slot that was being accessed.~@
               When the subclass is UNBOUND-VARIABLE, this function~@
               should return the name of the variable being accessed.~@
               When the subclass is UNDEFINED-FUNCTION, this function~@
               should return the name of the function being accessed.~@
               ~@
               However, instances of subclasses of CELL-ERROR can be~@
               created by arbitrary use code, and the only guarantee~@
               is that this function returns the values supplied by~@
               the initarg :NAME when the class was instantiated."))
