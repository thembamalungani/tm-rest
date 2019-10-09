/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for lead handler
 * @date 2019-10-01
 */
public interface ILeadHandler {

    /**
     * Handles the leads and return a LeadResult for each BaseLead
     *
     * @param List<BaseLead> leads
     * @return List<LeadHandleResult>
     */
    List<LeadHandleResult> handle(List<BaseLead> leads);
}
