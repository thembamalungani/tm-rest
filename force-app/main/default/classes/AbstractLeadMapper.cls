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

    /**
     * Maps the contect details from leadMap
     *
     * @return ContactDetails
     */
    public virtual BaseLead.ContactDetails mapContactDetails() {

        BaseLead.ContactDetails contectDetails = new BaseLead.ContactDetails();

        return contectDetails;
    }

    /**
     * Maps tracking info from leadMap
     *
     * @param Tracking
     */
    public virtual BaseLead.Tracking mapTracking() {

        BaseLead.Tracking tracking = new BaseLead.Tracking();

        return tracking;
    }

    /**
     * Maps the GDRP data from leadMap
     *
     * @param GDPR
     */
    public virtual BaseLead.GDPR mapGDPR() {

        BaseLead.GDPR gdpr = new BaseLead.GDPR();

        return gdpr;
    }
}