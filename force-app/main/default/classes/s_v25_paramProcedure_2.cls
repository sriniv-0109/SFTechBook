/*
 * @description:creating account and contact based on the id generated by Account
 * @Author:s srinivas reddy
 * @createdDate:13/12/2023
*/
public class s_v25_paramProcedure_2 {
    public static void createNewAccount(String acName,String acType,String acRating,String acPhone)
    {
        Account acc=new Account();
        acc.Name=acName;
        acc.Type=acType;
        acc.Rating=acRating;
        acc.Phone=acPhone;
        insert acc;        
        createNewContact(acc.Id,acName,acPhone);
    }
    
    public static void createNewContact(String acId,String lname,String cphone)
    {
        Contact con=new Contact();       
        con.LastName=lname;        
        con.Phone=cphone;
        con.AccountId=acId;
        insert con;        
    }

}