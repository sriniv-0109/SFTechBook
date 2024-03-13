trigger AccountCustomMetaDataTrigger on Account (after update) {
    
    if(Trigger.isAfter && Trigger.isUpdate){ 
        List<Account>accList=new List<Account>();
        for(Account ac:Trigger.New){
            if(ac.Location__c!=Trigger.OldMap.get(ac.Id).Location__c){
                Account a=new Account();
                a.Id=ac.Id;
                a.Office_Address__c=AddressLocation__mdt.getInstance(ac.Location__c).OfficeAddress__c;
                accList.add(a);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }

}