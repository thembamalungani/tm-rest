/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the contract for logging http requests.
 * @date 2019-09-06
 */
public interface IHttpRequestLogger {
    
    /**
     * handles logging of http request and response
     * 
     * @param IHttpRequest request
     * @param IHttpResponse response
     * @return 
     */
    void log(IHttpRequest request, IHttpResponse response);
}