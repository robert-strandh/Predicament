(cl:in-package #:common-lisp-user)

(defpackage predicament
  (:use #:common-lisp)
  (:export . #.predicament-asdf:*string-designators*))
