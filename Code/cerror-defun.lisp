(cl:in-package #:predicament)

(defun cerror (continue-format-control datum &rest arguments)
  (with-simple-restart (continue continue-format-control arguments)
    (apply #'error datum arguments)))
