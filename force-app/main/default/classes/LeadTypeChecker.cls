/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This object is used to check the event type by inspecting the fields
 * @date 2019-10-01
 */
public class LeadTypeChecker implements ILeadTypeChecker {
    /**
     * @param LeadType type
     */
    protected LeadType type;

    /**
     * This is a map of the incoming event types to an enum value
     */
    protected Map<String, LeadType> types = new Map<String, LeadType>{
        'Downloaded Info Pack'          => LeadType.DOWNLOADED_INFO_PACK,
        'Requested a Call'              => LeadType.REQUESTED_A_CALL,
        'Submitted Registration Step 1' => LeadType.SUBMITTED_REGISTRATION_STEP1,
        'invitee.created'               => LeadType.CALENDLY_RAC_CREATED,
        'invitee.canceled'              => LeadType.CALENDLY_RAC_CANCELED
    };
  
    /**
     * Gets the type of lead by inspecting the json payload
     * 
     * @param Map<String, Object> leadMap
     * @return String
     */
    public LeadType check(Map<String, Object> leadMap) {
        
        String leadTypeString = (String)leadMap.get('leadCaptureFormType');

		if (String.isBlank(leadTypeString)) {
			leadTypeString = (String)leadMap.get('event');
		}

        return types.get(leadTypeString);
    }
}