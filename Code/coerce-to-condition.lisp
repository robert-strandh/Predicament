(cl:in-package #:predicament)

(defgeneric coerce-to-condition (datum arguments default-type name))

(defmethod coerce-to-condition
    ((datum condition) arguments default-type name)
  (unless (null arguments)
    (cerror "Ignore the additional arguments."
            'simple-type-error
            :datum arguments
            :expected-type 'null
            :format-control
            "You may not supply additional arguments when giving ~S to ~S."
            :format-arguments (list datum name)))
  datum)

(defmethod coerce-to-condition ((datum symbol) arguments default-type name)
  (apply #'make-condition datum arguments))

(defmethod coerce-to-condition ((datum string) arguments default-type name)
  (make-condition default-type
                  :format-control datum
                  :format-arguments arguments))

(defmethod coerce-to-condition ((datum function) arguments default-type name)
  (make-condition default-type
                  :format-control datum
                  :format-arguments arguments))

(defmethod coerce-to-condition (datum arguments default-type name)
  (error 'simple-type-error
         :datum datum
         :expected-type '(or condition symbol function string)
         :format-control "~S is not coercable to a condition."
         :format-arguments (list datum)))

(setf (documentation 'coerce-to-condition 'function)
      (format nil
              "Syntax: coerce-to-condition datum arguments default-type name~@
               ~@
               This function attempts to coerce the provided arguments~@
               into a condition object. The DEFAULT-TYPE argument~@
               describes the default condition type that should be~@
               created if no condition type can be inferred from DATUM;~@
               the NAME argument is the name of the coercing operator~@
               and is used during invalid coercions to properly report~@
               the error.~@
               ~@
               When the value of DATUM is a condition, this function~@
               returns DATUM, provided that the value of ARGUMENTS is NIL.~@
               If the value is of ARGUMENTS is not NIL, then this function~@
               signals a coninuable error.~@
               ~@
               When the value of DATUM is a symbol, this function calls~@
               MAKE-CONDITION with DATUM and ARGUMENTS.~@
               ~@
               When the value of DATUM is a string, this function creates~@
               a SIMPLE-CONDTION of DEFAULT-TYPE using DATUM as the~@
               format control, and ARGUMENT as the format arguments.~@
               ~@
               When DATUM is neither a condition, a symbol, nor a string,~@
               this function signals an error indicating that the supplied~@
               DATUM cannot be coerced to a condition object."))
