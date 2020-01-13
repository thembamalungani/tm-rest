/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Http request object
 * @date 2019-10-01
 */
public class BaseHttpRequest {
    
    public String body;
    public String method;

    /**
     * Returns the body of the request
     *
     * @return String
     */
    public String getBody() {
        return this.body;
    }

    /**
     * Creates a BaseHttpRequest instance from System.RestRequest
     * 
     * @param System.RestRequest restRequest
     * @return BaseHttpRequest
     */
    public static BaseHttpRequest fromContext(System.RestRequest restRequest) {

        BaseHttpRequest request = new BaseHttpRequest();
        request.body = restRequest.requestBody.toString();
        return request;
    }
}