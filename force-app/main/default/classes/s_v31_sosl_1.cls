/*
 *@Description:getting accounts and contacts through sosl
 *@Author:S Srinivas Reddy
 *@Created Date:15/12/2023
 *@Last Modified Date:
*/
public class s_v31_sosl_1 {
    public static void getRecords()
    {
        List<List<sObject>> listResult=new List<List<sObject>>();
        listResult=[FIND 'Json' IN ALL FIELDS  RETURNING Account(Name),Contact(FirstName,LastName)];
        Account[] accList=(Account[])listResult[0];
        for(Account ac:accList)
        {
            system.debug(ac);
        }
        Contact[] conList=(Contact[])listResult[1];
        for(Contact con:conList)
        {
            system.debug(con);
        }
    }

}