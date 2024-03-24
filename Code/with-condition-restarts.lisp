(cl:in-package #:predicament)

(defmacro with-condition-restarts (condition-form restarts-form &body body)
  (let ((c-variable (gensym "CONDITION"))
        (r-variable (gensym "RESTARTS")))
    `(let ((,c-variable ,condition-form)
           (,r-variable ,restarts-form))
       (let ((*condition-restarts*
               (append
                (loop with cr = *condition-restarts*
                      for entry in cr
                      unless (member (car entry ,r-variable) :test #'eq)
                        collect entry)
                (loop with cr = *condition-restarts*
                      for restart in ,r-variable
                      for conditions = (cdr (assoc restart cr :key #'eq))
                      collect (cons restart
                                    (cons ,c-variable conditions))))))
         ,@body))))

(setf (documentation 'with-condition-restarts 'function)
      (format nil
              "Syntax: with-condition-restarts c-form r-form &body body~@
               ~@
               First C-FORM is evaluated to produce a condition.  Then~@
               R-FORM is evaluated to produce a list of restarts.~@
               Finally, the forms in BODY (an implicit PROGN) are~@
               evaluated in a dynamic environment in which each restart~@
               in the list of restarts is associated with the condition."))
