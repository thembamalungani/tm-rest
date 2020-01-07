/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This stage is used to create an opportunity
 * @date 2019-10-09
 */
public class CreateOpportunityStage implements IPipelineStage {
    /**
     * @param IOpportunityService opportunityService
     */
    private IOpportunityService opportunityService;

    /**
     * Wire dependencies
     */
    public CreateOpportunityStage() {
        this.opportunityService = new OpportunityService();
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
        opportunity = OpportunityHelper.checkOpportunity(lead, account);

        if (opportunity == null) {
            opportunity = OpportunityHelper.prepareFor(lead, account);
            
            try {
                this.opportunityService.create(new List<Opportunity>{ opportunity });
            } catch (Exception e) {
                System.debug('ERROR: ' + e.getMessage());
            }
        }

        return (Object)response(lead, account, opportunity);
    }

    /**
     * Builds a stage result
     *
     * @param BaseLead lead
     * @param Account account
     * @param Opportunity opportunity
     * @return Object
     */
    private Object response(BaseLead lead, Account account, Opportunity opportunity) {
        return StageResult.builder()
                .lead(lead)
                .stageAccount(account)
                .stageOpportunity(opportunity)
                .build()
                .toMap();
    }
}