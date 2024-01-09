(cl:in-package #:predicament)

(defmethod error ((datum condition) &rest arguments)
  (declare (ignore arguments))
  (signal datum)
  (invoke-debugger datum))

(defmethod error ((datum string) &rest arguments)
  (error (make-condition 'simple-error
                         :format-control datum
                         :format-arguments arguments)))

(defmethod error ((datum symbol) &rest arguments)
  (error (apply #'make-condition datum arguments)))

(defmethod error :before ((datum condition) &rest arguments)
  (unless (null arguments)
    (error 'type-error
           :datum arguments
           :expected-type 'null)))
