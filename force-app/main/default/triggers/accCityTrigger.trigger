trigger accCityTrigger on Account (before insert,before update) {
    List<Account>accList=new List<Account>();
    accList=Trigger.New;
    for(Account acc:accList){
        acc.ShippingCity=acc.BillingCIty;
        
    }
   

}