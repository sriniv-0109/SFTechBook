/*
 * @Description:Get the Account Records using LIKE 
 * @Author:S Srinivas Reddy
 * @CreatedDate:14/12/2023
 * @Last Modified Date:
 */
public class s_v30_LIKE_1 {
 /*
 * @Description:Get the Account Records using LIKE 
 * @Author:S Srinivas Reddy
 * @CreatedDate:14/12/2023
 * @Last Modified Date:
 */
    public static void getAccounts(String txt){
        List<Account>accList=[SELECT Id,Name FROM Account WHERE Name LIKE:txt+'%'];
        for(Account ac:accList)
        {
         system.debug(ac);   
        }
        
    }

}