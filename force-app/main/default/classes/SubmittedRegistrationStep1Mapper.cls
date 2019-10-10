/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to map a Submitted Registratrion Step 1 lead
 * @date 2019-10-03
 */
public class SubmittedRegistrationStep1Mapper extends BaseLeadMapper {

    /**
     * Used to set the json to be parsed
     *
     * @param Map<String, Object> leadMap
     */
    public void setMap(Map<String, Object> leadMap) {

        super.setMap(leadMap);
    }

    /**
     * Parses the contect details from leadMap
     *
     * @return BaseLead.ContactDetails
     */
    public BaseLead.ContactDetails parserContactDetails() {

        return super.parserContactDetails();
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param BaseLead.Tracking
     */
    public BaseLead.Tracking parserTracking() {

        return super.parserTracking();
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param BaseLead.GDPR
     */
    public BaseLead.GDPR parseGDPR() {

        return super.parseGDPR();
    }
}
