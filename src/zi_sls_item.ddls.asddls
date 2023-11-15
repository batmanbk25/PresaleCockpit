@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Presale Order Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SLS_ITEM
  as select from ztb_sls_item --/psif/sls_item 
{
      @UI.facet: [
      { id:     'Items',
      purpose:  #STANDARD,
      type:     #IDENTIFICATION_REFERENCE,
      label:    'Items', 
      position: 10 }
      ]
      
      
  @UI.lineItem: [ { position: 10, label: 'Presale_Document' } ]
  @UI: { identification:[ { position: 10, label: 'Presale_Document' } ]}
  key presales_no,
  @UI.lineItem: [ { position: 20, label: 'Item' } ]
  @UI: { identification:[ { position: 20, label: 'Item' } ]}
  key pre_posnr,
  ponum,
  vbeln,
  fkrel,
  posnr,
  @UI.lineItem: [ { position: 80, label: 'Material Number' } ]
  @UI: { identification:[ { position: 80, label: 'Material Number' } ]}
  matnr,
  arktx,
  ean11,
  umrez,
  numtp,
  meins,
  hpean,
  meinh,
  kdmat,
  spart,
  chspl,
  @Semantics.quantity.unitOfMeasure: '/psif/leguom'
  /psif/legqty,
  /psif/leguom,
  @Semantics.quantity.unitOfMeasure : 'gewei'
  ntgew,
  @Semantics.quantity.unitOfMeasure : 'gewei'
  brgew,
  gewei,
  @Semantics.quantity.unitOfMeasure : 'gewei'
  kwmeng,
  pstyv,
  vrkme,
  @Semantics.quantity.unitOfMeasure : 'gewei'
  klmeng,
  werks,
  lgort,
  vstel,
  @Semantics.amount.currencyCode : 'waers'
  /psif/cuspri,
  waers,
  @Semantics.quantity.unitOfMeasure : 'gewei'
  /psif/cusqty,
  /psif/cusunit,
  /psif/orimat,
  profl,
  uepos,
  mtpos,
  mtart,
  vwpos,
  /psif/addproid,
  /psif/prdidsupp,
  /psif/mat4dig,
  /psif/buyid,
  /psif/buyco,
  /psif/buysize,
  /psif/venditem,
  /psif/buyitmnum,
  /psif/supitmnum,
  /psif/matdesc,
  psgnum,
  /psif/material_text,
  /psif/material_quan_uom,
  /psif/delivery_date,
  ihrez 
//  _Header
}
