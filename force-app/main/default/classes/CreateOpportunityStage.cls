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
     * @param INotificationService notificationService
     */
    private INotificationService notificationService;

    /**
     * Wire dependencies
     */
    public CreateOpportunityStage() {
        this.opportunityService     = new OpportunityService();
        this.notificationService    = new EmailNofificationService();
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
            
            if (lead.tracking.productIds.size() > 0) {
                
                try {
                    
                    opportunityService.create(new List<Opportunity>{ opportunity });

                } catch (Exception e) {

                    notificationService.notify(new OpportunityCreateFailedNotification(lead, e.getMessage()));
                }

            } else {

                notificationService.notify(new OpportunityCreateFailedNotification(lead, Strings.NO_PRODUCT_PASSED));
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