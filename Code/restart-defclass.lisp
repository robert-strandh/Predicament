(cl:in-package #:predicament)

(defgeneric restart-name (restart))

(defclass restart ()
  ((%name
    :initarg :name
    :reader restart-name)
   (%action
    :initarg :action
    :reader action)
   (%report-function
    :initform nil
    :initarg :report-function
    :reader report-function)
   (%interactive-function
    :initform nil
    :initarg :interactive-function
    :reader interactive-function)
   (%test-function
    :initform (constantly t)
    :initarg :test-function
    :reader test-function)))

(setf (documentation 'restart-name 'function)
      (format nil
              "Syntax: restart-name restart~@
               ~@
               This function returns the name of the restart RESTART,~@
               or NIL if the restart has no name.~@
               ~@
               If RESTART is not a restart object, then an error of type~@
               TYPE-ERROR is signaled."))
               
