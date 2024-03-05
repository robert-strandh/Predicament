(cl:in-package #:predicament)

(defun associated-conditions (restart)
  (cdr (assoc restart *condition-restarts*)))

(defun restart-visible-p (restart condition)
  (and (funcall (test-function restart) condition)
       (or (null condition)
           (let ((associated-conditions (associated-conditions restart)))
             (or (null associated-conditions)
                 (member condition associated-conditions))))))

(defgeneric compute-restarts (&optional condition))

(defmethod compute-restarts (&optional condition)
  (loop for restart in (apply #'append *restart-clusters*)
        when (restart-visible-p restart condition)
          collect restart))

(setf (documentation 'compute-restarts 'function)
      (format nil
              "Syntax: compute-restarts &optional condition~@
               ~@
               This function returns a list of all the restarts~@
               that are currently active.  The list is ordered from~@
               most recently established restart to least recently~@
               established restart.
               ~@
               When the optional argument CONDITION is non-NIL, then~@
               then a restart is included in the resulting list only~@
               if it is either explicitly associated with CONDITION~@
               or if it is not associated with any condition at all.~@
               If CONDITION is not given, or its value is NIL, then~@
               all restarts are considered.~@
               ~@
               As permitted by the Common Lisp standard, this function~@
               returns a fresh list for each invocation."))
