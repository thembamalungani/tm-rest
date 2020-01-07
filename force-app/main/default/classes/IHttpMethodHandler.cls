public interface IHttpMethodHandler {
    /**
     * Handles create leads
     *
     * @param HttpRequest request
     * @return HttpRequest
     */
    BaseHttpResponse handle(BaseHttpRequest request);
}