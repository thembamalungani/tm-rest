public interface IHttpMethodHandler {
    /**
     * Handles create leads
     *
     * @param HttpRequest request
     * @return HttpRequest
     */
    HttpResponse handle(HttpRequest request);
}