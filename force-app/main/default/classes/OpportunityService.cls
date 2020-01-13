/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Service class for opportunities
 * @date 2019-10-21
 */
public class OpportunityService extends SObjectService implements IOpportunityService {
    /**
     * Creates opportunities
     *
     * @param List<Opportunity> opportunities
     * @return
     */
    public void create(List<Opportunity> opportunities) {
        super.insertObjects(opportunities);
    }
}