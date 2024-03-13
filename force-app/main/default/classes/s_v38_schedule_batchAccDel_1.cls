global class s_v38_schedule_batchAccDel_1 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.batchableContext bc){
        String query='SELECT Id,Name,Industry from Account WHERE Industry=Entertainment';
        return Database.getQueryLocator(query);
    }
    global void Execute(Database.batchableContext bc,List<sObject> obj){
        List<Account>acc=(List<Account>)obj;
        if(!acc.isEmpty()){
            Database.delete(acc,false);
        }
    }
    global void Finish(Database.batchableContext bc){
        
    }
}