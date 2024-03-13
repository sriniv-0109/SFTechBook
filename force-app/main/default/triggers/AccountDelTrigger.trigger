trigger AccountDelTrigger on Account (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        for(Account acc:Trigger.Old){
            if(acc.Active__c=='Yes'){
                acc.addError('Active Records cannot be deleted');
            }
        }
    }

}