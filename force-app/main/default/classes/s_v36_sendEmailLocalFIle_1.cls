public class s_v36_sendEmailLocalFIle_1 {
    public static void createLeads(){
        List<Lead>leadList=new List<Lead>();
        for(Integer i=1;i<4;i++){
            Lead ld=new Lead();
            ld.LastName='One+'+i;
            ld.Company='OnePlus Ltd'+i;
            ld.Email='seenu5087@gmail.com';
            leadList.add(ld);
        }
        if(!leadList.isEmpty())
        {
            Database.saveResult[] leadResult=Database.insert(leadList,false);
            system.debug(leadResult);
            sendEmails(leadList);
        }
    }
    public static void sendEmails(List<Lead>leads){
        List<Messaging.singleEmailMessage>emailList=new List<Messaging.singleEmailMessage>();
        for(Lead l:leads){
            Messaging.singleEmailMessage email=new Messaging.singleEmailMessage();
            
            //set toaddresses
            String[] toAdd=new String[]{l.Email};
            email.setToAddresses(toAdd);
            
            //set Reply to
            String replyTo='hdfcSupport@gmail.com';
            email.setReplyTo(replyTo);
            
            //set subject
            String sub='Thank you for contacting HDFC,'+l.LastName;
            email.setSubject(sub);

            //set sender Display Name
            String displayName='Welcome to HDFC';
            email.setSenderDisplayName(displayName);
            
            //set email body
            String emailBody='Dear,'+l.LastName+'<br/><br/>'+
                'Thank you for showing interest in HDFC'+',<br/>'+
                'Our team will contact you soon,plase check your data we received below'+'.<br/>'+
                'Lead Name:'+l.LastName+',<br/>'+
                'Lead Company:'+l.Company+',<br/>'+
                'Email :'+l.Email+'.<br/>'+
                'Thank you.';
            email.setHTMLBody(emailBody);
            
            //filea attchments
            Messaging.EmailFileAttachment attach=new Messaging.EmailFileAttachment();
            Document doc=[SELECT Id,Name, ContentType, Body, DeveloperName FROM Document WHERE DeveloperName='HDFCDocument'];
            attach.setFileName(doc.Name);
            attach.setcontentType(doc.ContentType);
            attach.setBody(doc.Body);
            
            List<Messaging.EmailFileAttachment>fileAttachments=new List<Messaging.EmailFIleAttachment>();
            fileAttachments.add(attach);
            
            email.setFileAttachments(fileAttachments);
            
            emailList.add(email);
            Messaging.sendEmailResult[] emailResult=Messaging.sendEmail(emailList);
            
        }
    }

}