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
                                       (funcall (test-function restart) condition))
                                   (not (member restart excluded-restarts)))
                          :collect restart))))
