/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for BaseHttpRequest handler
 * @date 2019-10-04
 */
public interface IHttpMethodHandler {
    /**
     * Handles create leads
     *
     * @param HttpRequest request
     * @return HttpRequest
     */
    BaseHttpResponse handle(BaseHttpRequest request);
}