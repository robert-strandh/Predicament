(cl:in-package #:predicament)

(defgeneric warn (datum &rest arguments))

(setf (documentation 'warn 'function)
      (format nil
              "Syntax: warn datum &rest arguments~@
               ~@
               This function establishes a restart MUFFLE-WARNING~@
               and then invokes the function SIGNAL on the~@
               condition denoted by DATUM and ARGUMENTS.  If the~@
               restart is invoked, then no further action is taken~@
               by WARN, and it immediately returns NIL.  If SIGNAL~@
               returns normally (as opposed to making a non-local~@
               transfer of control), then WARN reports the condition~@
               to *ERROR-OUTPUT*.  Finally, WARN returns NIL.~@
               ~@
               If the value of DATUM is a condition, then the denoted~@
               condition is that value.  In that case, if ARGUMENTS is~@
               not the empty list, an warn of type TYPE-WARN is signaled.~@
               ~@
               If the value of DATUM is a symbol, then the denoted condition~@
               is the result of calling MAKE-CONDITION and passing it the~@
               symbol and ARGUMENTS which are then the initialization~@
               arguments for MAKE-CONDITION.~@
               ~@
               If the value of DATUM is a string, the denoted condition~@
               is a condition of type SIMPLE-WARNING created by calling~@
               MAKE-CONDITION with the symbol SIMPLE-WARNING and with~@
               :FORMAT-CONTROL DATUM and :FORMAT-ARGUMENTS ARGUMENTS."))
