public class s_v44_accSharing_1 {
    public static void accountShare(List<Account>accList){
        List<AccountShare>shareList=new List<AccountShare>();
        for(Account acc:accList){
            if(acc.Share_To__c!=null){
                AccountShare accShare=new AccountShare();
                accShare.AccountId=acc.Id;
                accShare.OpportunityAccessLevel='READ';                
                accShare.CaseAccessLevel='READ';
                accShare.RowCause='Manual';
                if(acc.AnnualRevenue>=5000000){
                    accShare.AccountAccessLevel='EDIT';                    
                }else
                {
                    accShare.AccountAccessLevel='READ';
                }
                shareList.add(accShare);
            }
            if(!shareList.isEmpty())
            {
                Database.saveResult[] shareResult=Database.insert(shareList,false);
            }            
        }
    }

}