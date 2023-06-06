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
                             (funcall (test-function restart) condition))
                     do (return-from find-restart restart))
          finally (return nil))))
