(cl:in-package #:predicament)

(defparameter *handler-clusters* '())

(setf (documentation '*handler-clusters* 'variable)
      (format nil
              "The value of this variable is a list of \"handler clusters\".~@
               A handler cluster in turn is a list of \"handler pairs\".~@
               A handler pair is a CONS cell where the CAR is a type~@
               specifier and the CDR is a condition handler.  The type~@
               specifier is used by SIGNAL to determine whether the~@
               condition being signaled can be handled by the associated~@
               condition handler.~@
               ~@
               A handler cluster consists of all the handlers established~@
               by a single form such as HANDLER-BIND or HANDLER-CASE.~@
               When a handler in such a form in turn signals a condition,~@
               all the handlers in that form are deactivated.  The concept~@
               of a handler cluster implements this behavior in that the~@
               cluster that a handler belongs to, is entirely deactivated~@
               while a handler in the cluster is being invoked."))
