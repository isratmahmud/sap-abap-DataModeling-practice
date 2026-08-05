CLASS zcl_2393_15_rls_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2393_15_rls_path_expr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
*    FROM /LRN/C_Employee_Ann
      FROM zcds_2393_15_c_emp_query_p( p_target_curr = 'USD'
*      , p_date = @sy-datum
            )
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,

           DeptDesc,
           AssistantLastName,
           \_dept\_head-lastname AS headname,
           AnnualSalaryConverted,

           CAST( MonthlySalaryConverted AS DEC( 15, 2 ) ) AS MonthlySalaryConverted,
           CurrencyCode, CompanyAffiliation

    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
