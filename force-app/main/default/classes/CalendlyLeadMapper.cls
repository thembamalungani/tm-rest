/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to map a Calendly lead
 * @date 2019-10-03
 */
public class CalendlyLeadMapper extends BaseLeadMapper {

    /**
     * Parses the contect details from leadMap
     *
     * @return BaseLead.ContactDetails
     */
    public override BaseLead.ContactDetails parserContactDetails() {

        return super.parserContactDetails();
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public override BaseLead.Tracking parserTracking() {

        return super.parserTracking();
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param GDPR
     */
    public override BaseLead.GDPR parseGDPR() {

        return super.parseGDPR();
    }
}
