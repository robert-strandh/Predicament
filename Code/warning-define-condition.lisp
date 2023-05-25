(cl:in-package #:predicament)

(define-condition warning (condition)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "A warning was signaled."))))

(setf (documentation 'warning 'type)
      (format nil
              "Class precedece list:~@
               warning, condition, t~@
               ~@
               This class is the superclass of all types of warnings"))
