@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parent Node of PresaleDoc'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SLS_HDR_PNODE as select from ztb_sls_hdr  --/psif/sls_hdr
association [0..1] to ztb_sls_treen  as _TreeNode  --/psif/sls_treen
 on $projection./psif/type = _TreeNode.presaletype and $projection./psif/status = _TreeNode.pstatus 
{
  key presales_no as Presale_Document,
  cast( concat(concat(/psif/type,/psif/status),presales_no) as abap.char( 20 ) ) as NodeID,
//  presales_no as NodeID,
  /psif/type,
  /psif/status,
  _TreeNode.nodeid as ParentsID,
  ( _TreeNode.hierlevel + 1 ) as Hierlevel,
//  0 as Hierlevel,
//  'expanded' as Drilldownstate
  'leaf' as Drilldownstate
}
