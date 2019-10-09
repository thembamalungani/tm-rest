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
     * Sets the lead to be handled.
     *
     * @param BaseLead lead
     */
    public void setLead(BaseLead lead) {
        
        this.lead = lead;
    }

    /**
     * Handles the lead when the job runs
     *
     * @param QueueableContext context
     */
    public void execute(QueueableContext context) {
        
        ILeadHandler handler = handler();
        Object result = handler.handle(lead);
        Boolean isSuccess = handler.isSuccess();
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
}
