/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle leads endpoint
 * @date 2019-10-03
 */
public class LeadsCreateHandler implements IHttpMethodHandler {

    /**
     * Handles create leads
     *
     * @param IHttpRequest request
     * @return IHttpResponse
     */
    public IHttpResponse handle(IHttpRequest request) {

        Boolean isQueued;

        try {

            ILeadBatchParser parser = (ILeadBatchParser) Application.Component.newInstance(ILeadBatchParser.class);
            queueLeads( parser.parse(request.getBody()), true);
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
     * @param Boolean shouldFlush
     */
    private void queueLeads(List<BaseLead> leads, Boolean shouldFlush) {
        
        for (BaseLead lead: leads) {

            queueLead(lead);
        }

        if (shouldFlush) {

            AsyncApexFramework.flush();
        }
    }

    /**
     * Queues the lead using the AsyncApexFramework
     *
     * @param List<BaseLead> leads
     * @param Boolean shouldFlush
     */
    private void queueLead(BaseLead lead, Boolean shouldFlush) {
        
        IAsyncLeadHandler handler = (IAsyncLeadHandler) Application.Component.newInstance(IAsyncLeadHandler.class);
            
        handler.setLead(lead);

        AsyncApexFramework.submitQueueable((Queueable)handler, null, false);
        
        if (shouldFlush) {

            AsyncApexFramework.flush();
        }
    }

    /**
     * Create a response based on whether the leads are queued for processing or not
     *
     * @return IHttpResponse
     */
    private IHttpResponse response(Boolean isQueued) {

        if (isQueued) {

            return HttpHelper.accepted();
        }

        return HttpHelper.badRequest();
    }
}
