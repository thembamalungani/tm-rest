public class BaseHttpRequest {
    
    public String body;
    public String method;

    public String getBody() {
        return this.body;
    }

    public static BaseHttpRequest fromContext(System.RestRequest restRequest) {

        BaseHttpRequest request = new BaseHttpRequest();
        request.body = restRequest.requestBody.toString();
        return request;
    }
}