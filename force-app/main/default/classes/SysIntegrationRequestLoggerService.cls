public with sharing class SysIntegrationRequestLoggerService implements IHttpRequestLoggerService{
    
    public void log(HttpRequest request, HttpResponse response) {

        System.debug('Logging');
    }
}
