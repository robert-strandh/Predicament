(cl:in-package #:predicament)

(defun abort (&optional condition)
  (let ((restart (find-restart 'abort condition)))
    (if (null condition)
        (error 'control-error)
        (invoke-restart restart))))
