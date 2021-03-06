public interface IHttpRequestLoggerService {
    
    /**
     * handles logging of http request and response
     * 
     * @param HttpRequest request
     * @param HttpResponse response
     * @return 
     */
    void log(HttpRequest request, HttpResponse response);
}
