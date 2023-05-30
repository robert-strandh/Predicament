(cl:in-package #:predicament)

(defparameter *condition-restarts* '())

(setf (documentation '*condition-restarts* 'variable)
      (format nil
              "Initial value: () ; the empty list~@
               ~@
               The value of this variable is an association list where~@
               each key is a restart and the associated value is a list~@
               of condition objects that are associated with the restart~@
               that is the key.~@
               ~@
               Keys are unique in that at most one element in the list~@
               will have a particular key.~@
               ~@
               The list of conditions associated with a restart may contain~@
               duplicates, but the list is treated as an unordered set."))
