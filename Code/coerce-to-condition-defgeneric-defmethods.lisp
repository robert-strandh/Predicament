(cl:in-package #:predicament)

;;; The code in this file was taken from the portable condition system
;;; written by Michał "phoe" Herda, and then adapted slightly.

(defgeneric coerce-to-condition (datum arguments default-type name))

(defmethod coerce-to-condition ((datum condition) arguments default-type name)
  (unless (null arguments)
    (cerror "Ignore the additional arguments."
            'simple-type-error
            :datum arguments
            :expected-type 'null
            :format-control
            "You may not supply additional arguments when giving ~S to ~S."
            :format-arguments (list datum name)))
  datum)

(defmethod coerce-to-condition ((datum symbol) arguments default-type name)
  (apply #'make-condition datum arguments))

(defmethod coerce-to-condition ((datum string) arguments default-type name)
  (make-condition default-type
                  :format-control datum
                  :format-arguments arguments))

(defmethod coerce-to-condition ((datum function) arguments default-type name)
  (make-condition default-type
                  :format-control datum
                  :format-arguments arguments))

(defmethod coerce-to-condition (datum arguments default-type name)
  (error 'simple-type-error
         :datum datum
         :expected-type '(or condition symbol function string)
         :format-control "~S can not be coerced to a condition."
         :format-arguments (list datum)))
