/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is a contract for lead mapper
 * @date 2019-10-01
 */
public interface ILeadMapper {
    
    /**
     * Used to set the json to be parsed
     *
     * @param Map<String, Object> leadMap
     */
    void setMap(Map<String, Object> leadMap);

    /**
     * Map contact details
     * 
     * @return ContactDetails
     */
    ContactDetails mapContactDetails();

    /**
     * Map tracking details
     *
     * @return Tracking
     */
    Tracking mapTracking();

    /**
     * Map gdpr details
     *
     * @return GDPR
     */
    GDPR mapGDPR();
}
