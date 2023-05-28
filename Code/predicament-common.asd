(asdf:defsystem #:predicament-common
  :serial t
  :components
  ((:file "break-on-signals-defparameter")
   (:file "debugger-hook-defparameter")
   (:file "default-debugger-defvar")
   (:file "condition-maker-defvar")
   (:file "signal-defgeneric")
   (:file "error-defgeneric")
   (:file "warn-defgeneric")
   (:file "make-condition-defun")
   (:file "coerce-to-condition-defgeneric-defmethods")
   (:file "invoke-debugger-defun")
   (:file "handler-clusters-defparameter")
   (:file "with-simple-restart-defmacro")
   (:file "warning-define-condition")
   (:file "serious-condition-define-condition")
   (:file "style-warning-define-condition")
   (:file "error-define-condition")
   (:file "cell-error-define-condition")
   (:file "undefined-function-define-condition")
   (:file "unbound-variable-define-condition")
   (:file "unbound-slot-define-condition")
   (:file "arithmetic-error-define-condition")
   (:file "division-by-zero-define-condition")
   (:file "floating-point-inexact-define-condition")
   (:file "floating-point-invalid-operation-define-condition")
   (:file "floating-point-overflow-define-condition")
   (:file "floating-point-underflow-define-condition")
   (:file "file-error-define-condition")
   (:file "package-error-define-condition")
   (:file "parse-error-define-condition")
   (:file "print-not-readable-define-condition")
   (:file "program-error-define-condition")
   (:file "reader-error-define-condition")
   (:file "simple-condition-define-condition")
   (:file "simple-error-define-condition")
   (:file "type-error-define-condition")
   (:file "simple-type-error-define-condition")
   (:file "simple-warning-define-condition")
   (:file "storage-condition-define-condition")
   (:file "stream-error-define-condition")
   (:file "end-of-file-define-condition")
   (:file "control-error-define-condition")
   (:file "signal-defmethods")
   (:file "error-defmethods")
   (:file "warn-defmethods")))
