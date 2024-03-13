public class s_v36_IteratorClass1 implements Iterator<Account>{
    List<Account> accList=new List<Account>();
    private integer currentIndex;
    public s_v36_IteratorClass1(List<Account>accs){
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
            system.debug('No more elements');
            return null;
        }
    }

}