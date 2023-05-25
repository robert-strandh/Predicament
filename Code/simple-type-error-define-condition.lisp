(cl:in-package #:predicament)

(define-condition simple-type-error (simple-condition type-error)
  ())

(setf (documentation 'simple-type-error 'type)
      (format nil
              "Class precedece list:~@
               simple-type-error, simple-condition, type-error, error, serious-condition, condition t~@
               ~@
               Instances of this class can be used to represent an~@
               error signaled when an object of a certain type was~@
               expected, but an object not of the expected type was~@
               supplied.  In this respect, this class is similar to~@
               the condition class TYPE-ERROR.  But this class permits~@
               an alternative way of reporting the condition.  The~@
               :DATUM initarg to MAKE-CONDITION can be used to~@
               initialize the offending object, and the function~@
               TYPE-ERROR-OBJECT can be used to read this information~@
               from the condition instance.  The :EXPECTED-TYPE initarg~@
               to MAKE-CONDITION can be used to indicate the expected~@
               type of the object, and the TYPE-ERROR-EXPECTED-TYPE~@
               function can be used to read this information from the~@
               condition instance.  Furthermore, the :FORMAT-CONTROL~@
               initarg can be given to MAKE-INSTANCE for the alternative~@
               report, and the SIMPLE-CONDITION-FORMAT-CONTROL function~@
               can be used to read this information from the condition~@
               instance.  Finally, the :FORMAT-ARGUMENTS initarg can be~@
               given to MAKE-INSTANCE in order to supply FORMAT arguments~@
               required by the format control, and the function named~@
               SIMPLE-CONDITION-FORMAT-ARGUMENTS can be used to read~@
               this information from the condition instance."))
