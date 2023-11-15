class ZCL_ZGW_SLS_COCKPIT_MPC_EXT definition
  public
  inheriting from ZCL_ZGW_SLS_COCKPIT_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.

  methods ADD_HDR_ACTION
    importing
      !IV_ACTION_NAME type /IWBEP/MED_EXTERNAL_NAME .
  methods ADD_NODES_ACTION
    importing
      !IV_ACTION_NAME type /IWBEP/MED_EXTERNAL_NAME .
ENDCLASS.



CLASS ZCL_ZGW_SLS_COCKPIT_MPC_EXT IMPLEMENTATION.


method ADD_HDR_ACTION.
  DATA: LV_FC_FIELDVALUE TYPE /IWBEP/MED_ANNOTATION_VALUE,
        LO_COMPLEX_TYPE  TYPE REF TO /IWBEP/IF_MGW_ODATA_CMPLX_TYPE,
        LO_PROP          TYPE REF TO /IWBEP/IF_MGW_ODATA_PROPERTY.

  DATA(LO_ACTION) = MODEL->CREATE_ACTION( IV_ACTION_NAME ).

  "set return parameter
  LO_ACTION->SET_RETURN_ENTITY_TYPE( 'ZC_SLS_HDRType' ).
*    lo_action->set_return_entity_type( 'ZTEST_TREE_SRV.ZC_SLS_HDRType' ) .
  LO_ACTION->SET_RETURN_ENTITY_SET( 'ZC_SLS_HDR' ).

  LO_ACTION->SET_HTTP_METHOD( 'PUT' ).
  LO_ACTION->SET_RETURN_MULTIPLICITY( /IWBEP/IF_MGW_MED_ODATA_TYPES=>GCS_CARDINALITY-CARDINALITY_1_1 ).
  "specify input parameters
  DATA(LO_PARAMETER) = LO_ACTION->CREATE_INPUT_PARAMETER(
    IV_PARAMETER_NAME = 'NodeID'
    IV_ABAP_FIELDNAME = 'NodeID' ).
  LO_PARAMETER->/IWBEP/IF_MGW_ODATA_PROPERTY~SET_TYPE_EDM_STRING( ).
  LO_PARAMETER->SET_MAXLENGTH( IV_MAX_LENGTH = 10 ).

  "Is Action Active?
  CONCATENATE 'IsActive' IV_ACTION_NAME INTO DATA(LV_ACTION_AC).
*    concatenate iv_action_name '_ac' into lv_action_ac.
*    lv_action_ac = iv_action_name.

  DATA(LO_ANNOTATION) = LO_ACTION->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION( 'sap' ).
  LO_ANNOTATION->ADD( IV_KEY = 'action-for' IV_VALUE = 'ZC_SLS_HDRType' ).
  LO_ANNOTATION = LO_ACTION->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION( 'sap' ).
  LO_ANNOTATION->ADD( IV_KEY = 'applicable-path' IV_VALUE = LV_ACTION_AC ).
  LO_ANNOTATION = LO_ACTION->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION( 'sap' ).
  LO_ANNOTATION->ADD( IV_KEY = 'icon' IV_VALUE = 'sap-icon://notes' ).
  LO_ANNOTATION = LO_ACTION->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION( '' ).
endmethod.


METHOD ADD_NODES_ACTION.
  DATA: LV_FC_FIELDVALUE TYPE /IWBEP/MED_ANNOTATION_VALUE,
        LO_COMPLEX_TYPE  TYPE REF TO /IWBEP/IF_MGW_ODATA_CMPLX_TYPE,
        LO_PROP          TYPE REF TO /IWBEP/IF_MGW_ODATA_PROPERTY.

  DATA(LO_ACTION) = MODEL->CREATE_ACTION( IV_ACTION_NAME ).

  "set return parameter
  LO_ACTION->SET_RETURN_ENTITY_TYPE( 'ZC_SLS_TREENODESType' ).
  LO_ACTION->SET_RETURN_ENTITY_SET( 'ZC_SLS_TREENODES' ).

  LO_ACTION->SET_HTTP_METHOD( 'PUT' ).
  LO_ACTION->SET_RETURN_MULTIPLICITY( /IWBEP/IF_MGW_MED_ODATA_TYPES=>GCS_CARDINALITY-CARDINALITY_1_1 ).
  "specify input parameters
  DATA(LO_PARAMETER) = LO_ACTION->CREATE_INPUT_PARAMETER(
    IV_PARAMETER_NAME = 'NodeID'
    IV_ABAP_FIELDNAME = 'NodeID' ).
  LO_PARAMETER->/IWBEP/IF_MGW_ODATA_PROPERTY~SET_TYPE_EDM_STRING( ).
  LO_PARAMETER->SET_MAXLENGTH( IV_MAX_LENGTH = 10 ).

  "Is Action Active?
  CONCATENATE 'IsActive' IV_ACTION_NAME INTO DATA(LV_ACTION_AC).

  DATA(LO_ANNOTATION) = LO_ACTION->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION( 'sap' ).
  LO_ANNOTATION->ADD( IV_KEY = 'action-for' IV_VALUE = 'ZC_SLS_TREENODESType' ).
  LO_ANNOTATION = LO_ACTION->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION( 'sap' ).
  LO_ANNOTATION->ADD( IV_KEY = 'applicable-path' IV_VALUE = LV_ACTION_AC ).
  LO_ANNOTATION = LO_ACTION->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION( 'sap' ).
  LO_ANNOTATION->ADD( IV_KEY = 'icon' IV_VALUE = 'sap-icon://notes' ).
  LO_ANNOTATION = LO_ACTION->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION( '' ).
