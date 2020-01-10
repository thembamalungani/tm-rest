public class CreateRequestACallStage implements IPipelineStage {
    /**
     * @param ICaseService caseService
     */
    private ICaseService caseService;

    /**
     * Wire dependencies
     */
    public CreateRequestACallStage() {
        this.caseService = new CaseService();
    }

    /**
     * Called when this stage is run
     * 
     * @param Object payload
     * @return Object
     */
    public Object call(Object payload) {

        Case newCase;
        BaseLead lead;
        Account account;
        Opportunity opportunity;
        Map<String, Object> payloadMap;
        List<OpportunityLineItem> lineItems;

        payloadMap  = (Map<String, Object>) payload;
        lead        = (BaseLead) payloadMap.get('lead');
        account     = (Account) payloadMap.get('account');
        opportunity = (Opportunity) payloadMap.get('opportunity');
        newCase     = CaseHelper.prepareFor(lead, account, opportunity);
        lineItems   = (List<OpportunityLineItem>) payloadMap.get('opportunityLineItems');

        if (OpportunityHelper.checkOpportunity(lead, account) == null) {
            try {
                this.caseService.createCases(new List<Case>{ newCase });
            } catch (Exception e) {
                System.debug('ERROR: ' + e.getMessage());
            }
        }

        return response(lead, account, opportunity, lineItems, newCase);
    }

    /**
     * Builds a stage result
     *
     * @param BaseLead lead
     * @param Account account
     * @param Opportunity opportunity
     * @return Object
     */
    private Object response(BaseLead lead, Account account, Opportunity opportunity, List<OpportunityLineItem> lineItems, Case newCase) {
        return StageResult.builder()
                .lead(lead)
                .stageCase(newCase)
                .stageAccount(account)
                .stageOpportunity(opportunity)
                .stageOpportunityLineItems(lineItems)
                .build()
                .toMap();
    }
}