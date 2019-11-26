/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Pipeline used to handle processing stages
 * @date 2019-10-03
 */
public interface IPipeline {

    /**
     * Process the payload
     *
     * @param BaseLead lead
     * @return Object
     */
    Object process(Object payload);

    /**
     * Add the stage into the pipeline
     *
     * @param IPipelineStage stage
     * @return IPipeline
     */
    IPipeline pipe(IPipelineStage stage);
}