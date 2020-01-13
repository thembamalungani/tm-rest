/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for logger service
 * @date 2019-10-04
 */
public interface IHttpRequestLoggerService {
    /**
     * handles logging of http request and response
     * 
     * @param HttpRequest request
     * @param HttpResponse response
     * @return 
     */
    void log(BaseHttpRequest request, BaseHttpResponse response);
}