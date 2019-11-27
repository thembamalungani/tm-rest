/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for pipeline stage
 * @date 2019-10-03
 */
public interface IPipelineStage {
    /**
     * Called when the stage is run
     * 
     * @param Object payload
     * @return Object
     */
    Object call(Object payload);
}