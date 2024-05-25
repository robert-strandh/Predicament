(cl:in-package #:predicament)

(defun assert-restart-report (names stream)
  (format stream "Retry assertion")
  (if (null names)
      (format stream ".")
      (format stream " with new value~P for ~{~S~^, ~}."
              (length names) names)))

(defun assert-prompt (place-name value)
  (cond ((y-or-n-p "~&;; The old value of ~S is ~S.~%~
                    ;; Do you want to supply a new value?"
                   place-name value)
         (format *query-io* "~&;; Type a form to be evaluated:~%")
         (flet ((read-it ()
                  (format *query-io* "> ")
                  (eval (read *query-io*))))
           (cond ((symbolp place-name)
                  (format *query-io*
                          "~&;; (The old value is bound to the symbol ~S.)~%"
                          place-name)
                  (progv (list place-name) (list value) (read-it)))
                 (t (read-it)))))
        (t value)))

(defmacro assert (test-form &optional places datum &rest arguments)
  (flet ((make-place-setter (place)
           `(setf ,place (assert-prompt ',place ,place))))
    (let ((tag (gensym "ASSERT-TAG")))
      `(tagbody ,tag
          (unless ,test-form
            (restart-case ,(if (null datum)
                               `(error "The assertion ~S failed."
                                       ',test-form)
                               `(error ,datum ,@arguments))
              (continue ()
                :report (lambda (stream)
                          (assert-restart-report ',places stream))
                ,@(mapcar #'make-place-setter places)
                (go ,tag))))))))

;;; FIXME: write some more.
(setf (documentation 'assert 'function)
      (format nil
              "Syntax: assert test-form [({place}*) [datum-form {argument-form}*]]~@
               ~@
               TEST-FORM is a form that is always evaluated.  TEST-FORM~@
               is the only required argument.  Each PLACE is a place, and~@
               it is evaluated if and only if an error is signaled.~@
               DATUM-FORM is a form that evaluates to some datum.  It is~@
               evaluated each time an error is to be signaled, or not at~@
               all if no error is to be signaled.  Each ARGUMENT-FORM is~@
               a form that evaluates to some argument, and it is evaluated~@
               each time an error is to be signaled, or not at all if~@
               no error is to be signaled.~@
               ~@
               The datum resulting from the evaluation of DATUM-FORM~@
               and the arguments resulting from the evaluation of each~@
               ARGUMENT-FORM are together the designators for a condition~@
               of default type ERROR.~@
               ~@
               This macro assures that TEST-FORM evaluates to true.  In~@
               that case, ASSERT returns NIL.  If TEST-FORM evaluates~@
               to false, this macro signals a correctable error designated~@
               by the datum resluting from the evaluation of DATUM-FORM and~@
               the arguments resulting from the evaluation of each~@
               ARGUMENT-FORM.  In that case, invoking the CONTINUE restart~@
               lets the user alter the values of the places resulting from~@
               the evaluation of each PLACE, before TEST-FORM is evaluated~@
               again, and the action is repeated."))


               
               
