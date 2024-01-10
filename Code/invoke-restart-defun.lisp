(cl:in-package #:predicament)

(define-condition invoke-restart-error (control-error)
  ((%restart-indicator :reader invoke-restart-error-indicator
                       :initarg :indicator))
  (:report (lambda (condition stream)
             (format stream "~A is not an active restart."
                     (invoke-restart-error-indicator condition)))))

(defun invoke-restart (restart &rest values)
  (declare (type (or symbol restart) restart))
  (let ((restart-obj (find-restart restart)))
    (if (null restart-obj)
        (error 'invoke-restart-error :indicator restart)
        (apply (action restart-obj) values))))

(setf (documentation 'invoke-restart 'function)
      (format nil
              "Syntax: invoke-restart restart &rest values~@
              ~@
              This function finds the active restart indicated by~@
              RESTART and calls the function associated with it,~@
              passing VALUES as the arguments. RESTART may be either~@
              a symbol indicating the name of a restart, or a restart~@
              object.~@
              ~@
              If RESTART does not indicate an active restart, an error~@
              of type CONTROL-ERROR is signaled."))
