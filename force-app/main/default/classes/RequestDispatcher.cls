/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is the handler for lead REST API
 * @date 2019-09-06
 */
public class RequestDispatcher implements IRestDispatcher {

    /**
     * Dispatch the request to be handled asynchronously
     *
     * @param IHttpMethodHandler handler
     */
    public Object dispatch(IHttpMethodHandler type) {

        return process(type, true);
    }

    /**
     * Dispatch the request to be handled synchronously
     *
     * @param IHttpMethodHandler type
     * @return Object
     */
    public Object dispatchNow(IHttpMethodHandler type) {

        return process(type, false);
    }

    /**
     * Handles the http request by delegating the handling to the instance of HttpRouteHandler
     * passed
     *
     * @param Type type
     * @param Boolean isAsync
     * @return HttpResponse
     */
    private HttpResponse process(Type type, Boolean isAsync) {

        HttpRequest request = HttpRequest.fromContext(RestContext.request);
        IHttpRequestLoggerService loggerService = (IHttpRequestLoggerService) Application.Service.newInstance(IHttpRequestLoggerService.class);

        HttpResponse response = isAsync ? handleAsync(type) : handleSync(type);

        loggerService.log(request, response);

        return response;
    }

    /**
     * Handle the request synchronously
     *
     * @param Type type
     * @return IHttpResponse
     */
    private HttpResponse handleSync(Type type,  HttpRequest request) {

        IHttpMethodHandler handler = (IHttpMethodHandler) type.newInstance();

        return handler.handle(request);
    }   

    /**
     * Handle the request synchronously by queuing a brackground job
     *
     * @param Type type
     * @return HttpResponse
     */
    private HttpResponse handleAsync(Type type) {

        AsyncHttpRequestHandler handler = (AsyncHttpRequestHandler) Application.Component.newInstance(IAsyncHttpRequestHandler.class);
        
        handler.setRequest(request);
        handler.setType(type);

        System.enqueueJob(handler);

        return HttpResponse.accepted('test');
    } 
}