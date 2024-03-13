({
	handleSave : function(component, event, helper) {
        var childData=component.get("v.accs");
        //get the event
        var evt=component.getEvent("acEvent");
        
        //set the parameters
        evt.setParams({"accEve":childData});
        
        //fire the event
        evt.fire();
        
        //set the fields inputs to null after save
        component.set("v.accs",{sObjectType:'Account',
                                'Name':'',
                                'Phone':'',
                                'Rating':''
                               });
		
	}
})