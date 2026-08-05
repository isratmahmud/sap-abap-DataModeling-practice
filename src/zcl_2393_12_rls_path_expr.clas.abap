CLASS zcl_2393_12_rls_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2393_12_RLS_PATH_EXPR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
    FROM zcds_2393_12_c_emp_query
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           DeptDesc,
           AssistantLastName,
           \_dept\_head-lastname AS headname
    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
