(cl:in-package #:predicament)

(defmethod signal ((datum condition) &rest arguments)
  (declare (ignore arguments))
  (loop for (current-cluster . more-clusters) on *handler-clusters*
        do (let ((*handler-clusters* more-clusters))
             (loop for (type . handler) in current-cluster
                   when (typep datum type)
                     do (funcall handler datum)))))


(defmethod signal :around ((datum string) &rest arguments)
  (signal (make-condition 'simple-condition
                          :format-control datum
                          :format-arguments arguments)
          nil))

(defmethod signal :around ((datum symbol) &rest arguments)
  (signal (apply #'make-condition datum arguments)
          nil))

(defmethod signal :before ((datum condition) &rest arguments)
  (unless (null arguments)
    (error 'type-error
           :datum arguments
           :expected-type 'null))
  (when (typep datum *break-on-signals*)
    (break "~a~%Break because of *BREAK-ON-SIGNALS*" datum)))
