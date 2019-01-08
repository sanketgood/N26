({
	getCostDetails : function(component) {
		var caseId = component.get("v.recordId");
       // alert(caseId);
        var action = component.get("c.fetchCostDetails");
        action.setParams({
            caseID : caseId
        });
        action.setCallback(this,function(a) {
            if(a.getState() === "SUCCESS") {
                alert(JSON.stringify(a.getReturnValue()));
                 component.set("v.CostDetailsLST",a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})