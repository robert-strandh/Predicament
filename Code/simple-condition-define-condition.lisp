(cl:in-package #:predicament)

(define-condition simple-condition (condition)
  ((%format-control
    :initarg :format-control
    :reader simple-condition-format-control)
   (%format-arguments
    :initarg :format-arguments
    :reader simple-condition-format-arguments))
  (:report (lambda (condition stream)
             (apply #'format
                    stream
                    (simple-condition-format-control condition)
                    (simple-condition-format-arguments condition)))))

(setf (documentation 'simple-condition 'type)
      (format nil
              "Class precedence list:~@
               simple-condition, condition, t~@
               ~@
               An instance of this condition class is created when a~@
               condition-signaling function is invoked with a format~@
               control as its first argument."))
   
