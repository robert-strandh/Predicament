(cl:in-package #:predicament)

(defvar *default-debugger*)

(setf (documentation '*default-debugger* 'variable)
      (format nil
              "Client code must set this variable to a function of~@
               one argument (a condition) that is the default debugger~@
               wanted by client code.  The function INVOKE-DEBUGGER~@
               calls the function when the value of *DEBUGGER-HOOK*~@
               is NIL, or when the function that is the value of~@
               *DEBUGGER-HOOK* returns normally."))
