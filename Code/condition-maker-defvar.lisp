(cl:in-package #:predicament)

(defvar *condition-maker*)

(setf (documentation '*condition-maker* 'variable)
      (format nil
              "Client code must set this variable to a function that~@
               takes the same arguments as MAKE-CONDITION, and that~@
               returns a condition instance according to the type and~@
               the slot-initializations given to MAKE-CONDITION.  We~@
               use this indirection because the library can not impose~@
               a particular way of making conditions.~@
               ~@
               The function check that the condition type (the first~@
               argument) is indeed the name of a condition class, and~@
               if that is not the case, it should signal an error."))
