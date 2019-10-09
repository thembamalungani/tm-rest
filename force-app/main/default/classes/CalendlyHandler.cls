public class CalendlyHandler {
    
    private Object result;

    /**
     * Called when the stage is run
     * 
     * @param Object payload
     * @return Object
     */
    public Object handle(Object payload) {

        BaseLead lead = (BaseLead) payload;

        IPipeline pipeline = (new Pipeline(new FingersCrossedProcessor()))
                                .pipe(new CreateAccountStage())
                                .pipe(new CreateOpportunityStage());


        this.result = pipeline.process(payload);

        return this.result;
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
