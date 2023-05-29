(cl:in-package #:predicament)

(defmacro handler-bind (bindings &body forms)
  `(let ((*handler-clusters*
           (cons (list ,@(loop for (type-specifier handler-form) in bindings
                               collect `(cons ',type-specifier ,handler-form)))
                 *handler-clusters*)))
     ,@forms))
