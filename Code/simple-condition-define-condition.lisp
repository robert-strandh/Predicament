(cl:in-package #:predicament)

(defgeneric simple-condition-format-control (simple-condition))

(defgeneric simple-condition-format-arguments (simple-condition))

(define-condition simple-condition (condition)
  ((%format-control
    :initarg :format-control
    :reader simple-condition-format-control)
   (%format-arguments
    :initarg :format-arguments
    :reader simple-condition-format-arguments))
  (:report (lambda (condition stream)
             (apply #'format
                    stream
                    (simple-condition-format-control condition)
                    (simple-condition-format-arguments condition)))))

(setf (documentation 'simple-condition 'type)
      (format nil
              "Class precedence list:~@
               simple-condition, condition, t~@
               ~@
               An instance of this condition class is created when a~@
               condition-signaling function is invoked with a format~@
               control as its first argument.  The format control can~@
               be supplied to MAKE-CONDITION by using the :FORMAT-CONTROL~@
               initarg, and this information can be read from the condition~@
               instance using the function SIMPLE-CONDITION-FORMAT-CONTROL.~@
               The format arguments can be supplied to MAKE-CONDITION by~@
               using the :FORMAT-ARGUMENTS initarg, and this information~@
               can be read from the condition instance by using the~@
               function SIMPLE-CONDITION-FORMAT-ARGUMENTS."))

(setf (documentation 'simple-condition-format-control 'function)
      (format nil
              "Syntax: simple-condition-format-control simple-condition~@
               ~@
               This function returns the information supplied by the~@
               initarg :FORMAT-CONTROL to MAKE-CONDITION when the condition~@
               type to be instantiated is (a subclass of) SIMPLE-CONDITION."))

(setf (documentation 'simple-condition-format-arguments 'function)
      (format nil
              "Syntax: simple-condition-format-arguments simple-condition~@
               ~@
               This function returns the information supplied by the~@
               initarg :FORMAT-ARGUMENTS to MAKE-CONDITION when the condition~@
               type to be instantiated is (a subclass of) SIMPLE-CONDITION."))
