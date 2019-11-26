/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to map a Calendly lead
 * @date 2019-10-03
 */
public class CalendlyLeadMapper extends AbstractLeadMapper {
    
    /**
     * Parses the contect details from leadMap
     *
     * @return ContactDetails
     */
    public override BaseLead.ContactDetails mapContactDetails() {
        
        BaseLead.ContactDetails contactDetails = new BaseLead.ContactDetails();
        
        return contactDetails;
    }

    /**
     * Parses tracking info from leadMap
     *
     * @param Tracking
     */
    public override BaseLead.Tracking mapTracking() {
        
        BaseLead.Tracking tracking = new BaseLead.Tracking();
        
        return tracking;
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param GDPR
     */
    public override BaseLead.GDPR mapGDPR() {
        
		BaseLead.GDPR gdpr = new BaseLead.GDPR();
        
		return gdpr;         
    }
}