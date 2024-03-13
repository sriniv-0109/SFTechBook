public class s_v35_sendEmail_1 {
    public static void createLead(){
        List<Lead>leadList=new List<Lead>();
        List<String>emList=new List<String>();
        for(Integer count=1;count<4;count++){
          Lead ld=new Lead();
          ld.LastName='SFDC'+count;
          ld.Company='Salesforce'+count;
          ld.Email='seenu5087@gmail.com' ;
          leadList.add(ld);           
        } 
        if(!leadList.isEmpty()){
            Database.saveResult[]result=Database.insert(leadList,false);
            sendNotification(leadList);
        }
    }
    public static void sendNotification(List<Lead>ldList){
        List<Messaging.singleEmailMessage> emailList=new List<Messaging.singleEmailMessage>();
        for(Lead l:ldList){
            Messaging.singleEmailMessage email=new Messaging.singleEmailMessage();
            //toAddress
            String[] toAddress=new String[]{l.Email};
            email.setToAddresses(toAddress);
            
            //SenderDisplayName
            String displayName='Salesforce Help center';
            email.setSenderDisplayName(displayName);
            
            //set ReplyTo
            String replyTo='SalesForce@gmail.com';
            email.setReplyTo(replyTo);
            
            //set subject
            String sub='Thank you for your Interest,'+l.LastName+'.';
            email.setSubject(sub);
            
            //set email body
            String emailContent='Hi'+l.LastName+', <br/><br/>'+
                'Thank you for your interest!<br><br/>'+
                'We are working on your data,our team will reach you soon<br/><br/>'+
                'Your Information:<br/><br/>'+
                 'Lead Name:'+l.LastName+',<br/>'+
                 'Company:'+l.Company+',<br/>'+
                 'Email :'+l.Email+',<br><br/>'+
                 'Thank You.';
            email.setHTMLBody(emailContent);
            
            //set file attachment
            Messaging.EmailFileAttachment emailAttach=new Messaging.EmailFileAttachment();
            emailAttach.setFileName(l.LastName+'.pdf');
            emailAttach.setContentType('Application/pdf');
            emailAttach.body=Blob.toPdf(emailContent);
            List<Messaging.EMailFileAttachment>fileAttachments=new List<Messaging.EMailFileAttachment>();
            fileAttachments.add(emailAttach);
            email.setFileAttachments(fileAttachments);
            emailList.add(email);
            Messaging.sendEmailResult[] emailResult=Messaging.sendEmail(emailList);     
        }
        
    }

}