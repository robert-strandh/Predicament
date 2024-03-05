(cl:in-package #:predicament)

(defun compute-restarts (&optional condition)
  (let ((excluded-restarts
          (if (null condition)
              '()
              (loop for (restart . conditions) in *condition-restarts*
                    unless (member condition conditions)
                      collect restart))))
    (loop :for cluster :in *restart-clusters*
          :append (loop :for restart :in cluster
                        :when (and (or (null (test-function restart))
                                       (funcall (test-function restart)
                                                condition))
                                   (not (member restart excluded-restarts)))
                          :collect restart))))

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
