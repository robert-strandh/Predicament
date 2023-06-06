(cl:in-package #:predicament)

(defgeneric print-not-readable-object (print-not-readable))

(define-condition print-not-readable (error)
  ((%object
    :initarg :object
    :reader print-not-readable-object))
  (:report (lambda (condition stream)
             (format stream
                     "An attempt was made to print the following object:~@
                      ~s~@
                      with *PRINT-READABLY* being true, but this object~@
                      can not be printed in a way that it can then be~@
                      read by READ."
                     (print-not-readable-object condition)))))

(setf (documentation 'print-not-readable 'function)
      (format nil
              "Class precedence list:~@
               print-not-readable, error, serious-condition, condition, t~@
               ~@
               An instane of this class can be signaled when an~@
               attempt is made to print an object readable (i.e.,~@
               when *PRINT-READABLY* is true), but the object can not~@
               be printed in a way that it can then be read back using~@
               READ.  The object in question can be supplied by using~@
               the :OBJECT initarg to MAKE-CONDITIOIN, and the function~@
               named PRINT-NOT-READABLE-OBJECT can be used in ordder to~@
               read the object from the condition instance."))
