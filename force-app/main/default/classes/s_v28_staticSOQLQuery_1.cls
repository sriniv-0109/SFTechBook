/*
 * @Description:Get the Contact Records
 * @Author:S Sriniva Reddy
 * @createdDate:14-12-2023
 * @Last Modified Date:
*/
public class s_v28_staticSOQLQuery_1 {
    /*
         * @Description:Get the Contact Records
         * @Author:S Sriniva Reddy
         * @createdDate:14-12-2023
         * @Last Modified Date:
     */ 
    public static void getContacts(){
        List<Contact> conList=[SELECT Id,Name,Email,Phone FROM Contact LIMIT 3];
        if(!conList.isEmpty())
        {
            for(Contact con:conList)
            {
                system.debug('Contact Name:'+con.Name);
                system.debug('Contact Email:'+con.Email);
                system.debug('Contact Phone:'+con.Phone);
            }
                
        }
    }
    
    public static void getContacts2(){ 
        for(Contact con:[SELECT Id,Name,Email,Phone FROM Contact LIMIT 5])
        {            
                system.debug('Contact Name:'+con.Name);
                system.debug('Contact Email:'+con.Email);
                system.debug('Contact Phone:'+con.Phone);       
    }

}
}