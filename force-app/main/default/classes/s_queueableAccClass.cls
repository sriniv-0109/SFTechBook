global class s_queueableAccClass implements system.Queueable{
    global void Execute(system.QueueableContext qc){
        Account ac=new Account();
        ac.Name='Queueable';
        ac.Industry='Banking';
        ac.Type='Prospect';
        ac.Phone='987987987';
        
        insert ac;
        if(ac.Id!=null){
            system.debug('Account created with Id:'+ac.Id);
            Id jobId=system.enqueueJob(new s_queueableConClass(ac));            
        }
    }

}