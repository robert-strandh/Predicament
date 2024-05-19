(cl:in-package #:predicament)

(defun store-value (value &optional condition)
  (let ((restart (find-restart 'store-value condition)))
    (if (null condition)
        nil
        (invoke-restart restart value))))

(setf (documentation 'store-value 'function)
      (format nil
              "Syntax: store-value value &optional condition~@
               ~@
               This function transfers control to the most recently~@
               established applicable STORE-VALUE restart.  If no such~@
               restart exists, this function returns NIL.~@
               ~@
               CONDITION is a condition object or NIL.  If condition is~@
               a condition object, then only those restarts are considered~@
               that are explicitly associated with CONDITION, or not~@
               associated with any condition at all.  If CONDITION is NIL,~@
               then all established applicable STORE-VALUE restarts are~@
               considered.  If CONDITION is neither a condition object~@
               nor NIL, an error of type TYPE-ERROR is signaled."))
