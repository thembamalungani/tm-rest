public class RequestedACallHandler implements ILeadHandler {
    
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
        System.debug('Handling RAC');
        pipeline = (new Pipeline(new FingersCrossedProcessor()))
            .pipe(new CreateAccountStage())
            .pipe(new CreateOpportunityStage()) 
            .pipe(new CreateRequestACallStage());

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

        if ( responseMap.get('account') != null && responseMap.get('opportunity') != null && responseMap.get('case') != null) {

            return true;
        }

        return false;
    }
}