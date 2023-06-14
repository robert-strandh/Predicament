(cl:in-package #:predicament)

(defmacro ignore-errors (&rest forms)
  `(handler-case (progn ,@forms)
     (error (condition (values nil condition)))))
