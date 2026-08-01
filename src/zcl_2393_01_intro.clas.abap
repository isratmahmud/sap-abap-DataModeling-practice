CLASS zcl_2393_01_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2393_01_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA var TYPE /lrn/s4d430_IND.

    select from /lrn/s4d430_ind
    fields *
    into table @DATA(result).
        out->write( result ).
  ENDMETHOD.
ENDCLASS.
