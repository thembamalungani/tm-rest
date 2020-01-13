/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for case selector
 * @date 2019-10-04
 */
public interface ICaseSelector {
    /**
     * Selects a case by external ids (UUID__c)
     * 
     * @param List<String> ids
     * @return Case
     */
    Case selectByExternalIds(List<String> ids);
}
