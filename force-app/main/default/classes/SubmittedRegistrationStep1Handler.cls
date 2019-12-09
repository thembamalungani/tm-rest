public class SubmittedRegistrationStep1Handler implements ILeadHandler {
    
    private Object result;

    /**
     * Called when the stage is run
     * 
     * @param BaseLead lead
     * @return Object
     */
    public Object handle(BaseLead lead) {

        IPipeline pipeline;
        Map<String, Object> payload;

        pipeline = (new Pipeline(new FingersCrossedProcessor()))
            .pipe(new CreateAccountStage())
            .pipe(new CreateOpportunityStage())
            .pipe(new CreateOpportunityLineItemsStage());

        payload = new Map<String, Object>{ 'lead' => lead };
        result  = pipeline.process(payload);

        return result;
    }

    /**
     * Determines if the lead was handle successfully
     *
     * @return Boolean
     */
    public Boolean isSuccess() {

        Map<String, Object> responseMap = (Map<String, Object>) this.result;

        if ( responseMap.get('account') != null && responseMap.get('opportunity') != null ) {
            return true;
        }

        return false;
    }
}