(cl:in-package #:predicament)

(define-condition arithmetic-error (error)
  ((%operation
    :initarg :operation
    :reader arithmetic-error-operation)
   (%operands
    :initarg :operands
    :reader arithmetic-error-operands)))

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
