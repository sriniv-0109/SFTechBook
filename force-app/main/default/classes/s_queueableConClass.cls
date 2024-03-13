global class s_queueableConClass implements system.Queueable{
    Account ac=new Account();
    public s_queueableConClass(Account accountFromAcc){
        this.ac=accountFromAcc;        
    }
    global void Execute(system.queueableContext qc){
        Contact con=new Contact();
        con.FirstName='Modi';
        con.LastName='Naren';
        con.Email='N@m.com';
        con.Phone='999987666';
        con.AccountId=ac.Id;
        
        insert con;
        if(con.Id!=null){
            system.debug('Contact with Id:'+con.Id);           
        }
    }
}