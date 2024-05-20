(cl:in-package #:predicament)

(defun break (&optional (format-control "Break") &rest format-arguments)
  (with-simple-restart (continue "Continue from BREAK.")
    (let ((*debugger-hook* nil))
      (invoke-debugger (make-condition 'simple-condition
                                       :format-control format-control
                                       :format-arguments format-arguments)))))

(setf (documentation 'break 'function)
      (format nil
              "Syntax: break &optional format-control &rest arguments~@
               ~@
               This function enters the debugger by creating an instance~@
               of SIMPLE-CONDITION using FORMAT-CONTROL as a format control~@
               and FORMAT-ARGUMENTS as format arguments.  The default~@
               value of FORMAT-CONTROL is the string \"Break\".~@
               ~@
               If the CONTINUE restart is invoked while the debugger~@
               is invoked, then this function returns NIL.~@
               ~@
               Before entering the debugger, this function binds the~@
               variable *DEBUGGER-HOOK* to NIL."))
