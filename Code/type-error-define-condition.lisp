(cl:in-package #:predicament)

(define-condition type-error (error)
  ((%datum
    :initarg :datum
    :reader type-error-datum)
   (%expected-type
    :initarg :expected-type
    :reader type-error-expected-type))
  (:report (lambda (condition stream)
             (format stream
                     "An object of type:~@
                      ~s~@
                      was expected, but the object:~@
                      ~s was supplied instead."
                     (type-error-expected-type condition)
                     (type-error-datum condition)))))

(setf (documentation 'type-error 'type)
      (format nil
              "Class precedence list:~@
               type-error, error, serious-condition, condition, t~@
               ~@
               An instance of this class is signaled when an object~@
               of a certain type was expected, but an object not of~@
               the expectec type was supplied instead."))
