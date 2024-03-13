({
	handleSubme : function(component, event, helper) {
        component.find("rec1").saveRecord($A.getCallback(function(response){
            console.log('Response:'+JSON.stringify(repsonse));
            if(response.state=='SUCCESS')
            {
                alert('Update Success:'+response.recordId);
            }
            else if(repsonse.state=='Error')
            {
                component.set("v.recErrors",JSON.Stringify(response.error));
            }
            else if(response.state=='INCOMPLETE')
            {
                alert('Update failed due to incomplete');
            }
            else
            {
                alert('Unknown Error');
            }
        }));
		
	}
})