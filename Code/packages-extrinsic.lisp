(cl:in-package #:common-lisp-user)

(defpackage predicament
  (:use #:common-lisp)
  (:shadow . #.predicament-asdf:*string-designators*)
  (:export . #.predicament-asdf:*string-designators*))
