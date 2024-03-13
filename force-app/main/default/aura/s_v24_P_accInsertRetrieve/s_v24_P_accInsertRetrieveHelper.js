({
	helperMethod : function(component,evtInfo) {        
        var action=component.get("c.getAccList");
        action.setParams({"aid":evtInfo});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS')
            {
                var result=response.getReturnValue();
                component.set("v.accountsList",result);
            }
        });
        $A.enqueueAction(action);
		
	}
})