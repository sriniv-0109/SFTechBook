({
	handleBtn : function(component, event, helper) {
        $A.createComponent(
            "lightning:button",
            {
                "label":"Button-Dynamic",
                "variant":"success",
               "onclick":component.getReference("c.handleBtn1")
            },
            function(cmp,status,errorMessage){
                if(status=='SUCCESS'){
                    var b=component.get("v.body");
                    b.push(cmp);
                    component.set("v.body",b);
                }
                else
                {
                    alert('component creation failes:'+errorMessage);
                }
            }
            );
		
	},
    handleBtn1 : function(component, event, helper) {
        $A.createComponent("lightning:button",
                           {
                               "label":"Button-Dynamic2",
                               "variant":"destructive",
                               "onclick":component.getReference("c.handlealert")
                           },
                           function(ccmp,status,errorMessage){
                               if(status=='SUCCESS')
                               {
                                var bb=component.get("v.body");
                                   bb.push(ccmp);
                                   component.set("v.body",bb);
                               }
                               else
                               {
                                   alert('Dynamic component creatoin failed:'+errorMessage);
                               }
                           }
                          );
        
    },
    handlealert: function(component, event, helper) {
        alert('Dynamic components created');
    }
    
})