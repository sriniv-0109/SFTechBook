trigger BulkLeadConversion on Lead (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){       
        LeadStatus lstatus=[SELECT Id,MasterLabel,isConverted FROM LeadStatus WHERE isConverted=true];
        List<Database.LeadConvert>convertList=new List<Database.LeadConvert>();
        for(Lead l:Trigger.New){
            if(l.Status==lstatus.MasterLabel && l.IsConverted==false){
                Database.LeadConvert lconvert=new Database.LeadConvert();
                lconvert.setLeadID(l.Id);
                lconvert.setSendNotificationEmail(true);
                lconvert.setDoNotCreateOpportunity(false);
                String oppName='Bulk-'+system.Today().format();
                lconvert.setOpportunityName(oppName);
                lconvert.setConvertedStatus(lstatus.MasterLabel);
                convertList.add(lconvert);                
            }
        }
        if(!convertList.isEmpty())
        {
            Database.LeadConvertResult[]leadres=Database.convertLead(convertList,false);
        }
        
    }

}