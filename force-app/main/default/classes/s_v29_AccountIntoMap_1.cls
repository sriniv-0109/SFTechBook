/*
 * @Description:Get the Account Records and putting into map
 * @Author:S Sriniva Reddy
 * @createdDate:14-12-2023
 * @Last Modified Date:
*/
public class s_v29_AccountIntoMap_1 {
    public static void getAccounts(){
        Map<Id,Account> accMap=new Map<Id,Account>([SELECT Id,Name FROM Account  LIMIT 5]);
        system.debug(accMap);
        for(Account ac:accMap.values()){
            system.debug('Keys of the Map:'+ac);
        }        
    }
}