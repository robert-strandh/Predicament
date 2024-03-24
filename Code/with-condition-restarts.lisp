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
