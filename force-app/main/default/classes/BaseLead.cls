/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description This is a based lead model
 * @date 2019-10-01
 */
public virtual class BaseLead implements IMappable {

    /**
     * @var LeadType type
     */
    public LeadType type;

    /**
     * Mapper
     */
    public AbstractLeadMapper mapper;
    
    /**
     * @param ContactDetails contactDetails
     */
    public ContactDetails contactDetails;

    /**
     * @param Tracking tracking
     */
    public Tracking tracking;

    /**
     * @param GDPR gdpr
     */
    public GDPR gdpr;

    public void setType(LeadType type) {

        this.type = type;
    }

    public LeadType getType() {

        return this.type;
    }

    public void setMapper(AbstractLeadMapper mapper) {

        this.mapper = mapper;
    }

    /**
     * Instatiate a new lead from a json parser instance
     */
    public BaseLead fromMapper() {

        //this.contactDetails = (ContactDetails)mapper.mapContactDetails();
        //this.tracking = (Tracking)mapper.mapTracking();
        //this.gdpr = (GDPR)mapper.mapGDPR();

        return this;
    }

    /**
    * @author Themba Malungani <themba.clarence@gmail.com>
    * @description This contact details for the lead
    * @date 2019-10-01
    */
    public class ContactDetails {

        private String email { set; get; }
        private String firstName { set; get; }
        private String lastName { set; get; }
        private String languageHome { set; get; }
        private String jobTitle { set; get; }
        private String phone { set; get; }
        private String mobilePhone { set; get; }
        private String educationHighestLevel { set; get; }
        private String occupation { set; get; }
        private String employerCompanyName { set; get; }
        private String employeeIndustry { set; get; }
        private String workExperience { set; get; }
        private String countryOfResidence { set; get; }
    }

    /**
    * @author Themba Malungani <themba.clarence@gmail.com>
    * @description This tracking information for the lead
    * @date 2019-10-01
    */
    public class Tracking {

        private String countryInferred { set; get; }
        private String externalId { set; get; }
        private String leadCaptureFormType { set; get; }
        private String leadCaptureFormUrl { set; get; }
        private List<String> productIds { set; get; }
        private String googleAnalyticsClientId { set; get; }
        private String segmentAnonymousId { set; get; }
        private String source { set; get; }
    }

    /**
    * @author Themba Malungani <themba.clarence@gmail.com>
    * @description This is GDPR concent information for the lead
    * @date 2019-10-01
    */
    public class GDPR {

        private Boolean gdprCallOptIn { set; get; }
        private Boolean gdprEmailOptIn { set; get; }
        private Boolean gdprSmsOptIn { set; get; }
        private Boolean gdprProspect2uOptIn { set; get; }
        private Boolean gdprProspectPartnerOptIn { set; get; }
    }
}
