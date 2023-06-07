(cl:in-package #:common-lisp-user)

(defpackage predicament
  (:use #:common-lisp)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:bld #:iconoclast-builder)
                    (#:ses #:s-expression-syntax))
  (:export . #.predicament-asdf:*string-designators*))
