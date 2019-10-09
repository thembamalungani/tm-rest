/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle leads endpoint
 * @date 2019-10-01
 */
@RestResource(UrlMapping='/leads/*')
public class LeadHandler_IH_v1 {
    
    /**
     * Used to dispatch rest request to specific handler
     *
     * @param IRestDispatcher dispatcher
     */
    global static IRestDispatcher dispatcher;

    /**
     * Used to handle creating leads
     *
     * @return String
     */
    global static String create() {

        dispatcher = (IRestDispatcher) Application.Component.newInstance(IRestDispatcher.class);
        
        IHttpResponse response = dispatcher.dispatchNow(LeadsCreateHandler.class);

        return serialiser.serialise(response);
    }
}
