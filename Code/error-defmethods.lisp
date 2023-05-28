(cl:in-package #:predicament)

(defmethod error ((datum condition) &rest arguments)
  (declare (ignore arguments))
  (signal datum)
  (invoke-debugger datum))

(defmethod error :around ((datum string) &rest arguments)
  (error (make-condition 'simple-error
                         :format-control datum
                         :format-arguments arguments)
         nil))

(defmethod error :around ((datum symbol) &rest arguments)
  (error (apply #'make-condition datum arguments)
         nil))

(defmethod error :before ((datum condition) &rest arguments)
  (unless (null arguments)
    (error 'type-error
           :datum arguments
           :expected-type 'null)))
