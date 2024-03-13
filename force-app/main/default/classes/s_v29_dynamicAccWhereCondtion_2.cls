/*
 * @Description:Get the Account Records dynamically applying where clause
 * @Author:S Sriniva Reddy
 * @createdDate:14-12-2023
 * @Last Modified Date:
*/
public class s_v29_dynamicAccWhereCondtion_2 {
    public static void getAccounts(){
        List<String> accIndlist=new List<String>{'Banking','Finance','Manufacturing','Entertainment'};
            for(Account acc:[SELECT Id,Name,Industry FROM Account WHERE Industry IN:accIndList LIMIT 10]){
                system.debug('Account name with the listed industries:'+acc);
            }    
    }
}