(cl:in-package #:predicament)

(defgeneric type-error-datum (type-error))

(defgeneric type-error-expected-type (type-error))

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
               the expectec type was supplied instead.~@
               ~@
               The value of the initialization argument :DATUM should~@
               be the object that was not of the expected type.  The~@
               value of the initialization argument :EXPECTED-TYPE~@
               should be a type specifier that describes, as accurately~@
               as possible, the expected type of the object."))

(setf (documentation 'type-error-datum 'function)
      (format nil
              "Syntax: type-error-datum type-error~@
               ~@
               Given a condition of type TYPE-ERROR, this function~@
               returns the offending datum as supplied by the :DATUM~@
               initialization argument when the condition was created."))

(setf (documentation 'type-error-expected-type 'function)
      (format nil
              "Syntax: type-error-expected-type type-error~@
               ~@
               Given a condition of type TYPE-ERROR, this function~@
               returns the type specifier for the expected type as~@
               supplied by the :EXPECTED-TYPE initialization argument~@
               when the condition was created."))
