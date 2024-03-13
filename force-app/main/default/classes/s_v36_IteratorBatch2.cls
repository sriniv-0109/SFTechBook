global class s_v36_IteratorBatch2 implements Database.Batchable<Account>{
    global iterable<Account> start(Database.BatchableContext bc){
        return new s_v36_IterableClass1();
    }
    global void Execute(Database.BatchableContext bc,List<Account>accounts){
        List<Account>accountList=new List<Account>();
        if(!accounts.isEmpty()){
            for(Account ac:accounts){
                ac.Name='Itarable 2';
                accountList.add(ac);
            }
            if(!accountList.isEmpty()){
                Database.saveResult[]saveRes=Database.update(accountList,false);
                for(Database.saveResult sr:saveRes){
                    system.debug('Succesfully updated record with Id:'+sr.getId());
                }
            }
        }
    }
    global void Finish(Database.BatchableContext bc){
        
    }

}