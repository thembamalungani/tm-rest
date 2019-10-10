/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle leads endpoint
 * @date 2019-10-01
 */
@RestResource(UrlMapping='/v2/leads/*')
global class LeadHandler_IH_v1 {
    
    /**
     * Used to dispatch rest request to specific handler
     *
     * @param IRestDispatcher dispatcher
     */
    global static IRestDispatcher dispatcher;

    /**
     * Used to handle creating leads
     *
     * @return HttpResponsep
     */
    global static String create() {

        dispatcher = new RequestDispatcher();
        
        Object response = dispatcher.dispatch(LeadsCreateHandler.class);

        return 'test';
    }
}
