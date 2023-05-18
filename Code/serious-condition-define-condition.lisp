(cl:in-package #:predicament)

(define-condition serious-condition (condition)
  ())

(setf (documentation 'serious-condition 'type)
      (format nil
              "Class precedece list:~@
               serious-condition, condition, t~@
               ~@
               This class is the superclass of all conditions~@
               that are serious enough that they require interactive~@
               intervention if they are not handled.~@
               ~@
               This condition type is meant mainly as a superclass of~@
               more specific conditions, and it is not meant to be~@
               signaled directly."))

