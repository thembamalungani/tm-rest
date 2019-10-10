/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is a based lead model
 * @date 2019-10-01
 */
public virtual class BaseLeadMapper implements ILeadMapper {

    /**
     * @param Map<String, Object> leadMap
     */
    private final Map<String, Object> leadMap;

    /**
     * Create the instance from leadMap
     *
     * @param Map<String, Object> leadMap
     */
    public BaseLeadParser(Map<String, Object> leadMap) {

        this.leadMap = leadMap;
    }

    /**
     * Used to set the json to be parsed
     *
     * @param Map<String, Object> leadMap
     */
    public void setMap(Map<String, Object> leadMap) {

        this.leadMap = leadMap;
    }

    /**
     * Parses the contect details from leadMap
     *
     * @return ContactDetails
     */
    public BaseLead.ContactDetails parserContactDetails() {

        BaseLead.ContactDetails contectDetails = new BaseLead.ContactDetails();

        return contectDetails;
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public BaseLead.Tracking parserTracking() {

        BaseLead.Tracking tracking = new BaseLead.Tracking();

        return tracking;
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param GDPR
     */
    public BaseLead.GDPR parseGDPR() {

        BaseLead.GDPR gdpr = new BaseLead.GDPR();

        return gdpr;
    }
}
