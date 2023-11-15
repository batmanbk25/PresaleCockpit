@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SLS_PARTNER as select from /psif/sls_partnr 
{
  @UI.lineItem: [ { position: 10, label: 'Presale_Document' } ]
  @UI: { identification:[ { position: 10, label: 'Presale_Document' } ]}
    key presales_no,  //Pre-Sales Number     
  @UI.lineItem: [ { position: 20, label: 'Item' } ]
  @UI: { identification:[ { position: 20, label: 'Item' } ]}       
    key pre_posnr, //Item         
  @UI.lineItem: [ { position: 30, label: 'Partner Function' } ]
  @UI: { identification:[ { position: 30, label: 'Partner Function' } ]}   
    key cast ( parvw as char2) as parvw,  //Partner Functn       
  @UI.lineItem: [ { position: 40, label: 'Customer' } ]
  @UI: { identification:[ { position: 40, label: 'Customer' } ]}   
    kunnr, //Customer        
  @UI.lineItem: [ { position: 50, label: 'Name ' } ]
  @UI: { identification:[ { position: 50, label: 'Name ' } ]}    
    name    //Last name  
//    _Header         
}
