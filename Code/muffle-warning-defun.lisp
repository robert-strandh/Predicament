(cl:in-package #:predicament)

(defun muffle-warning (&optional condition)
  (let ((restart (find-restart 'muffle-warning condition)))
    (if (null condition)
        (error 'control-error)
        (invoke-restart restart))))
