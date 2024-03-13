trigger contactMailAddTrigger on Contact (before update) {
    Map<Id,Contact>accMap=new Map<Id,Contact>();
    accMap=Trigger.NewMap;
    List<Contact>conList=[SELECT Id,LastName,MailingAddress FROM Contact WHERE AccountId =:accMap.keyset()];

}