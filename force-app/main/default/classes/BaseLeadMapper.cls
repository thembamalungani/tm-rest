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
     * Parses the contect details from leadMap
     *
     * @return ContactDetails
     */
    public virtual ContactDetails parserContactDetails() {

        ContactDetails contectDetails = new ContactDetails();

        return contectDetails;
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public virtual Tracking parserTracking() {

        Tracking tracking = new Tracking();

        return tracking;
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param GDPR
     */
    public virtual GDPR parseGDPR() {

        GDPR gdpr = new GDPR();

        return gdpr;
    }
}
