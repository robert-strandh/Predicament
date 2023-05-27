(cl:in-package #:predicament)

(defun make-condition (type &rest slot-initializations)
  (apply *condition-maker* type slot-initializations))

(setf (documentation 'make-condition 'function)
      (format nil
              "Syntax: make-condition type &rest slot-initializations~@
               ~@
               This function constructs and returns an instance of the~@
               condition class TYPE, according to the the initargs in~@
               SLOT-INITIALIZATIONS.~@
               ~@
               If there is no condition class named TYPE, then an error~@
               is signaled."))
