public class s_v45_AccConWrapper_1 {
    public List<accConWrapper>wrapperList{get;set;}
    public List<Contact>conForSelectedAcc{get;set;}
    
    public s_v45_AccConWrapper_1(){
        wrapperList=new List<accConWrapper>();
        List<Account>accountsList=[SELECT Id,Name,Industry,(SELECT Name,Email,Account.Name FROM Contacts) FROM Account LIMIT 10];
        for(Account a:accountsList){
            wrapperList.add(new accConWrapper(a));            
        }
    }
    public void getConForAcc(){
     conForSelectedAcc=new List<Contact>();
     conForSelectedAcc.clear();
        for(accConWrapper obj:wrapperList){
            if(obj.isSelected==true){
                for(contact con:obj.ac.contacts){
                   conForSelectedAcc.add(con); 
                }
            }
        }
    }
    
    
    public class accConWrapper{
        public Account ac{get;set;}
        public Boolean isSelected{get;set;}
    
    public accConWrapper(Account acc){
        ac=acc;
        isSelected=false;
    }
    }   
}