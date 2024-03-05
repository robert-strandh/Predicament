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
