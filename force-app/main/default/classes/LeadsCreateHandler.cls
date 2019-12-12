/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle leads endpoint
 * @date 2019-10-03
 */
public class LeadsCreateHandler implements IHttpMethodHandler {
    /**
     * Handles create leads
     *
     * @param HttpRequest request
     * @return HttpRequest
     */
    public HttpResponse handle(HttpRequest request) {

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
     * @return HttpResponse
     */
    private HttpResponse response(Boolean isQueued) {

        if (isQueued) {
            return HttpResponse.accepted('Accepted');
        }

        return HttpResponse.badRequest('Failed');
    }
}