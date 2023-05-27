(cl:in-package #:predicament)

(defgeneric error (datum &rest arguments))

(setf (documentation 'error 'function)
      (format nil
              "Syntax: error datum &rest arguments~@
               ~@
               This function invokes the function SIGNAL on the~@
               condition denoted by DATUM and ARGUMENTS.  If SIGNAL~@
               returns normally (as opposed to making a non-local~@
               transfer of control), then ERROR calls the function~@
               INVOKE-DEBUGGER with the denoted condition.  As a result,~@
               ERROR can not directly return.  The only possible exit~@
               from ERROR is if either a handler invoked by SIGNAL~@
               does a non-local transfer of control, or a non-local~@
               transfer of control is done through an interactive~@
               debugger command.~@
               ~@
               If the value of DATUM is a condition, then the denoted~@
               condition is that value.  In that case, if ARGUMENTS is~@
               not the empty list, an error of type TYPE-ERROR is signaled.~@
               ~@
               If the value of DATUM is a symbol, then the denoted condition~@
               is the result of calling MAKE-CONDITION and passing it the~@
               symbol and ARGUMENTS which are then the initialization~@
               arguments for MAKE-CONDITION.~@
               ~@
               If the value of DATUM is a string, the denoted condition~@
               is a condition of type SIMPLE-ERROR created by calling~@
               MAKE-CONDITION with the symbol SIMPLE-ERROR and with~@
               :FORMAT-CONTROL DATUM and :FORMAT-ARGUMENTS ARGUMENTS."))
             
