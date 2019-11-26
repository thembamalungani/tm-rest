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
        
        Object result;
        ILeadHandler handler = LeadHandlerFactory.getHandler(lead);
        System.debug('Type: ' + lead.getType());
        if (handler != null) {
            
            result  = handler.handle(lead);
        }
    }
}