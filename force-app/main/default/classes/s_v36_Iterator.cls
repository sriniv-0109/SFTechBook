public class s_v36_Iterator implements Iterator <Account> {
    List<Account> accList=new List<Account>();
    private Integer currentIndex;
    
    public s_v36_Iterator(List<Account>accs){
        accList=accs;
        currentIndex=0;        
    }
    public Boolean hasNext(){
        return currentIndex<accList.size();
    }
    
    public Account next(){
        if(hasNext()){
            return accList[currentIndex++];
        }
        else{
            system.debug('Iterator has no more elements');
            return null;
        }
    }

}