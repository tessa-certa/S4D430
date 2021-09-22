*&---------------------------------------------------------------------*
*& Report s4d430_intro_s2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_open_sql_param.


*TYPES ty_t_customers TYPE STANDARD TABLE OF scustom
*                         WITH NON-UNIQUE KEY id.
*TYPES ty_t_customers TYPE STANDARD TABLE OF S4D430_CUSTREV
*                         WITH NON-UNIQUE KEY id.
TYPES ty_t_customers TYPE STANDARD TABLE OF z02_customer_with_parameter
                         WITH NON-UNIQUE KEY id.


DATA gt_customers TYPE ty_t_customers.

* ALV Processing


DATA go_salv TYPE REF TO cl_salv_table.
DATA gx_excp TYPE REF TO cx_salv_error.

* Selection Screen

PARAMETERS pa_city TYPE s_city DEFAULT 'New York' LOWER CASE.

START-OF-SELECTION.

* Data Retrieval
*******************************************************************************

* SELECT * FROM scustom
*           INTO TABLE gt_customers
*           WHERE city = pa_city
*           order by city name.

* Option 1: Read from the SQL View (Obsolete as off Rel. 7.50)
***************************************************************
* SELECT * FROM s4d430_custrev
*           INTO TABLE gt_customers
*           WHERE city = pa_city
*           order by city name.

* Option 2: Read from the CDS View (Recommended)
****************************************************************
  SELECT * FROM Z02_CUSTOMER_WITH_PARAMETER
          WHERE city = @pa_city
       ORDER BY city, name
        INTO TABLE @gt_customers.

* output
****************************************************************
  TRY.

  cl_salv_table=>factory(
    IMPORTING
      r_salv_table   = go_salv
    CHANGING
      t_table        = gt_customers
  ).

* Display
*-------------------------*

  go_salv->display( ).

CATCH cx_salv_error INTO gx_excp.    "
  MESSAGE gx_excp TYPE 'I'.
ENDTRY.
