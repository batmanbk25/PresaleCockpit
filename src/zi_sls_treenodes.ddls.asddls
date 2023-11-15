@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tree Nodes Menu'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_SLS_TREENODES
  as select from ztb_sls_treen --/psif/sls_treen 
{ 
  key nodeid         as NodeID,
      parentsid      as ParentsID,
      hierlevel      as Hierlevel,
      drilldownstate as Drilldownstate,
      description    as Description,
      presaletype    as Presaletype,
      pstatus        as PostStatus,
      iconurl        as iconURL 
}

union select from ZI_SLS_HEADER
{ 
  key NodeID, 
      ParentsID,  
      Hierlevel, 
      Drilldownstate, 
      Presale_Document as Description,
      /psif/type as Presaletype,
      /psif/status as PostStatus ,
      ''        as iconURL
}
