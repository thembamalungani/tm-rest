/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for serialising responses
 * @date 2019-10-03
 */
public interface IResponseSerialiser {

    /**
     * Handles serialising the response
     * 
     * @param IHttpResponse response
     * @return Object
     */
    Object serialise(IHttpResponse response);
}
