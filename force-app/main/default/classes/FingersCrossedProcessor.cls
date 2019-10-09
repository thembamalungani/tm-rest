/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to process pipeline stages
 * @date 2019-10-03
 */
public class FingersCrossedProcessor implements IPipelineProcessor {
    
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
        }

        return payload;
    }
}
