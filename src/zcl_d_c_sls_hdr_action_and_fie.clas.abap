class ZCL_D_C_SLS_HDR_ACTION_AND_FIE definition
  public
  inheriting from /BOBF/CL_LIB_D_SUPERCL_SIMPLE
  final
  create public .

public section.

  methods /BOBF/IF_FRW_DETERMINATION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_D_C_SLS_HDR_ACTION_AND_FIE IMPLEMENTATION.


method /BOBF/IF_FRW_DETERMINATION~EXECUTE.
  data: lt_header type ZTCSLS_HDR1.

  CALL METHOD IO_READ->RETRIEVE
    EXPORTING
      IV_NODE                 = IS_CTX-node_key
      IT_KEY                  = IT_KEY
*      IV_BEFORE_IMAGE         = ABAP_FALSE
*      IV_FILL_DATA            = ABAP_TRUE
*      IT_REQUESTED_ATTRIBUTES =
    IMPORTING
*      EO_MESSAGE              =
      ET_DATA                 = lt_header
*      ET_FAILED_KEY           =
*      ET_NODE_CAT             =
      .

endmethod.
ENDCLASS.
