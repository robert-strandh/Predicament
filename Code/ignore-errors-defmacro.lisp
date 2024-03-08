(cl:in-package #:predicament)

(defmacro ignore-errors (&rest forms)
  `(handler-case (progn ,@forms)
     (error (condition) (values nil condition))))

(setf (documentation 'ignore-errors 'function)
      (format nil
              "Syntax: ignore-errors form*~@
               ~@
               This macro establishes a handler for the condition~@
               type ERROR, and then evaluates FORM* from left to right~@
               (implicit PROGN).  If the evaluation of FORM* does not~@
               signal an ERROR, then this macro returns the values~@
               returned by FORM*.  If the evaluation of FORM* results~@
               in an ERROR being signaled, this macro return two values,~@
               namely NIL and the condition that was signaled."))
