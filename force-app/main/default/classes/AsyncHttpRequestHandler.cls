/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Handles a http rest request asynchronously
 * @date 2019-10-03
 */
public class AsyncHttpRequestHandler implements Queueable {
    
    /**
     * @param HttpRequest request
     */
    private HttpRequest request;

    /**
     * @param Type type
     */
    private Type type;

    public void setType(Type type) {
        this.type = type;
    }

    public void setRequest(HttpRequest request) {
        this.request = request;
    }

    /**
     * Handles the lead when the job runs
     *
     * @param QueueableContext context
     */
    public void execute(QueueableContext context) {
        handler().handle(request);
    }

    /**
     * Create the handler from type
     *
     * @return IHttpMethodHandler
     */
    private IHttpMethodHandler handler() {
        return (IHttpMethodHandler) type.newInstance();
    }
}