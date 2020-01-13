/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for lead factory
 * @date 2019-10-04
 */
public interface ILeadFactory {
    /**
     * Create a BaseLead instance from a map
     * 
     * @param Map<String, Object> leadMap
     * @return BaseLead
     */
    BaseLead createFrom(Map<String, Object> leadMap);
}