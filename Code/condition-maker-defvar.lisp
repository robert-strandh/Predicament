(cl:in-package #:predicament)

(defvar *condition-maker*)

(setf (documentation '*default-debugger* 'variable)
      (format nil
              "Client code must set this variable to a function that~@
               takes the same arguments as MAKE-CONDITION, and that~@
               returns a condition instance according to the type and~@
               the slot-initializations given to MAKE-CONDITION.  We~@
               use this indirection because the library can not impose~@
               a particular way of making conditions."))
