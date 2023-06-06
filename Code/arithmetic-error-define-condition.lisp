(cl:in-package #:predicament)

(defgeneric arithmetic-error-operation (arithmetic-error))

(defgeneric arithmetic-error-operands (arithmetic-error))

(define-condition arithmetic-error (error)
  ((%operation
    :initarg :operation
    :reader arithmetic-error-operation)
   (%operands
    :initarg :operands
    :reader arithmetic-error-operands))
  (:report (lambda (condition stream)
             (format stream
                     "An arithemetic error has occurred as a result~@
                      of invoking the operation:~@
                      ~s~@
                      with the arguments:~@
                      ~s."
                     (arithmetic-error-operation condition)
                     (arithmetic-error-operands condition)))))

(setf (documentation 'arithmetic-error 'type)
      (format nil
              "Class precedence list:~@
               arithmetic-error, error, serious-condition, condition, t~@
               ~@
               An instance of this class is used to signal an arithmetic~@
               error.  Two initargs are recognized by this class:~@
               :OPERATION for the operation that was in error, and~@
               :OPERANDS for the operands to that operation.  The operation~@
               can be read from the instance using the function named~@
               ARITHMETIC-ERROR-OPERATION, and the operands can be read~@
               using the function named ARITHMETIC-ERROR-OPERANDS."))

(setf (documentation 'arithmetic-error-operation 'function)
      (format nil
              "Syntax: arithmetic-error-operation arithmetic-error~@
               ~@
               This function returns the information supplied by~@
               the initarg :OPERATION to MAKE-CONDITION when the~@
               condition type to be instantiated is (a subclass of)~@
               ARITHMETIC-ERROR.~@
               ~@
               Normally, this function should return the name of the~@
               operation that was attempted when the error was signaled.~@
               However, instances of subclasses of ARITHMETIC-ERROR~@
               can be created by arbitrary use code, and the only guarantee~@
               is that this function returns the value supplied by~@
               the initarg :OPERATION when the class was instantiated."))

(setf (documentation 'arithmetic-error-operands 'function)
      (format nil
              "Syntax: arithmetic-error-operands arithmetic-error~@
               ~@
               This function returns the information supplied by~@
               the initarg :OPERANDS to MAKE-CONDITION when the~@
               condition type to be instantiated is (a subclass of)~@
               ARITHMETIC-ERROR.~@
               ~@
               Normally, this function should return a list of the~@
               operands to the operation when the error was signaled.~@
               However, instances of subclasses of ARITHMETIC-ERROR~@
               can be created by arbitrary use code, and the only guarantee~@
               is that this function returns the value supplied by~@
               the initarg :OPERANDS when the class was instantiated."))
