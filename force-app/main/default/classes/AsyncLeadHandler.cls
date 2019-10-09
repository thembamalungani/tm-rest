/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to handle a lead asynchronously
 * @date 2019-10-03
 */
public class AsyncLeadHandler implements Queueable, IAsyncLeadHandler {

    /**
     * @param BaseLead lead
     */
    private BaseLead lead;

    /**
     * @param IEventDispatcher eventDispatcher
     */
    //private IEventDispatcher eventDispatcher;

    /**
     * Sets the lead to be handled.
     *
     * @param BaseLead lead
     */
    public void setLead(BaseLead lead) {
        
        this.lead = lead;
        //this.eventDispatcher = (IEventDispatcher) Application.Component.newInstance(IEventDispatcher.class);
    }

    /**
     * Handles the lead when the job runs
     *
     * @param QueueableContext context
     */
    public void execute(QueueableContext context) {
        
        Boolean isSuccess = handler().handle(lead);

        // if (result.isSuccess()) {

        //     this.eventDispatcher.dispatch(new LeadWasProcessed(lead, result));

        // } else {

        //     this.eventDispatcher.dispatch(new LeadProcessingFailed(lead, result));
        // }
    }

    /**
     * Gets a registered handle for the current lead type
     * 
     * @return ILeadHandler
     */
    private ILeadHandler handler() {

        ILeadHandler handler = (ILeadHandler) Application.LeadHandler.newInstance(lead.getType());

        return handler;
    }

    private Boolean isSuccess(Object payload) {

        Map<String, Object> payloadMap = (Map<String, Object>) payload;

        if ( payloadMap.get('account') != null && payloadMap.get('opportunity') != null ) {

            return true;
        }

        return false;
    }
}
