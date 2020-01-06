public class CancelRequestACallStage implements IPipelineStage {
    /**
     * @param ICaseService caseService
     */
    private ICaseService caseService;

    /**
     * @param ICaseSelector caseSelector
     */
    private ICaseSelector caseSelector;

    /**
     * Wire dependencies
     */
    public CancelRequestACallStage() {
        this.caseService = new CaseService();
        this.caseSelector= new CaseSelector();
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
        Map<String, Object> payloadMap;

        payloadMap      = (Map<String, Object>) payload;
        lead            = (BaseLead) payloadMap.get('lead');
        
        Case cancelCase = this.caseSelector.selectByExternalIds(new List<String>{lead.tracking.externalId});
        
        if (cancelCase != null) {
            this.caseService.cancelCases(new List<Case>{ cancelCase });
        }
		
        return response(lead, cancelCase);
    }

    /**
     * Builds a stage result
     *
     * @param BaseLead lead
     * @param Account account
     * @param Opportunity opportunity
     * @return Object
     */
    private Object response(BaseLead lead, Case newCase) {
        return StageResult.builder()
                .lead(lead)
                .stageCase(newCase)
                .build()
                .toMap();
    }
}