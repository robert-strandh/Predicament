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

(setf (documentation 'print-not-readable-object 'function)
      (format nil
              "Syntax print-not-readable-object print-not-readable~@
               ~@
               This function returns the information supplied by the~@
               initarg :OBJECT to MAKE-CONDITION when the condition type~@
               to be instantiated is (a subclass of) PRINT-NOT-READABLE.~@
               ~@
               Normally, this function should return the object that,~@
               when an attempts to write a printed representation of that~@
               object with *PRINT-READABLY* being true, that representation~@
               would not be read back correctly by READ.  However, instances~@
               of PRINT-NOT-READABLE can be created by arbitrary use code,~@
               and the only guarantee is that this function returns the~@
               value supplied by the initarg :OBJECT when the class was~@
               instantiated."))
