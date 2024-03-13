public class s_v36_IterableClass1 implements Iterable<Account>{
    public Iterator<Account> Iterator(){
        List<Account>accounts=[SELECT Id,Name FROM Account LIMIT 4];
        return new s_v36_IteratorClass1(accounts);
    }
}