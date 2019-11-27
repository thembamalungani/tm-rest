public interface IOpportunityLineItemSelctor {
    Map<Id, OpportunityLineItem> selectByOpportunityIds(Set<Id> ids);
}
