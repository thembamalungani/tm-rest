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

        this.contactDetails = (ContactDetails)mapper.mapContactDetails();
        this.tracking = (Tracking)mapper.mapTracking();
        this.gdpr = (GDPR)mapper.mapGDPR();

        return this;
    }

    /**
    * @author Themba Malungani <themba.clarence@gmail.com>
    * @description This contact details for the lead
    * @date 2019-10-01
    */
    public class ContactDetails {

        public String email { set; get; }
        public String firstName { set; get; }
        public String lastName { set; get; }
        public String languageHome { set; get; }
        public String jobTitle { set; get; }
        public String phone { set; get; }
        public String mobilePhone { set; get; }
        public String educationHighestLevel { set; get; }
        public String occupation { set; get; }
        public String employerCompanyName { set; get; }
        public String employeeIndustry { set; get; }
        public String workExperience { set; get; }
        public String countryOfResidence { set; get; }
    }

    /**
    * @author Themba Malungani <themba.clarence@gmail.com>
    * @description This tracking information for the lead
    * @date 2019-10-01
    */
    public class Tracking {

        public String countryInferred { set; get; }
        public String externalId { set; get; }
        public String leadCaptureFormType { set; get; }
        public String leadCaptureFormUrl { set; get; }
        public List<String> productIds { set; get; }
        public String googleAnalyticsClientId { set; get; }
        public String segmentAnonymousId { set; get; }
        public String source { set; get; }
    }

    /**
    * @author Themba Malungani <themba.clarence@gmail.com>
    * @description This is GDPR concent information for the lead
    * @date 2019-10-01
    */
    public class GDPR {

        public Boolean gdprCallOptIn { set; get; }
        public Boolean gdprEmailOptIn { set; get; }
        public Boolean gdprSmsOptIn { set; get; }
        public Boolean gdprProspect2uOptIn { set; get; }
        public Boolean gdprProspectPartnerOptIn { set; get; }
    }
}
