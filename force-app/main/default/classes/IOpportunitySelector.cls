public interface IOpportunitySelector {
    Map<Id, Opportunity> selectByAccountIds(Set<Id> accountIds);
}
