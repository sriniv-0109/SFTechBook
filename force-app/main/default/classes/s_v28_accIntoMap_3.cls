/*
 * @Description:Get the Contact Records and putting into map
 * @Author:S Sriniva Reddy
 * @createdDate:14-12-2023
 * @Last Modified Date:
*/
public class s_v28_accIntoMap_3 {
/*
 * @Description:Get the Contact Records
 * @Author:S Sriniva Reddy
 * @createdDate:14-12-2023
 * @Last Modified Date:
*/
    public static void getAccounts(){
        Map<Id,sobject>accMap=new Map<Id,sobject>();
        List<Account>accList=[SELECT Id,Name,Phone FROM Account LIMIT 5];
        if(!accList.isEmpty()){
            for(Account ac:accList){
                accMap.put(ac.Id,ac);
            }
            system.debug('Account Map:'+accMap);
        }
    }

}