/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Implementation of opportunity selector
 * @date 2019-11-11
 */
public class OpportunitySelector extends ObjectSelector implements IOpportunitySelector {
    
    /**
     * OpportunitySelector cosntructor
     */
    public OpportunitySelector() {

        super(Opportunity.getSObjectType());
    }

    /**
     * Selects accounts 
     *
     * @param Id accountId
     * @param Id presentationId
     */
    public Opportunity selectByAccountIdAndPresentationId(Id accountId, Id presentationId) {

        String template         = 'SELECT {0} FROM Opportunity WHERE AccountId={1} AND Inferred_Presentation__c={2} AND (IsClosed = FALSE OR (IsClosed = TRUE AND IsWon = FALSE)';
        String query            = String.format(template, new List<String>{ String.join((Iterable<String>)this.getFieldNames(), ', '), accountId, presentationId});
        Opportunity opportunity = Database.query(query);

        return opportunity;
    }
}
