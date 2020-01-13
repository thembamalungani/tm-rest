/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to check if a presentation exists
 * @date 2019-10-21
 */
public class PresentationChecker implements IInterruptChecker {
    /**
     * Checks if we should interrupt the pipeline
     * 
     * @param Object payload
     * @return Boolean
     */
    public Boolean shouldInterrupt(Object payload) {
        
        Map<String, Object> payloadMap = (Map<String, Object>)payload;

        if (payloadMap.get('presentation') != null || payloadMap.get('course') == null) {
            return true;
        }

        return false;
    }
}
