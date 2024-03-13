({
	handleSubme : function(component, event, helper) {
        var ee=component.get("v.empName");
		var evt=component.getEvent("second");
        evt.setParams({"eName":ee});
        evt.fire();
	}
})