/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to map a Calendly lead
 * @date 2019-10-03
 */
public class CalendlyLeadMapper  extends BaseLeadMapper {

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
     * @return ContactDetails
     */
    public virtual ContactDetails parserContactDetails() {

        return super.parserContactDetails();
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public virtual Tracking parserTracking() {

        return super.parserTracking();
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param GDPR
     */
    public virtual GDPR parseGDPR() {

        return super.parseGDPR();
    }
}
