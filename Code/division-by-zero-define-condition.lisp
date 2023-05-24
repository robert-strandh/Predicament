(cl:in-package #:predicament)

(define-condition division-by-zero (arithmetic-error)
  ()
  (:report (lambda (condition stream)
             (format stream
                     "The execution of the operation ~s~@
                      with arguments ~s~@
                      resulted in an attempt to divide by zero."
                     (arithmetic-error-operation condition)
                     (arithmetic-error-operands condition)))))

(setf (documentation 'division-by-zero 'type)
      (format nil
              "Class precedence list:
               division-by-zero, arithmetic-error, error, serious-condition, t~@
               ~@
               An instance of this condition class is signaled when~@
               an operator detects a division by zero.  The name of~@
               the operation can be supplied by the use of :OPERATION~@
               initarg defined by the superclass ARITHMETIC-ERROR,~@
               and that name can be accessed by the function named~@
               ARITHMETIC-ERROR-OPERATION function, also defined by~@
               that superclass.  The operands that caused the error~@
               can be supplied by the use of the :OPERANDS initarg~@
               defined by the superclass ARITHMETIC-ERROR, and those~@
               operands can be accessed by the function named~@
               ARITHMETIC-ERROR-OPERANDDS, also defined by that~@
               superclass."))
