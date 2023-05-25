(cl:in-package #:predicament)

(define-condition file-error (error)
  ((%pathname
    :initarg :pathname
    :reader file-error-pathname))
  (:report (lambda (condition stream)
             (format stream
                     "An error has occurred as a result of an~@
                      operation on the file:~@
                      ~s."
                     (file-error-pathname condition)))))

(setf (documentation 'file-error 'type)
      (format nil
              "Class precedence list:
               file-error, error, serious-condition, condition, t~@
               ~@
               An instance of this condition class is signaled as~@
               a result of an error occurring during an attempt to~@
               open or close a file, or during some low-level transaction~@
               with a file system.  The :PATHNAME initarg can be used~@
               to indicate the file involved in the error, and this~@
               information can be read from the condition instance~@
               using the function FILE-ERROR-PATHNAME."))
