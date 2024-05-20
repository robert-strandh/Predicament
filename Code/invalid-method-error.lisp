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

(setf (documentation 'invalid-method-error 'function)
      (format nil
              "Syntax: invalid-method-error method format-control &rest arguments~@
               ~@
               This function signals an error of type~@
               PREDICAMENT:INVALID-METHOD-CONDITION.  METHOD is the~@
               offending method.  FORMAT-CONTROL and ARGUMENTS together~@
               make up part of the error message of the error being~@
               signaled."))
