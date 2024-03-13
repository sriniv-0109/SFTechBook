global class s_v34_batchapex_1 implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query='SELECT Id,Name,Industry,Active__c FROM Account';        
        return Database.getQueryLocator(query);
    }
    global void Execute(Database.BatchableContext bc, List<sObject> objres)
    {
        if(!objres.isEmpty()){
            List<Account>accList=new List<Account>();
            for(sObject s:objres){
                Account ac=(Account)s;
                ac.Active__c='No';
                accList.add(ac);
            }
            if(!accList.isEmpty())
            Database.update(accList,false);
            
        }
        
    }
    global void finish(Database.BatchableContext bc)
    {
        AsyncApexJob ajob=[SELECT Id, JobType, Status, JobItemsProcessed, TotalJobItems FROM AsyncApexJob WHERE id=:bc.getJobId()];
        system.debug(ajob);
    }

}