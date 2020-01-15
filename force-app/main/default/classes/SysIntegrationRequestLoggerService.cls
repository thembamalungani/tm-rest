/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to log http requests
 * @date 2019-10-01
 */
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
        String destinationService   = 'Salesforce';
        String method               = 'POST';

        Sys_Log_Integration__c log = SystemLogger.createIntegrationLog(
                                    requestString, 
                                    method, 
                                    sourceService, 
                                    destinationService,
                                    statusCode, 
                                    responseString
                                );

        insert log;
    }
}