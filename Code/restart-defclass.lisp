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
