(cl:in-package #:predicament)

(define-condition storage-condition (serious-condition)
  ())

(setf (documentation 'storage-condition 'type)
      (format nil
              "Class precedence list:~@
               storage-condition, serious-condition, condition, t~@
               ~@
               An instance of this class can be used to signal a~@
               problem with memory management, mainly dues to limits~@
               of the implementation, such as stack overflow and heap~@
               exhaustion.~@
               ~@
               An instance of this class can be signaled by an operator~@
               that implicitly creates objects, which is why such an~@
               instance can be signaled at any time"))
