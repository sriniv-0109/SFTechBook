public class s_v36_Iterable implements Iterable<Account>{
 
    public Iterator<Account> Iterator(){
        List<Account>acclist=[SELECT Id,Name,Industry from Account LIMIT 3];
        return new s_v36_Iterator(acclist);        
    }    

}