ENDMETHOD.


method DEFINE.
  SUPER->DEFINE( ).

* To create hierarchical CDS
  DATA:
    LR_ENTITY     TYPE REF TO /IWBEP/IF_MGW_ODATA_ENTITY_TYP,
    LR_PROPERTY   TYPE REF TO /IWBEP/IF_MGW_ODATA_PROPERTY,
    LR_ANNOTATION TYPE REF TO /IWBEP/IF_MGW_ODATA_ANNOTATION.

*  Return.
  LR_ENTITY = MODEL->GET_ENTITY_TYPE( IV_ENTITY_NAME = 'ZC_SLS_TREENODESType' ).
  IF LR_ENTITY IS  BOUND.
    LR_PROPERTY = LR_ENTITY->GET_PROPERTY( IV_PROPERTY_NAME = 'NodeID' ).
    LR_ANNOTATION = LR_PROPERTY->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION(
      IV_ANNOTATION_NAMESPACE = /IWBEP/IF_MGW_MED_ODATA_TYPES=>GC_SAP_NAMESPACE ).
    LR_ANNOTATION->ADD(
      IV_KEY   = 'hierarchy-node-for' "/IWBEP/IF_ANA_ODATA_TYPES=>GCS_ANA_ODATA_ANNOTATION_KEY–hierarchy_node_for
      IV_VALUE = 'NodeID' ).

    LR_PROPERTY = LR_ENTITY->GET_PROPERTY( IV_PROPERTY_NAME = 'Hierlevel' ).
    LR_ANNOTATION = LR_PROPERTY->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION(
      IV_ANNOTATION_NAMESPACE = /IWBEP/IF_MGW_MED_ODATA_TYPES=>GC_SAP_NAMESPACE ).
    LR_ANNOTATION->ADD(
      IV_KEY   = 'hierarchy-level-for' "/IWBEP/IF_ANA_ODATA_TYPES=>GCS_ANA_ODATA_ANNOTATION_KEY–hierarchy_node_for
      IV_VALUE = 'NodeID' ).

    LR_PROPERTY = LR_ENTITY->GET_PROPERTY( IV_PROPERTY_NAME = 'ParentsID' ).
    LR_ANNOTATION = LR_PROPERTY->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION(
      IV_ANNOTATION_NAMESPACE = /IWBEP/IF_MGW_MED_ODATA_TYPES=>GC_SAP_NAMESPACE ).
    LR_ANNOTATION->ADD(
      IV_KEY   = 'hierarchy-parent-node-for'
      IV_VALUE = 'NodeID' ).

    LR_PROPERTY = LR_ENTITY->GET_PROPERTY( IV_PROPERTY_NAME = 'Drilldownstate' ).
    LR_ANNOTATION = LR_PROPERTY->/IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION(
      IV_ANNOTATION_NAMESPACE = /IWBEP/IF_MGW_MED_ODATA_TYPES=>GC_SAP_NAMESPACE ).
    LR_ANNOTATION->ADD(
      IV_KEY   = 'hierarchy-drill-state-for'
      IV_VALUE = 'NodeID' ).

    ADD_NODES_ACTION( IV_ACTION_NAME = 'CreateHDR' ).
  ENDIF.

  ADD_HDR_ACTION( IV_ACTION_NAME = 'HDRPARK' ).
  ADD_HDR_ACTION( IV_ACTION_NAME = 'HDRPOST' ).
*  ADD_HDR_ACTION( IV_ACTION_NAME = 'BOPF:PARK' ).
endmethod.
ENDCLASS.
