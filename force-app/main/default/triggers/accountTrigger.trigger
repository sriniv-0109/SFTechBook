trigger accountTrigger on Account (before insert,before update,after insert) {
  /*  accountTrigger__c taccess=accountTrigger__c.getInstance(UserInfo.getUserId());
    if(taccess.checkBox__c){
        
        List<Account>accList=new List<Account>();
        accList=Trigger.New;
        for(Account acc:accList){
        if(acc.Industry==null || acc.Industry=='')
        {
            acc.addError('Please enter the Industry field value');
        }
        else if(acc.Website==null || acc.Website=='')
        {
            acc.addError('Please enter the Website field value');
        }
        else  if(acc.Fax==null || acc.Fax=='')
        {
            acc.addError('Please enter the Fax field value');
        }
    }
        
    }
*/
    Map<String,TriggerAccess__c> orgWideaccess=TriggerAccess__c.getAll();
    if(orgWideaccess.get('accountTrigger').Active__c)
    {
         List<Account>accList=new List<Account>();
        accList=Trigger.New;
        for(Account acc:accList){
        if(acc.Industry==null || acc.Industry=='')
        {
            acc.addError('Please enter the Industry field value');
        }
        else if(acc.Website==null || acc.Website=='')
        {
            acc.addError('Please enter the Website field value');
        }
        else  if(acc.Fax==null || acc.Fax=='')
        {
            acc.addError('Please enter the Fax field value');
        }
    }        
    }
    
    
}