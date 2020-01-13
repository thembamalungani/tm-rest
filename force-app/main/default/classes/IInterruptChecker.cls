/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for implementation of logic used to check for interrupt on the processor
 * @date 2019-10-04
 */
public interface IInterruptChecker {
    /**
     * Checks if we should interrupt the pipeline
     * 
     * @param Object payload
     * @return Boolean
     */
    Boolean shouldInterrupt(Object payload);
}
