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

        this.opportunityService = (IOpportunityService) Application.Service.newInstance(IOpportunityService.class);
    }

    /**
     * Called when the stage is run
     * 
     * @param Object payload
     * @return Object
     */
    public Object call(Object payload) {

        Map<String, Object> payloadMap = (Map<String, Object>) payload;
        BaseLead lead = (BaseLead) payloadMap.get('lead');
        Account account = (Account) payloadMap.get('account');

        Opportunity opportunity = createFromLead(lead, account);

        opportunity = this.opportunityService.create(lead, account);

        return (Object) response(lead, account, opportunity);
    }

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
