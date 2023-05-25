(cl:in-package #:predicament)

(define-condition end-of-file (stream-error)
  ()
  (:report (lambda (condition stream)
             (format stream
                     "End of file was encountered during an operation~@
                      on the stream ~s."
                     (stream-error-stream condition)))))

(setf (documentation 'end-of-file 'type)
      (format nil
              "Class precedence list:~@
               end-of-file, stream-error, error, serious-condition, condition, t~@
               ~@
               An instance of the class can be used to represent a~@
               situation where an end of file on a stream happened~@
               during some read operation on that stream.  The~@
               :STREAM initarg to MAKE-CONDITION can be used to indicate~@
               the stream involved in the operation, and the function~@
               STREAM-ERROR-STREAM can be used to read this information~@
               from the condition instance."))
