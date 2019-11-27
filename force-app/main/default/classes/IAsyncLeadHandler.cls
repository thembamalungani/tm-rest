/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for handling a lead synchronously
 * @date 2019-10-04
 */
public interface IAsyncLeadHandler {
    /**
     * Sets the lead to be handled.
     *
     * @param BaseLead lead
     */
    void setLead(BaseLead lead);
}