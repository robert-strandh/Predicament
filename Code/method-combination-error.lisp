(cl:in-package #:predicament)

;;; As the dictionary entry for METHOD-COMBINATION-ERROR hints, this
;;; function is called in a dynamic context that contains more
;;; information about the error in question.  But we don't know what
;;; the implementation might supply in this context, so we are just
;;; defining a very rudimentary version of this function, allowing a
;;; new implementation to get started.  A better version would depend
;;; on that implementation-specific context.

(defun method-combination-error (format-control &rest arguments)
  (apply #'error format-control arguments))

(setf (documentation 'method-combination-error 'function)
      (format nil
              "Syntax: method-combination-error format-control  &rest arguments~@
               ~@
               This function calls ERROR, supplying FORMAT-CONTROL and~@
               ARGUMENTS as arguments."))
