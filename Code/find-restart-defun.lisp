(cl:in-package #:predicament)

(defun find-restart (identifier &optional condition)
  (let ((excluded-restarts
          (if (null condition)
              '()
              (loop for (restart . conditions) in *condition-restarts*
                    unless (member condition conditions)
                      collect restart))))
    (loop for restart in *active-restarts*
          when (and (or (eq identifier restart)
                        (eq identifier (name restart)))
                    (not (member restart excluded-restarts)))
            return restart
          finally (return nil))))
