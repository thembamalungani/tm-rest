public class HttpRequest {
    
    public String body;
    public String method;

    public String getBody() {

        return this.body;
    }

    public static HttpRequest fromContext(System.RestRequest restRequest) {

        HttpRequest request = new HttpRequest();

        request.body = restRequest.requestBody.toString();

        return request;
    }

}