/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is a based lead model
 * @date 2019-10-01
 */
public abstract class AbstractLeadMapper {
    /**
     * @param Map<String, Object> leadMap
     */
    protected Map<String, Object> leadMap;

    /**
     * Used to set the json to be parsed
     *
     * @param Map<String, Object> leadMap
     */
    public void setMap(Map<String, Object> leadMap) {
        this.leadMap = leadMap;
    }
}
