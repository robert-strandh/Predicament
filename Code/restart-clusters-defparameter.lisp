(cl:in-package #:predicament)

(defparameter *restart-clusters* '())

(setf (documentation '*restart-clusters* 'variable)
      (format nil
              "Initial value: () ; the empty list~@
               ~@
               The value of this variable is a proper list of~@
               \"restart clusters\", where a restart cluster is~@
               a proper list of restarts established by a single~@
               form such as RESTART-CASE or RESTART-BIND.  Together~@
               the restarts in all the clusters are the \"active\"~@
               restarts.  The clusters in this list are orderd from~@
               most recently establshed to least recently established,~@
               and the restarts in a cluster are also ordered the same~@
               way."))
