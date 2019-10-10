public class Pipeline implements IPipeline {
    
    /**
     * Pipeline stages
     * 
     * @param List<IPipelineStage> stages
     */
    private List<IPipelineStage> stages;
    
    /**
     * Pipeline processor
     *
     * @param IPipelineProcessor processor
     */
    private IPipelineProcessor processor;

    /**
     * Fetch pipeline processor if instantiated without one
     */
    public Pipeline() {

        this.processor = (IPipelineProcessor) Application.Component.newInstance(IPipelineProcessor.class);
    }

    /**
     * Inject pipeline processor
     * 
     * @param IPipelineProcessor processor
     */
    public Pipeline(IPipelineProcessor processor) {

        this.processor = processor;
    }

    /**
     * Process the lead
     *
     * @param BaseLead lead
     * @return Object
     */
    public Object process(Object lead) {

        return this.processor.process(lead, this.stages);
    }

    /**
     * Add the stage to the pipeline
     *
     * @param IPipelineStage stage
     * @return IPipeline
     */
    public IPipeline pipe(IPipelineStage stage) {

        this.stages.add(stage);

        return this;
    }
}
