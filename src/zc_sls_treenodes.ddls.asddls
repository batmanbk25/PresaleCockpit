@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tree Nodes Menu'


@ObjectModel.semanticKey: [ 'NodeID' ]
@ObjectModel.representativeKey: 'NodeID' 
@ObjectModel.modelCategory:#BUSINESS_OBJECT
@ObjectModel.compositionRoot:true
@ObjectModel.transactionalProcessingEnabled:true
@ObjectModel.writeActivePersistence:'/psif/sls_treen'
@ObjectModel.createEnabled:true
@ObjectModel.deleteEnabled:true
@ObjectModel.updateEnabled:true
//@ObjectModel.draftEnabled: true
@Metadata.allowExtensions: true

@UI: { headerInfo: { typeName: 'Presale Cockpit Suite: Menu',
                     title: { label: 'NodeID' }, // Defines the value shown in title section
                     description: { value: 'NodeID' },
                     typeNamePlural: 'Presale Cockpit Suite: Menu'
                   },
                   badge.headLine.value : 'NodeID'
     }

@Analytics : { dataCategory : #DIMENSION }
//@ObjectModel: { dataCategory: #HIERARCHY }
@Hierarchy.parentChild : [ { name : 'Menu', 
                            recurse : {  parent : [ 'ParentsID' ] ,
                                           child : [ 'NodeID'] } 
                              } ] 
                              
@OData.publish: true
define view entity ZC_SLS_TREENODES
  as select from ZI_SLS_TREENODES
  association [1..1] to ZC_SLS_HDR as _PresaleHeader on $projection.NodeID = _PresaleHeader.NodeID
{

      @UI.facet:[
      { id:     'Header1',
      purpose:  #HEADER,
      type:     #FIELDGROUP_REFERENCE,
      //label:    'Header',
      targetQualifier: '_Header1',
      position: 10 },
      {id: 'Header',
      purpose: #STANDARD,
      type: #COLLECTION,
      label: 'Header',
      position: 10 },
      {id: '_PresaleHeadertab',
      purpose: #STANDARD,
      type: #FIELDGROUP_REFERENCE,
      label: 'Presale Header',
      targetQualifier: '_PresaleHeadertab',
      position: 20,
      parentId: 'Header' }
      ]

      //      @UI.lineItem: [ { label: 'Node ID' } ]
      @EndUserText.label: 'Node ID'
      @UI.identification: [ { label: 'Node ID' } ]
      @UI.fieldGroup: [{ position: 10, qualifier: '_Header1', label: 'Node ID' }]

  key NodeID,

      //      @UI.lineItem: [ { label: 'Parents ID' } ]
      @UI.identification: [ { label: 'Parents ID' } ]
      @EndUserText.label: 'Parents ID'
      ParentsID,

      //      @UI.lineItem: [ {  label: 'Hierlevel' } ]
      @EndUserText.label: 'Hierlevel'
      Hierlevel,

      @EndUserText.label: 'Drilldownstate'
      //      @UI.lineItem: [ { label: 'Drilldownstate' } ]
      Drilldownstate,

      @EndUserText.label: 'Description'
      @UI.lineItem: [{ position: 10, label: 'Description', type: #STANDARD, iconUrl: 'iconURL'} ,
                      {
                    label: 'Create New',
                    dataAction: 'PUSHDOWN:ZC_SLS_TREENODESCreate',
                    invocationGrouping: #ISOLATED,
                    type: #FOR_ACTION,
                    position: 1
                  }]
      @UI.identification: [ { position: 10, label: 'Description' } ]
      @UI.fieldGroup: [{ position: 10, qualifier: '_PresaleHeadertab', label: 'Description' }]
      Description,

      @EndUserText.label: 'Presaletype'
      @UI.identification: [ { position: 10, label: 'Presaletype' } ]
      @UI.fieldGroup: [{ position: 20, qualifier: '_PresaleHeadertab', label: 'Presaletype' }]
      Presaletype,

      @EndUserText.label: 'PostStatus'
      @UI.identification: [ { position: 10, label: 'PostStatus' } ]
      @UI.fieldGroup: [{ position: 30, qualifier: '_PresaleHeadertab', label: 'PostStatus' }]
      PostStatus,

      //@UI.lineItem: [ { position: 2, label: 'iconURL', iconUrl: 'iconURL' } ]
      iconURL,
       @ObjectModel.association.type:[#TO_COMPOSITION_CHILD] 
      _PresaleHeader
}
