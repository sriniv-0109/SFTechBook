public with sharing class s_v24_accInsertRetrieve {
    @AuraEnabled
    public static String createAccount(Account ac){
        insert ac;
        return ac.Id;        
    }
    
    @AuraEnabled
    public static List<Account> getAccList(String aid){
        List<Account>accountsList=[SELECT Id,Name,Phone,Rating FROM Account WHERE Id=:aid];
        return accountsList;
    }

}