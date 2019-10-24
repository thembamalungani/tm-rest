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
     * @param IAccountSelector accountSelector
     */
    private IAccountSelector accountSelector;

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

        payloadMap  = (Map<String, Object>) payload;
        lead        = (BaseLead) payloadMap.get('lead');
        account     = (Account) payloadMap.get('account');
        opportunity = createFromLead(lead, account);

        opportunity = this.opportunityService.create(lead, account);

        return (Object) response(lead, account, opportunity);
    }

    /**
     * Creates a opportunity from a lead
     *
     * @param BaseLead lead
     * @param Account account
     *
     * @return Opportunity
     */
    public Opportunity createFromLead(BaseLead lead, Account account) {

        return new Opportunity();
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
