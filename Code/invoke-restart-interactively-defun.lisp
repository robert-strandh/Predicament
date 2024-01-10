(cl:in-package #:predicament)

(defun invoke-restart-interactively (restart)
  (declare (type (or symbol restart) restart))
  (let ((restart-obj (find-restart restart)))
    (if (null restart-obj)
        (error 'invoke-restart-error :indicator restart)
        (let ((args (if (null (interactive-function restart-obj))
                        nil
                        (funcall (interactive-function restart-obj)))))
          (apply (action restart-obj) args)))))

(setf (documentation 'invoke-restart-interactively 'function)
      (format nil
              "Syntax: invoke-restart-interactively restart~@
              ~@
              This function invokes RESTART (like INVOKE-RESTART), but~@
              gets the arguments for the indicated restart by calling the~@
              restart's interactive function. If the restart does not~@
              have one, the restart is called with no arguments.~@
              ~@
              If RESTART does not indicate an active restart, an error~@
              of type CONTROL-ERROR is signaled."))
