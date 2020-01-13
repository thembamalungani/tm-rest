/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description IPipeline implementation 
 * @date 2019-10-21
 */
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
        this.stages		= new List<IPipelineStage>();
        this.processor 	= new FingersCrossedProcessor();
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

        if (this.stages == null) {
            this.stages	= new List<IPipelineStage>();
        }
        
        this.stages.add(stage);

        return this;
    }
}