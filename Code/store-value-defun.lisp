(cl:in-package #:predicament)

(defun store-value (value &optional condition)
  (let ((restart (find-restart 'store-value condition)))
    (if (null condition)
        nil
        (invoke-restart restart value))))
