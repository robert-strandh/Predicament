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

;;; The standard is a bit skimpy when it comes to restart terminology.
;;; The term "visible" about a restart is mentioned only in connection
;;; with the TEST-FUNCTION, so we define "visible" like this:
;;;
;;;    "A restart R is "visible" with respect to a condition C if and
;;;     only if the TEST-FUNCTION of R returns true when called with C
;;;     as an argument".
;;;
;;; The term "active" is defined by the glossary roughly like this:
;;;
;;;    "A restart R is "active" if an only if it has been established
;;;     by some form F and has not yet been disestablished."
;;; 
;;; The term "applicable restart" is also defined in the glossary, and
;;; mentions "associated test" which we take to mean the
;;; TEST-FUNCTION.  Thus, we obtain the following definition:
;;;
;;;    "A restart is "applicable" if and only if it is both active and
;;;    visible."
;;;
;;; However, there is some quirk in that the glossarey entry for
;;; "applicable restart" seems to suggest that the TEST-FUNCTION can
;;; be called with NIL as an argument and it then returns true.  We
;;; shall suppose that it is not allowed to actually call the
;;; TEST-FUNCTION this way, and instead assume that the "associated
;;; test" automatically returns true for "no particular condition",
;;; and we will never call the TEST-FUNCTION with NIL as an argument.
