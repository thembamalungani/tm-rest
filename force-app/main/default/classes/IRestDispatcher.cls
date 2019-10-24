/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for rest request dispatcher
 * @date 2019-10-01
 */
public interface IRestDispatcher {
    
    /**
     * Dispatch the request to be handled asynchronously
     *
     * @param Type handler
     * @return HttpResponse
     */
    HttpResponse dispatch(Type handler);
}
