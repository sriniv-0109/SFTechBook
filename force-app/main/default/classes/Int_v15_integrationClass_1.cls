public class Int_v15_integrationClass_1 {
    public String accessToken{set;get;}
    public String instanceURL{set;get;}
    public String searchLeadName{set;get;}
    public List<leadResponse>leadResponseList{set;get;}
    public String lfirstnm{set;get;}
    public String llastnm{set;get;}
    public String lem{set;get;}
    public String lcm{set;get;}
    public String lmp{set;get;}
    public String responseFromServer{set;get;}
    public Int_v15_integrationClass_1()
    {
        //this is for initialisation
        leadResponseList=new  List<leadResponse>();
    }
    public void reqAccessToken()
    {
        List<Integration_Setup__c>intclsList=[SELECT clientId__c,clientSecret__c,Server_username__c,
                             Server_password__c,Server_Name__c FROM Integration_Setup__c WHERE Server_Name__c='ssinfo'];
        if(intclsList!=null && intclsList.size()>0)
        {
        String endpoint='https://login.salesforce.com/services/oauth2/token?grant_type=password';
        endpoint=endpoint+'&client_id='+intclsList[0].clientId__c;
        endpoint=endpoint+'&client_secret='+intclsList[0].clientSecret__c;
        endpoint=endpoint+'&username='+intclsList[0].Server_username__c;
        endpoint=endpoint+'&password='+intclsList[0].Server_password__c;
        HTTP p=new HTTP();
        HTTPRequest req=new HTTPRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');//since we are posting clientid,secret etc to get accesstoken
        blob headerValue=blob.valueOf(intclsList[0].Server_username__c+':'+intclsList[0].Server_password__c);
        String authorization='BASIC'+EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorisation',authorization);
        HTTPResponse resp=p.send(req);
        system.debug('Response:'+resp.getBody());
        //now deserialisation    
        JSONParser jp=JSON.createParser(resp.getBody()); 
        while(jp.nextToken()!=null)
        {
            if(jp.getText()=='access_token')
            {
                jp.nextToken();
                accessToken=jp.getText();
            }
            if(jp.getText()=='instance_url')
            {
                jp.nextToken();
                instanceURL=jp.getText();
            }
        }
        }
    }
    public void requestToken()
    {
        reqAccessToken();
        //now after getting the access token,now we need to get the lead deatils.to do so we need endpoint
        //so we get the instanceUrl and the path of the workbench
        String getLeadEndpoint=instanceURL+'/services/apexrest/LeadService/name='+searchLeadName;
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndPoint(getLeadEndpoint);
        request.setMethod('GET');   //this we have implemented REST in server
        request.setHeader('Authorization', 'Bearer '+accessToken);//here space must be given after Bearer ie 'Bearer '
        request.setHeader('Content-Type','application/json');
        HttpResponse resp=p.send(request);
        system.debug('Response:'+resp.getBody());
        if(resp.getStatusCode()==200)
        {
            leadResponseList=(List<leadResponse>)JSON.deserialize(resp.getBody(),List<leadResponse>.class);
        }
        system.debug('List ofResponse:'+leadResponseList);
        system.debug('Status Code:'+resp.getStatusCode());
        
    }
    public void createLead()
    {
        
        //need to send data in the form of JSON to the rest method in server
        JSONGenerator gen=JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('lfname',lfirstnm);
        gen.writeStringField('llastname',llastnm);
        gen.writeStringField('lemail',lem);
        gen.writeStringField('leadcmp',lcm);
        gen.writeStringField('lmobile',lmp);
        gen.writeEndObject();
        String requestJson=gen.getAsString();
        reqAccessToken();  //we need access token and instance  url
        String getLeadEndPoint=instanceURL+'/services/apexrest/LeadService/';
        Http p=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint(getLeadEndPoint);
        req.setMethod('POST');
        req.setBody(requestJson);
        req.setHeader('Authorization','Bearer '+accessToken);
        req.setHeader('Content-type','application/json');
        HttpResponse resp=p.send(req);
        responseFromServer=resp.getBody();
        system.debug('Response from server:'+responseFromServer);
    }
    
    //create wrapper object to store live data
    public class leadResponse{
        public String id{set;get;}
        public String Name{set;get;}
        public String Email{set;get;}
        public String MobilePhone{set;get;}
        public String Company{set;get;}        
    }
}