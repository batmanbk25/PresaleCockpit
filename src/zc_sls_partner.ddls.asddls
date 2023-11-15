@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.modelCategory: #BUSINESS_OBJECT
@ObjectModel.representativeKey: 'parvw'
@ObjectModel.semanticKey: [ 'presales_no' , 'pre_posnr', 'parvw' ] 
@ObjectModel.transactionalProcessingEnabled:true
@ObjectModel.writeActivePersistence:'/psif/sls_partnr'
//@ObjectModel.writeDraftPersistence: '/psif/sls_hdr_d'
//@ObjectModel.draftEnabled: true
@ObjectModel.createEnabled:true 
//@ObjectModel.deleteEnabled:true
@ObjectModel.updateEnabled:true

@UI.headerInfo: {
      title: {
        label: 'Partner',
        value: 'parvw',
        type: #WITH_URL
      }, 
    typeName: 'Partners',
    typeNamePlural: 'Partners'
}
define view entity ZC_SLS_PARTNER  
as select from ZI_SLS_PARTNER 
{
  @UI.lineItem: [ { position: 10, label: 'Presale_Document' } ]
  @UI: { identification:[ { position: 10, label: 'Presale_Document' } ]}
    key presales_no,  //Pre-Sales Number     
  @UI.lineItem: [ { position: 20, label: 'Item' } ]
  @UI: { identification:[ { position: 20, label: 'Item' } ]}       
    key pre_posnr, //Item         
  @UI.lineItem: [ { position: 30, label: 'Partner Function' } ]
  @UI: { identification:[ { position: 30, label: 'Partner Function' } ]}   
  key parvw,     
  @UI.lineItem: [ { position: 40, label: 'Customer' } ]
  @UI: { identification:[ { position: 40, label: 'Customer' } ]}   
    kunnr, //Customer        
  @UI.lineItem: [ { position: 50, label: 'Name ' } ]
  @UI: { identification:[ { position: 50, label: 'Name ' } ]}    
    name    //Last name  
    //_Header         :  redirected to parent /PSIF/C_SLS_HDR
}
