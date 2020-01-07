public class SysIntegrationRequestLoggerService implements IHttpRequestLoggerService{
    /**
     * Logs the http request and response
     * 
     * @param BaseHttpRequest request
     * @param BaseHttpResponse response
     * @return 
     */
    public void log(BaseHttpRequest request, BaseHttpResponse response) {

        String requestString        = JSON.serialize(request.body);
        String responseString       = JSON.serialize(response.body);
        Integer statusCode          = response.httpCode;
        String sourceService        = '/services/apexrest/leads';
        String dentinationService   = 'Salesforce';
        String method               = 'POST';

        Sys_Log_Integration__c log = SystemLogger.createIntegrationLog(
                                    requestString, 
                                    method, 
                                    sourceService, 
                                    dentinationService, 
                                    statusCode, 
                                    responseString
                                );

        insert log;
    }
}