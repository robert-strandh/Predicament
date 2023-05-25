(cl:defpackage #:predicament-asdf
  (:use #:common-lisp)
  (:export #:*string-designators*))

(cl:in-package #:predicament-asdf)

(asdf:defsystem #:predicament-base
  :serial t
  :description "Portable Condition System, base system"
  :depends-on (#:s-expression-syntax))

(defparameter *string-designators*
  '(#:warning
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
    #:reader-error))
