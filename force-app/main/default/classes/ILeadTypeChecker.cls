/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is a contract for the algorithm to be used to check event type
 * @date 2019-10-01
 */
public interface ILeadTypeChecker {
    /**
     * Gets the lead event type by inspecting the properties of the map
     *
     * @param Map<String, Object> leadMap
     * @return LeadType
     */
    LeadType check(Map<String, Object> leadMap);
}