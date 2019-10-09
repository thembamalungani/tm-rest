/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for leads handle chains
 * @date 2019-10-03
 */
public interface ILeadProcessPipeline {

    /**
     * Handles the lead events
     * 
     * @param List<BaseLead> leads
     * @return LeadResult
     */
    LeadResult process(BaseLead lead);
}
