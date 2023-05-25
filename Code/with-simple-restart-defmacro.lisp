(cl:in-package #:predicament)

(defmacro with-simple-restart
    ((name format-control &rest format-arguments) &body forms)
  (let ((stream-variable (gensym "STREAM")))
    `(restart-case
         ;; RESTART-CASE inspects the CAR of RESTARTABLE-FORM and if
         ;; it is one of the symbols SIGNAL, ERROR, CERROR, or WARN,
         ;; then WITH-CONDITION-RESTARTS is used to associate the
         ;; indicated restart with the condition to be signaled.  so
         ;; if FORMS is a list of a single form, we would like to
         ;; transfer the form as a whole as the RESTARTABLE-FORM in
         ;; case the CAR of that form is one of those symbols.
         ,(if (= (length forms) 1)
              (first forms)
              `(progn ,@forms))
       (,name ()
         :report (lambda (,stream-variable)
                   (format ,stream-variable
                           ,format-control
                           ,@format-arguments))
         ;; The standard says that when the restart is invoked, then
         ;; the values returned by WITH-SIMPLE-RESTART should be NIL
         ;; and T.
         (values nil t)))))

(setf (documentation 'with-simple-restart 'function)
      (format nil
              "Syntax: with-simple-restart (name format-control format-argument*) form*~@
               ~@
               This macro establishes a restart.  The name of the restart~@
               is given by the NAME parameter which is not evaluated.~@
               FORMAT-CONTROL and FORMAT-ARGUMENTS are used to report~@
               the restart.  FORMAT-CONTROL and every FORMAT-ARGUMENT is~@
               evaluated.~@
               ~@
               If the restart named NAME is not invoked while the FORMs~@
               are evaluated, then the values of the last such forms are~@
               returned by WITH-SIMPLE-RESTART.~@
               ~@
               If the restart named NAME is invoked while the FORMs are~@
               evaluated, then the values NIL and T are returned.~@
               ~@
               If NAME is NIL, then the restart being established by~@
               WITH-SIMPLE-RESTART is an anonymous restart."))
