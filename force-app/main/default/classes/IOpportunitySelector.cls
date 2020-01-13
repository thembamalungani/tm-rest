/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Interface for opportunity selector
 * @date 2019-10-03
 */
public interface IOpportunitySelector {
    /**
     * Selects accounts by ids
     *
     * @param Set<Id> accountIds
     * @return Map<Id, Opportunity>
     */
    Map<Id, Opportunity> selectByAccountIds(Set<Id> accountIds);
}
