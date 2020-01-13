/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contact for opportunity line items selector
 * @date 2019-10-03
 */
public interface IOpportunityLineItemSelctor {
    Map<Id, OpportunityLineItem> selectByOpportunityIds(Set<Id> ids);
}
