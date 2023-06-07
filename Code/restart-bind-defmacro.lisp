(cl:in-package #:predicament)

(defmacro restart-bind (&whole form bindings &body forms)
  (declare (ignore bindings forms))
  (let* ((builder (make-instance 'bld:builder))
         (syntax (ses:find-syntax 'restart-bind))
         (ast (ses:parse builder syntax form)))
    (let ((binding-asts (ico:binding-asts ast)))
      (flet ((make-make-instance-form (binding-ast)
               `(make-instance 'restart
                  :name ,(ico:name (ico:name-ast ast))
                  :action ,(ico:form (ico:function-form-ast binding-ast))
                  :interactive-function
                  ,(if (null (ico:interactive-function-ast ast))
                       'nil
                       (ico:form (ico:interactive-function-ast binding-ast)))
                  :report-function
                  ,(if (null (ico:report-function-ast ast))
                       'nil
                       (ico:form (ico:report-function-ast binding-ast)))
                  :test-function
                  ,(if (null (ico:test-function-ast ast))
                       'nil
                       (ico:form (ico:test-function-ast binding-ast))))))
        `(let ((*restart-clusters*
                 (cons (list ,@(loop for binding-ast in binding-asts
                                     collect (make-make-instance-form
                                              binding-ast)))
                       *restart-clusters*)))
           ,@(loop for form in (ico:form (ico:form-asts ast))
                   collect form))))))

