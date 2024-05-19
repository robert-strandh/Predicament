(cl:in-package #:predicament)

(defun abort (&optional condition)
  (let ((restart (find-restart 'abort condition)))
    (if (null condition)
        (error 'control-error)
        (invoke-restart restart))))

(setf (documentation 'abort 'function)
      (format nil
              "Syntax: abort &optional condition~@
               ~@
               This function transfers control to the most recently~@
               established applicable ABORT restart.  If no such restart~@
               exists, signals an error of type CONTROL-ERROR.~@
               ~@
               CONDITION is a condition object or NIL.  If condition is~@
               a condition object, then only those restarts are considered~@
               that are explicitly associated with CONDITION, or not~@
               associated with any condition at all.  If CONDITION is NIL,~@
               then all established applicable ABORT restarts are~@
               considered.  If CONDITION is neither a condition object~@
               nor NIL, an error of type TYPE-ERROR is signaled."))
