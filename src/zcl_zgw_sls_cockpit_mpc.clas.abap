class ZCL_ZGW_SLS_COCKPIT_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
    begin of TS_XPSIFXI_SLS_HEADERTYPE.
      include type /PSIF/I_SLS_HEADER.
  types:
    end of TS_XPSIFXI_SLS_HEADERTYPE .
  types:
   TT_XPSIFXI_SLS_HEADERTYPE type standard table of TS_XPSIFXI_SLS_HEADERTYPE .
  types:
    begin of TS_ZC_SLS_HDRTYPE.
      include type ZC_SLS_HDR.
  types:
    end of TS_ZC_SLS_HDRTYPE .
  types:
   TT_ZC_SLS_HDRTYPE type standard table of TS_ZC_SLS_HDRTYPE .
  types:
    begin of TS_ZC_SLS_ITEMTYPE.
      include type ZC_SLS_ITEM.
  types:
    end of TS_ZC_SLS_ITEMTYPE .
  types:
   TT_ZC_SLS_ITEMTYPE type standard table of TS_ZC_SLS_ITEMTYPE .
  types:
    begin of TS_ZC_SLS_PARTNERTYPE.
      include type ZC_SLS_PARTNER.
  types:
    end of TS_ZC_SLS_PARTNERTYPE .
  types:
   TT_ZC_SLS_PARTNERTYPE type standard table of TS_ZC_SLS_PARTNERTYPE .
  types:
    begin of TS_ZC_SLS_TREENODESTYPE.
      include type ZC_SLS_TREENODES.
  types:
    end of TS_ZC_SLS_TREENODESTYPE .
  types:
   TT_ZC_SLS_TREENODESTYPE type standard table of TS_ZC_SLS_TREENODESTYPE .

  constants GC_XPSIFXI_SLS_HEADERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'xPSIFxI_SLS_HEADERType' ##NO_TEXT.
  constants GC_ZC_SLS_HDRTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_SLS_HDRType' ##NO_TEXT.
  constants GC_ZC_SLS_ITEMTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_SLS_ITEMType' ##NO_TEXT.
  constants GC_ZC_SLS_PARTNERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_SLS_PARTNERType' ##NO_TEXT.
  constants GC_ZC_SLS_TREENODESTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_SLS_TREENODESType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_ZGW_SLS_COCKPIT_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZGW_SLS_COCKPIT_SRV' ).

define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20231103115337'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
*    @@TYPE_SWITCH:
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20231103115337'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root ##CATCH_ALL.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20231103115337'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="/PSIF/I_SLS_HEADER" binding="/PSIF/I_SLS_HEADER" />|  &
               | <sadl:dataSource type="CDS" name="ZC_SLS_HDR" binding="ZC_SLS_HDR" />|  &
               | <sadl:dataSource type="CDS" name="ZC_SLS_ITEM" binding="ZC_SLS_ITEM" />|  &
               | <sadl:dataSource type="CDS" name="ZC_SLS_PARTNER" binding="ZC_SLS_PARTNER" />|  &
               | <sadl:dataSource type="CDS" name="ZC_SLS_TREENODES" binding="ZC_SLS_TREENODES" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="xPSIFxI_SLS_HEADER" dataSource="/PSIF/I_SLS_HEADER" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_SLS_HDR" dataSource="ZC_SLS_HDR" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_ITEMS" binding="_ITEMS" target="ZC_SLS_ITEM" cardinality="zeroToMany" />|  &
               | <sadl:association name="TO_PARTNERS" binding="_PARTNERS" target="ZC_SLS_PARTNER" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_SLS_ITEM" dataSource="ZC_SLS_ITEM" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_SLS_PARTNER" dataSource="ZC_SLS_PARTNER" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_SLS_TREENODES" dataSource="ZC_SLS_TREENODES" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_PRESALEHEADER" binding="_PRESALEHEADER" target="ZC_SLS_HDR" cardinality="one" />|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

   ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZGW_SLS_COCKPIT' )
                                                                    iv_timestamp = co_gen_timestamp
                                                                    iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
