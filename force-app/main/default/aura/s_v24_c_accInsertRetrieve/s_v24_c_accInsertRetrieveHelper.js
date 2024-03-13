({
	helperMethod : function(component,accInfo) {
		//call the server side apex method
		var action=component.get("c.createAccount");
        action.setParams({"ac":accInfo});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var res=response.getReturnValue();
                var evt=component.getEvent("accEvent");
                evt.setParams({"accId":res});
                evt.fire();
            }
        });
        $A.enqueueAction(action);
	}
})