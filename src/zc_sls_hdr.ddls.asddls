@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite Presale Header'
@OData.publish: true
         
//@ObjectModel.compositionRoot:true
//@AbapCatalog.preserveKey: true
@ObjectModel.modelCategory: #BUSINESS_OBJECT
@ObjectModel.transactionalProcessingEnabled: true 
@ObjectModel.representativeKey: 'Presale_Document'
@ObjectModel.semanticKey: [ 'Presale_Document' ]  
@ObjectModel.writeActivePersistence:'ZVI_SLS_HDR'
//@ObjectModel.writeDraftPersistence: '/psif/sls_hdr_d'
//@ObjectModel.draftEnabled: true
@ObjectModel.createEnabled:true 
//@ObjectModel.deleteEnabled:true
@ObjectModel.updateEnabled:true
@Metadata.allowExtensions: true 

//define root view entity /PSIF/C_SLS_HDR
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZC_SLS_HDR 
  //association [0..1] to /PSIF/VH_SLS_TYPE as _VH_SLS_TYPE on $projection./psif/type = _VH_SLS_TYPE.value_low
  as select from ZI_SLS_HEADER  
  association [0..*] to ZC_SLS_ITEM as _Items on $projection.Presale_Document = _Items.Presale_Document
  association [0..*] to ZC_SLS_PARTNER as _Partners  on $projection.Presale_Document = _Partners.presales_no
{
//  key presales_no   as Presale_Document,

  key Presale_Document,
      NodeID,
      ParentsID,
      Hierlevel,
      Drilldownstate,  
//      presales_no as Presale_Document,

      //@ObjectModel.text.element: [ '/psif/type_t' ]
      /psif/type    as Presale_Type,
      ///psif/type_t,

      ponum         as PO_Number,
      bsark         as PO_Type,
      bstdk         as PO_Date,
      vbeln         as SO_Number,
      vbeln_ord,
      auart         as SO_Type,
      Request_Delivery_Date,
      @Semantics.quantity.unitOfMeasure: 'gewei'
      btgew         as Gross_Total_Weight,
      gewei,
      augru,
      vkorg         as Sales_Organization,
      vtweg         as Distribution_Chanel,
      spart         as Division,
      /psif/bdgtcod as Budget_Code,
      kunnr         as Customer,
      kostl,
      /psif/promo   as Promo_Code,
      ihrez         as Your_Reference,
      /psif/refevt  as Event,
      brand         as Brand,
      seasoncd      as Season_Code,
      /psif/status  as Status,
      @Semantics.amount.currencyCode: 'waerk'
      /psif/cuspri,
      //@Semantics.currencyCode:true
      waerk,
      telf1,
      name1,
      /psif/postype,
      /psif/batchid,
      /psif/edicontref,
      /psif/sourcid,
      uuid,
      /psif/edicontnr,
      expnr,
      adge_iedi,
      edi4stdvrs,
      cifedipart,
      /psif/drm_transmno,
      /psif/dtm_earl,
      /psif/dtm_lat,
      /psif/edidoctyp,
      /psif/edidoccnt,
      /psif/supp,
      /psif/name,
      /psif/description,
      idoctp,
      cimtyp,
      doctyp,
      rcvpor,
      rcvprt,
      rcvprn,
      //rcvpfc,
      sndpor,
      sndprt,
      sndprn,
      //sndpfc,
      docrel,
      outmod,
      serial,
      credat,
      cretim,
      rcvlad,
      sndlad,
      rcvsad,
      sndsad,
      refint,
      refgrp,
      refmes,
      arckey,
      std,
      stdvrs,
      stdmes,
      /psif/head_text,
      created_date,
      created_time,
      created_by,
      changed_date,
      changed_time,
      changed_by,
      erdat,
      erzet,
      ernam,
      soldto,
      soldto_name,
      shipto,
      shipto_name,
      billto,
      billto_name,
      payer,
      payer_name,
      hityp,
      soset,
      bustype,
      buscond,
      storenr,
      template,
      tempdescr,
      @ObjectModel.association.type:[#TO_COMPOSITION_CHILD]
      _Items, //    : redirected to composition child /PSIF/C_SLS_ITEM,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Partners // : redirected to composition child /PSIF/C_SLS_PARTNER
}
