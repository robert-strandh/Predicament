(cl:in-package #:common-lisp-user)

(defpackage predicament
  (:use #:common-lisp)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:bld #:iconoclast-builder)
                    (#:ses #:s-expression-syntax))
  (:shadow . #.predicament-asdf:*string-designators*)
  (:export . #.predicament-asdf:*string-designators*))
