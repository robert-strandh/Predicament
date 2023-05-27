(cl:in-package #:predicament)

(defun invoke-debugger (condition)
  (check-type condition condition)
  (unless (null *debugger-hook*)
    (let ((current-debugger-hook *debugger-hook*)
          (*debugger-hook* nil))
      (funcall current-debugger-hook condition current-debugger-hook)))
  (funcall *default-debugger* condition))

(setf (documentation 'invoke-debugger 'function)
      (format nil
              "Syntax: invoke-debugger condition~@
               ~@
               This function can be called directly, or indirectly from~@
               calls to ERROR or CERROR.  If CONDITION is not a condition~@
               then a correctable error of type TYPE-ERROR is signaled.~@
               ~@
               When the value of *DEBUGGER-HOOK* is not NIL (then it should~@
               be a function), call it F, INVOKE-DEBUGGER saves F in a~@
               lexical variable, then binds *DEBUGGER-HOOK* to NIL, and~@
               finally calls F with CONDITION as the first argument, and F~@
               as the second argument.~@
               ~@
               The reason the function F being the value of *DEBUGGER-HOOK*~@
               is passed itself (i.e. F) as the second argument, is so that~@
               F can itself bind this variable to F.  This possibiility~@
               can be used when F invokes a restart interactively, and~@
               that restart might evaluate code.  Then, if the debugger~@
               is invoked, explicitly or implicitly, during that evaluation,~@
               F can again be used during such recursive error handling."))
