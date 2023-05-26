(cl:in-package #:predicament)

(defparameter *break-on-signals* nil)

(setf (documentation '*break-on-signals* 'variable)
      (format nil
              "The value of this variable is a type specifier.  The initial~@
               value is NIL, meaning that no object is of this type.~@
               ~@
               In the initial phase of condition signaling, the function~@
               SIGNAL uses TYPEP to determine whether the condition being~@
               signaled is of the type indicated by the value of this~@
               variable.  If that is the case, then SIGNAL calls BREAK~@
               which enters the debugger before the signaling procedure~@
               continues.  The function BREAK establishes a CONTINUE~@
               restart which can be invoked in order for the signaling~@
               procedure to continue normally."))
