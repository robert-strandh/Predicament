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
    #:style-warning))
