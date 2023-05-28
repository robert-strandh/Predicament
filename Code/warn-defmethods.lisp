(cl:in-package #:predicament)

(defmethod warn ((datum warning) &rest arguments)
  (declare (ignore arguments))
  (with-simple-restart (muffle-warning "Muffle warning.")
    (signal datum)
    (format *error-output* "~&;; Warning:~%~A~%" datum))
  nil)

(defmethod warn :around ((datum string) &rest arguments)
  (warn (make-condition 'simple-warning
                         :format-control datum
                         :format-arguments arguments)
         nil))

(defmethod warn :around ((datum symbol) &rest arguments)
  (warn (apply #'make-condition datum arguments)
         nil))

(defmethod warn :before ((datum warning) &rest arguments)
  (unless (null arguments)
    (error 'type-error
           :datum arguments
           :expected-type 'null)))
