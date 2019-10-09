public with sharing class SysIntegrationRequestLoggerService implements IHttpRequestLoggerService{
    
    void log(HttpRequest request, HttpResponse response) {

        System.debug('Logging');
    }
}
