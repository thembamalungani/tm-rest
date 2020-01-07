/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the handler for lead REST API
 * @date 2019-09-06
 */
public class RequestDispatcher implements IRestDispatcher {
    /**
     * Dispatch the request to be handled asynchronously
     *
     * @param Type handler
     */
    public BaseHttpResponse dispatch(Type type) {
        return process(type);
    }

    /**
     * Handles the http request by delegating the handling to the instance of HttpRouteHandler
     * passed
     *
     * @param Type type
     * @return HttpResponse
     */
    private BaseHttpResponse process(Type type) {

        BaseHttpRequest request = BaseHttpRequest.fromContext(RestContext.request);
        IHttpRequestLoggerService loggerService = new SysIntegrationRequestLoggerService();
        IHttpMethodHandler handler = (IHttpMethodHandler) type.newInstance();

        BaseHttpResponse response = handler.handle(request);

        loggerService.log(request, response);

        return response;
    }
}