/*
 * @Description:Get the Account Records
 * @Author:S Sriniva Reddy
 * @createdDate:14-12-2023
 * @Last Modified Date:
*/
public class s_v28_dynamicSOQL_2 {
/*
 * @Description:Get the Account Records
 * @Author:S Sriniva Reddy
 * @createdDate:14-12-2023
 * @Last Modified Date:
*/
    public static void getAccounts(){
        String accName='SuperStar';
        String accQuery='SELECT Id,name,Industry FROM Account WHERE Name='+'\''+accName+'\'';
        system.debug(Database.query(accQuery));
    }
}