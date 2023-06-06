(cl:in-package #:predicament)

(defun use-value (value &optional condition)
  (let ((restart (find-restart 'use-value condition)))
    (if (null condition)
        nil
        (invoke-restart restart value))))
