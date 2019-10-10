/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Used to map a Submitted Registratrion Step 1 lead
 * @date 2019-10-03
 */
public class SubmittedRegistrationStep1Mapper extends AbstractLeadMapper {

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
     * @param BaseLead.Tracking
     */
    public override BaseLead.Tracking parserTracking() {

        return super.parserTracking();
    }

    /**
     * Parses the GDRP data from leadMap
     *
     * @param BaseLead.GDPR
     */
    public override BaseLead.GDPR parseGDPR() {

        return super.parseGDPR();
    }
}
