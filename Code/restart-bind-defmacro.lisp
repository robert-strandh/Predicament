(cl:in-package #:predicament)

(defun restart-bind-transform-binding (binding)
  (destructuring-bind (name function . arguments) binding
    `(make-instance 'restart
       :name ',name :action ,function ,@arguments)))

(defmacro restart-bind (bindings &body body)
  (let ((cluster (mapcar #'restart-bind-transform-binding bindings)))
    `(let ((*restart-clusters* (cons (list ,@cluster) *restart-clusters*)))
       ,@body)))
