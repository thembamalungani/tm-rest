public class CreateOpportunityLineItemsStage implements IPipelineStage {
    /**
     * @param IOpportunityLineItemsService opportunityLineItemsService
     */
    private IOpportunityLineItemsService opportunityLineItemsService;

    /**
     * Wire dependencies
     */
    public CreateOpportunityLineItemsStage() {
        this.opportunityLineItemsService = new OpportunityLineItemsService();
    }

    /**
     * Called when the stage is run
     * 
     * @param Object payload
     * @return Object
     */
    public Object call(Object payload) {
        
        BaseLead lead;
        Account account;
        Opportunity opportunity;
        Map<String, Object> payloadMap;
        List<OpportunityLineItem> lineItems;

        payloadMap  = (Map<String, Object>) payload;
        lead        = (BaseLead) payloadMap.get('lead');
        account     = (Account) payloadMap.get('account');
        opportunity = (Opportunity) payloadMap.get('opportunity');
        lineItems   = OpportunityLineItemHelper.prepareFor(lead, account, opportunity);

        this.opportunityLineItemsService.createLineItems(lineItems);

        return response(lead, account, opportunity, lineItems);
    }

    /**
     * Builds a stage result
     *
     * @param BaseLead lead
     * @param Account account
     * @param Opportunity opportunity
     * @return Object
     */
    private Object response(BaseLead lead, Account account, Opportunity opportunity, List<OpportunityLineItem> lineItems) {
        return StageResult.builder()
                .lead(lead)
                .stageAccount(account)
                .stageOpportunity(opportunity)
                .stageOpportunityLineItems(lineItems)
                .build()
                .toMap();
    }
}