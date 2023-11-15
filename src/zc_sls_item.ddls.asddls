@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Presale Order Item - Composistion'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Metadata.allowExtensions: true
@OData.publish: true
@ObjectModel.modelCategory: #BUSINESS_OBJECT
@ObjectModel.transactionalProcessingEnabled: true 
@ObjectModel.writeActivePersistence:'ZVI_SLS_ITEM'
@ObjectModel.representativeKey: 'Presale_Item'
@ObjectModel.semanticKey: [ 'Presale_Document' , 'Presale_Item'  ] 
@ObjectModel.createEnabled:true
@ObjectModel.deleteEnabled:true
@ObjectModel.updateEnabled:true

define view entity ZC_SLS_ITEM as select from ZI_SLS_ITEM
//  as projection on /PSIF/I_SLS_ITEM
  //as select from /PSIF/I_SLS_ITEM
{
//      @UI.facet: [
//      { id:     'Items',
//      purpose:  #STANDARD,
//      type:     #IDENTIFICATION_REFERENCE,
//      label:    'Items',
//      position: 10 }
//      ]


  key presales_no as Presale_Document,
  key pre_posnr as Presale_Item,
      ponum as PO_Number,
      vbeln as SO_Number,
      fkrel,
      posnr,
      matnr as Material_Number,
      arktx as Material_Name,
      ean11,
      mtart as Material_Type,
      @Semantics.quantity.unitOfMeasure : 'vrkme'
      kwmeng as Order_Quantity,
      umrez,
      numtp,
      meins,
      hpean,
      meinh,
      kdmat as Customer_Material,
      spart as Division,
      chspl,
      @Semantics.quantity.unitOfMeasure: '/psif/leguom'
      /psif/legqty,
      /psif/leguom,
      @Semantics.quantity.unitOfMeasure : 'gewei'
      ntgew,
      @Semantics.quantity.unitOfMeasure : 'gewei'
      brgew as Gross_Weight,
      gewei,
      pstyv as Item_Category,
      vrkme,
      @Semantics.quantity.unitOfMeasure : 'gewei'
      klmeng as Cumulative_Confirmed_Quantity,
      werks as Plant,
      lgort,
      vstel,
      @Semantics.amount.currencyCode : 'waers'
      /psif/cuspri as Customer_Expected_Price,
      waers,
      @Semantics.quantity.unitOfMeasure : 'gewei'
      /psif/cusqty,
      /psif/cusunit,
      /psif/orimat,
      profl,
      uepos,
      mtpos,
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
      /psif/delivery_date as Item_Delivery_Date,
      ihrez as Your_Reference
//      _Header : redirected to parent /PSIF/C_SLS_HDR
}
