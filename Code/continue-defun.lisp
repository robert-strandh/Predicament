(cl:in-package #:predicament)

(defun continue (&optional condition)
  (let ((restart (find-restart 'continue condition)))
    (if (null condition)
        nil
        (invoke-restart restart))))
