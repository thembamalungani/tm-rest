/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle leads endpoint
 * @date 2019-10-03
 */
public class LeadsCreateHandler implements IHttpMethodHandler {
    /**
     * Handles create leads
     *
     * @param BaseHttpRequest request
     * @return BaseHttpResponse
     */
    public BaseHttpResponse handle(BaseHttpRequest request) {

        Boolean isQueued;
        ILeadBatchParser parser;
		
        try {
			
            parser = new LeadBatchParser();
            queueLeads( parser.parse( request.body ));
            isQueued = true;

        } catch(JSONException e) {
            isQueued = false;
        }

        return response(isQueued);
    }

    /**
     * Queues the leads using the AsyncApexFramework
     *
     * @param List<BaseLead> leads
     */
    private void queueLeads(List<BaseLead> leads) {
        
        for (BaseLead lead: leads) {
            queueLead(lead);
        }
    }

    /**
     * Queues the lead using the AsyncApexFramework
     *
     * @param List<BaseLead> leads
     */
    private void queueLead(BaseLead lead) {
        
        IAsyncLeadHandler handler = new AsyncLeadHandler();
        handler.setLead(lead);
        System.enqueueJob((Queueable)handler);
    }

    /**
     * Create a response based on whether the leads are queued for processing or not
     *
     * @return BaseHttpResponse
     */
    private BaseHttpResponse response(Boolean isQueued) {

        if (isQueued) {
            return BaseHttpResponse.accepted('Accepted');
        }

        return BaseHttpResponse.badRequest('Failed');
    }
}