public class OpportunityService extends SObjectService implements IOpportunityService {

    public void create(List<Opportunity> opportunities) {
        super.insertObjects(opportunities);
    }
}