/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contact for opportunity line items selector
 * @date 2019-10-03
 */
public interface IOpportunityLineItemSelctor {
    /**
     * Selects opportunities by ids
     *
     * @param Set<Id> ids
     * @return Map<Id, OpportunityLineItem>
     */
    Map<Id, OpportunityLineItem> selectByOpportunityIds(Set<Id> ids);
}
