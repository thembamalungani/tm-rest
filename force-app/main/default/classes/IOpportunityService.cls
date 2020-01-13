/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Interface for opportunity service
 * @date 2019-10-03
 */
public interface IOpportunityService {
    /**
     * Creates opportunities
     *
     * @param List<Opportunity> opportunities
     */
    void create(List<Opportunity> opportunities);
}