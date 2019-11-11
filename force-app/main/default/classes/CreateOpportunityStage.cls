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
     * @param IOpportunitySelector accountSelector
     */
    private IOpportunitySelector accountSelector;

    /**
     * Wire dependencies
     */
    public CreateOpportunityStage() {

        this.opportunityService = new OpportunityService();
        this.accountSelector    = new OpportunitySelector();
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
        opportunity = this.accountSelector.selectByAccountIdAndPresentationId(account.Id, lead.tracking.productIds.get(0));

        if (opportunity == null) {
            opportunity = this.createFromLead(lead, account);
        }

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

        OpportunityMapper mapper = OpportunityMapperFactory.getMapper(lead);

        Opportunity opportunity = this.opportunityService.create(lead, account);

        return opportunity;
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
