/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used as a base lead handle chain
 * @date 2019-10-03
 */
public virtual class BaseLeadHandleChain implements ILeadHandlerChain {

    /**
     * @param List<ILeadHandler> chain;
     */
    private List<ILeadHandler> chain;

    /**
     * @param IAccountRepository accountRepository
     */
    private IAccountRepository accountRepository;

    /**
     * Handles the lead via the chain
     *
     * @param BaseLead lead
     * @return List<LeadHandleResponse>
     */
    public void handle(BaseLead lead) {

        List<LeadHandleResult> results;
        List<LeadHandleResponse> responses = new List<LeadHandleResponse>();

        for (ILeadHandler handler: chain) {

            handler.handle(lead);
        }
    }

    /**
     * Adds a handler to the chain
     *
     * @param ILeadHandler handler
     */
    public void addHandler(ILeadHandler handler) {

        chain.add(handler);
    }

    /**
     * Sets the handle chain
     * 
     * @param List<ILeadHandler> chain
     */
    public void setChain(List<ILeadHandler> chain) {

        this.chain = chain;
    }
}
