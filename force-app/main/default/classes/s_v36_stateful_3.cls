global class s_v36_stateful_3 implements Database.Batchable<sObject>,Database.stateful{
    global Integer Count=0;//to know the no of records process in batch execution
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='SELECT Id,Name,Type,Industry FROM Account';
        return Database.getQueryLocator(query);
    }
    global void Execute(Database.BatchableContext bc,List<sObject> objList){
        
        List<Account>accList=(List<Account>)objList;
        for(Account ac:accList){
            if(ac.Industry=='Chemicals'){                
                Count++;               
            }
        }        
    }
    global void Finish(Database.BatchableContext bc){
        system.debug('Account proceed with Customer-Direct:'+Count);
    }

}