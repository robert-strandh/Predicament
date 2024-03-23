(cl:in-package #:predicament)

(defmacro handler-bind (bindings &body forms)
  `(let ((*handler-clusters*
           (cons (list ,@(loop for (type-specifier handler-form) in bindings
                               collect `(cons ',type-specifier ,handler-form)))
                 *handler-clusters*)))
     ,@forms))

(setf (documentation 'handler-bind 'function)
      (format nil
              "Syntax: handler-bind (bindings) body~@
               ~@
               This macro executes the forms in BODY (and implicit PROGN)~@
               in a dynamic environment where the bidnings in BINDINGS~@
               are in effect.~@
               ~@
               BINDINGS is a list of bindings.  Each binding is of the form~@
               (TYPE HANDLER), where TYPE is a type specifier that is used~@
               to determine whether a binding applies to a condition being~@
               signaled, and HANDLER is a form that is evaluated to produce~@
               a designator for a handler function.  A handler function is~@
               a function that takes a single argument, the condition to~@
               be handled.
               ~@
               To determine a handler for a particular signaled condition,~@
               BINDINGS is search sequentially from left to right until~@
               an appropriate TYPE is found.  If such a binding is found,~@
               then the associated handler function is executed in a~@
               dynamic environment where none of the handlers defined~@
               in this form is visible.  If the associated handler~@
               declines, the search continues for the next appropriate~@
               handler.  If no appropriate handler is found, handlers~@
               established in dynamically enclosing forms are searched.~@
               ~@
               If no appropriate handler is found, and the signaling form~@
               was SIGNAL or WARN, then that form returns normally.  If~@
               the signaling form was ERROR, then the debugger is entered."))
