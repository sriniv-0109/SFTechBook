trigger LeadIndustryTrigger on Lead (before insert,before update) {
    
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Lead ld:Trigger.New){
            Switch ON ld.Industry
            {
                when 'Banking'
                {
                    ld.AnnualRevenue=9000000;
                }
                 when 'Finance'
                {
                    ld.AnnualRevenue=8400000;
                }
                 when 'Insurance'
                {
                    ld.AnnualRevenue=7000000;
                }
                 when 'Education'
                {
                    ld.AnnualRevenue=1000000;
                }
            }
        }
    }

}