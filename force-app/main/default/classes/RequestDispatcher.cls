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
    public Object dispatch(Type type) {

        return process(type, true);
    }

    /**
     * Dispatch the request to be handled synchronously
     *
     * @param Type type
     * @return Object
     */
    Object dispatchNow(Type type) {

        return process(type, false);
    }

    /**
     * Handles the http request by delegating the handling to the instance of HttpRouteHandler
     * passed
     *
     * @param Type type
     * @param Boolean isAsync
     * @return IHttpResponse
     */
    private IHttpResponse process(Type type, Boolean isAsync) {

        HttpRequest request = HttpRequest.fromContext(RestContext.request);
        IHttpRequestLoggerService loggerService = (IHttpRequestLoggerService) Application.Service.newInstance(IHttpRequestLoggerService.class);

        IHttpResponse response = isAsync ? handleAsync(type) : handleSync(type);

        loggerService.log(request, response);

        return response;
    }

    /**
     * Handle the request synchronously
     *
     * @param Type type
     * @return IHttpResponse
     */
    private IHttpResponse handleSync(Type type) {

        IHttpMethodHandler handler = (IHttpMethodHandler) type.newInstance();

        return handler.handle(request);
    }   

    /**
     * Handle the request synchronously by queuing a brackground job
     *
     * @param Type type
     * @return IHttpResponse
     */
    private IHttpResponse handleAsync(Type type) {

        IAsyncHttpRequestHandler handler = (IAsyncHttpRequestHandler) Application.Component.newInstance(IAsyncHttpRequestHandler.class);
        
        handler.setRequest(request);
        handler.setType(type);

        // The framework also need to be injected
        AsyncApexFramework.submitQueueable(handler, null, false);
        AsyncApexFramework.flush();

        return HttpHelper.accepted();
    } 
}