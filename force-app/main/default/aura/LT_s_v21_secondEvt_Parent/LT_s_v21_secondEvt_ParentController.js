({
	handleEvent : function(component, event, helper) {
        var evtparams=event.getParam("eName");
        alert('This is the employee name from Child component:'+evtparams);
		
	}
})