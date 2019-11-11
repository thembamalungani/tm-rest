/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description
 * @date 2019-11-11
 */
public interface IOpportunitySelector {

    /**
     * @param Id accountId
     * @param Id presentationId
     * @return Opportunity
     */
    Opportunity selectByAccountIdAndPresentationId(Id accountId, Id presentationId);
}
