(cl:in-package #:predicament)

;;; I am not sure how to interpret the dicationary entry for
;;; INVALID-METHOD-ERROR, so this code might be wrong.  I am also not
;;; sure whether my way of including the offending method in the error
;;; message is a good one.

(define-condition invalid-method-condition (error)
  ((%offending-method :initarg :method :reader offending-method)
   (%format-control :initarg :format-control :reader format-control)
   (%arguments :initarg :arguments :reader arguments))
  (:report (lambda (condition stream)
             (apply #'format stream (format-control condition)
                    (arguments condition))
             (format stream " Offending-method: ~s"
                     (offending-method condition)))))

(defun invalid-method-error (method format-control &rest arguments)
  (error 'invalid-method-condition
         :offending-method method
         :format-control format-control
         :arguments arguments))
