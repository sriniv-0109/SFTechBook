({
    doinit : function(component, event, helper) {
        //define columns
        var cols=[
            {label:'Account Name',fieldName:'Name',type:'text'},
            {label:'Account Phone',fieldName:'Phone',type:'text'},
            {label:'Account Rating',fieldName:'Rating',type:'text'}
        ];
        component.set("v.acols",cols);
    },
	handleEvent : function(component, event, helper) {
		var parentData=component.get("v.accountsData");
        var evtData=event.getParam("accEve");
        parentData.push(evtData);
        component.set("v.accountsData",parentData);
	}
})