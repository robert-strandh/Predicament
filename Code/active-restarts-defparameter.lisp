(cl:in-package #:predicament)

(defparameter *active-restarts* '())

(setf (documentation '*active-restarts* 'variable)
      (format nil
              "Initial value: () ; the empty list~@
               ~@
               The value of this variable is a proper list of all~@
               active restarts, ordered from the most recently~@
               established, to the least recently established."))
