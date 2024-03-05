(cl:in-package #:predicament)

(defun find-restart (identifier &optional condition)
  (let ((excluded-restarts
          (if (null condition)
              '()
              (loop for (restart . conditions) in *condition-restarts*
                    unless (member condition conditions)
                      collect restart))))
    (loop for restart-cluster in *restart-clusters*
          do (loop for restart in restart-cluster
                   when (and (or (eq identifier restart)
                                 (eq identifier (restart-name restart)))
                             (not (member restart excluded-restarts))
                             (or (null (test-function restart))
                                 (funcall (test-function restart) condition)))
                     do (return-from find-restart restart))
          finally (return nil))))

(setf (documentation 'find-restart 'function)
      (format nil
              "Walks all restart clusters and returns the first~@
               restart with the correct name and visibility status."))
