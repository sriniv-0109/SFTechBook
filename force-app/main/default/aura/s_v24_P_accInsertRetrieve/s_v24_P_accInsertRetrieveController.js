({
	doinit : function(component, event, helper) {
        var cols=[
                  {label:'Account Name',fieldName:'Name',type:'text'},
                  {label:'Account Phone',fieldName:'Phone',type:'text'},
                  {label:'Account Rating',fieldName:'Rating',type:'text'}
                 ];
        component.set("v.acolumns",cols);		
	},
    handleEvent: function(component, event, helper) {
        var evtInfo=event.getParam("accId");
        helper.helperMethod(component,evtInfo);
    }
})