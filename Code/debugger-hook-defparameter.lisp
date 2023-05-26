(cl:in-package #:predicament)

(defparameter *debugger-hook* nil)

(setf (documentation '*debugger-hook* 'variable)
      (format nil
              "This value of this variable is either NIL or a~@
               designator for a function of two arguments.~@
               ~@
               When the value is a function, this function is invoked~@
               by INVOKE-DEBUGGER.  The function INVOKE-DEBUGGER, can~@
               be called directly, or indirectly from calls to ERROR or~@
               CERROR.
               ~@
               When the value is a function, call it F, INVOKE-DEBUGGER~@
               saves F in a lexical variable, then binds this variable~@
               (i.e., *DEBUGGER-HOOK*) to NIL, and finally calls F~@
               with the condition that is the argument to INVOKE-DEBUGGER~@
               as the first argument, and F as the second argument.~@
               ~@
               The reason the function F being the value of this variable~@
               is passed itself (i.e. F) as the second argument, is so that~@
               F can itself bind this variable to F.  This possibiility~@
               can be used when F invokes a restart interactively, and~@
               that restart might evaluate code.  Then, if the debugger~@
               is invoked, explicitly or implicitly, during that evaluation,~@
               F can again be used during such recursive error handling."))
