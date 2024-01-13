(cl:in-package #:predicament)

(defun break (&optional (format-control "Break") &rest format-arguments)
  (with-simple-restart (continue "Continue from BREAK.")
    (let ((*debugger-hook* nil))
      (invoke-debugger (make-condition 'simple-condition
                                       :format-control format-control
                                       :format-arguments format-arguments)))))
