public class InterruptibleProcessor implements IPipelineProcessor {
    /**
     * @var IInterruptChecker
     */
    private IInterruptChecker checker;

    /**
     * Inject dependencies
     *
     * @param IInterruptChecker checker
     */
    public InterruptibleProcessor(IInterruptChecker checker) {
        this.checker = checker;
    }
    
    /**
     * Processes the pipeline using the stages provided
     *
     * @param Object payload
     * @param List<IPipelineStage> stages
     * @return Object
     */
    public Object process(Object payload, List<IPipelineStage> stages) {
        
        for (IPipelineStage stage: stages) {
            payload = stage.call(payload);
            
            if (true == this.checker.shouldInterrupt(payload)) {
                return payload;
            }
        }

        return payload;
    }
}
