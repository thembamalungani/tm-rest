/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for pipeline processor
 * @date 2019-10-09
 */
public interface IPipelineProcessor {

    /**
     * Processes the pipeline using the stages provided
     *
     * @param Object payload
     * @param List<IPipelineStage> stages
     * @return IStageResult
     */
    IStageResult process(Object payload, List<IPipelineStage> stages);
}
