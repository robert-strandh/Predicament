(cl:in-package #:predicament)

(defgeneric package-error-package (package-error))

(define-condition package-error (error)
  ((%package
    :initarg :package
    :reader package-error-package))
  (:report (lambda (condition stream)
             (format stream
                     "An error has occurred as a result of an operation~@
                      involving the following package:~@
                      ~s."
                     (package-error-package condition)))))

(setf (documentation 'package-error 'type)
      (format nil
              "Class precedence list:
               package-error, error, serious-condition, condition, t~@
               ~@
               An instance of this condition class is signaled as~@
               a result of an error occurring during an operation on~@
               packages.  The :PACKAGE initarg can be used to indicate~@
               the package or the package name involved in the error,~@
               and this information can be read from the condition~@
               instance using the function PACKAGE-ERROR-PACKAGE."))
