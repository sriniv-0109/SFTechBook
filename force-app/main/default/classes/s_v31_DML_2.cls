public class s_v31_DML_2 {
    public static void delLeadd(String leadtxt){
        system.debug(leadtxt);
        /* ---One way of deleting--
        List<Lead>leadList=[SELECT Id FROM Lead WHERE LastName LIKE:leadtxt+'%'];
        system.debug(leadList);
        delete leadList;
        */
        /* other way developers in realtime follow*/
        delete [SELECT Id FROM Lead WHERE LastName LIKE:leadtxt+'%'];
        //after delete only one space and then query.
        //if we give two spaces between delete dml and query then everything might get deleted 
    }

}