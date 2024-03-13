({
	doinit : function(component, event, helper) {
        component.find("rec1").getNewRecord(
                                          "Contact",//objectApiName
                                          null,//recordTypeId
                                          false,//skipCache
            $A.getCallback(function(){
                                              var conRec=component.get("v.con");
                                              console.log("Contact details"+JSON.stringify(conRec));
                                              if(conRec==null)
                                              {
                                                  alert('Initialisation failed');
                                              }
                                              else
                                              {
                                                  alert('Initialisation success');
                                              }
                                             })
        );
		
	},
    handleSave : function(component, event, helper) {
        component.find("rec1").saveRecord(function(response){
            console.log('Response:'+JSON.Stringify(response));
            if(response.state=='SUCCESS')
            {
                alert('Contact created successfully:'+response.recordId);
            }
            else
            {
                alert('Contact creation failed:'+response.error);
            }
        });
    }
})