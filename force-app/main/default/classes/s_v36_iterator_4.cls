global class s_v36_iterator_4 implements Database.Batchable<Account>{
    global iterable<Account>Start(Database.BatchableContext bc){
    return new s_v36_Iterable();    
    }
    global void Execute(Database.BatchableContext bc,List<Account>objAcc){
        List<Account>accounts=new List<Account>();
        if(!objAcc.isEmpty()){
            for(Account ac:objAcc){
                ac.Name='Iterable';
                accounts.add(ac);
            }
            Database.update(accounts,false);
        }
    }
    global void Finish(Database.BatchableContext bc){
        
    }

}