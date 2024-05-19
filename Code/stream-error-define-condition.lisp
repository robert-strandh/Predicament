(cl:in-package #:predicament)

(defgeneric stream-error-stream (stream-error))

(define-condition stream-error (error)
  ((%stream
    :initarg :stream
    :reader stream-error-stream))
  (:report (lambda (condition stream)
             (format stream
                     "An error occurred as a result of an operation~@
                      on the stream:
                      ~s"
                     (stream-error-stream condition)))))

(setf (documentation 'stream-error 'type)
      (format nil
              "Class precedence list:~@
               stream-error, error, serious-condition, condition, t~@
               ~@
               An instance of this class can be used to represent~@
               an error resulting from the use of some operation~@
               involving a stream.  The :STREAM initarg to the function~@
               MAKE-CONDITION can be used to supply the stream that~@
               was involved in the operation, and this information~@
               can be read from the condition instance by using the~@
               function STREAM-ERROR-STREAM."))

(setf (documentation 'stream-error-stream 'function)
      (format nil
              "Syntax: stream-error-stream stream-error~@
               ~@
               This function returns the offending stream of~@
               STREAM-ERROR.
               ~@
               STREAM-ERROR is a conditioin of type STREAM-ERROR.~@
               The initarg :STREAM is used to initialize the offending~@
               stream when a condition of this type is created.~@
               ~@
               If STREAM-ERROR is not a condition of type STREAM-ERROR,
               then an error of type TYPE-ERROR is signaled."))
