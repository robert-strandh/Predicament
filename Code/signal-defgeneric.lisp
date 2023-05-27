(cl:in-package #:predicament)

(defgeneric signal (datum &rest arguments))

(setf (documentation 'signal 'function)
      (format nil
              "Syntax: signal datum &rest arguments~@
               ~@
               This function creates a condition denoted by DATUM and~@
               ARGUMENTS, and then searches for the most recently~@
               established handler capable of handling that denoted~@
               condition.  If that handler returns normally, then~@
               SIGNAL returns NIL.~@
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
               is a condition of type SIMPLE-CONDITION created by calling~@
               MAKE-CONDITION with the symbol SIMPLE-CONDITION and with~@
               :FORMAT-CONTROL DATUM and :FORMAT-ARGUMENTS ARGUMENTS."))
