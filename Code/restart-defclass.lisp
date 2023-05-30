(cl:in-package #:predicament)

(defclass restart ()
  ((%name
    :initarg :name
    :reader name)
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
