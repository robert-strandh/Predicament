(cl:defpackage #:predicament-asdf
  (:use #:common-lisp)
  (:export #:*string-designators*))

(cl:in-package #:predicament-asdf)

(asdf:defsystem #:predicament-base
  :depends-on (#:iconoclast)
  :serial t
  :description "Portable Condition System, base system"
  :depends-on (#:s-expression-syntax))

(defparameter *string-designators*
  '(#:with-simple-restart
    #:*break-on-signals*
    #:*debugger-hook*
    #:restart
    #:restart-name
    #:restart-bind
    #:find-restart
    #:handler-bind
    #:make-condition
    #:invoke-debugger
    #:signal
    #:warn
    #:warning
    #:serious-condition
    #:style-warning
    #:error
    #:cell-error
    #:cell-error-name
    #:undefined-function
    #:unbound-variable
    #:unbound-slot
    #:unbound-slot-instance
    #:arithmetic-error
    #:arithmetic-error-operation
    #:arithmetic-error-operands
    #:division-by-zero
    #:floating-point-inexact
    #:floating-point-invalid-operation
    #:floating-point-overflow
    #:floating-point-underflow
    #:file-error
    #:file-error-pathname
    #:package-error
    #:package-error-package
    #:parse-error
    #:print-not-readable
    #:print-not-readable-object
    #:program-error
    #:reader-error
    #:simple-condition
    #:simple-condition-format-control
    #:simple-condition-format-arguments
    #:simple-error
    #:type-error
    #:type-error-datum
    #:type-error-expected-type
    #:simple-type-error
    #:simple-warning
    #:storage-condition
    #:stream-error
    #:stream-error-stream
    #:end-of-file
    #:control-error
    #:abort
    #:muffle-warning
    #:continue
    #:store-value
    #:use-value))
