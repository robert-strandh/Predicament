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
