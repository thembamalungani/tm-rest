public class StageResult {
    
    private BaseLead lead;
    private Boolean isSuccess;
    private Account stageAccount;
    private Opportunity stageOpportunity;
    private Case stageCase;

    public StageResult(StageResult.Builer builder) {

        this.lead = builder.lead;
        this.isSuccess = builder.isSuccess;
        this.account = builder.account;
        this.opportunity = builder.opportunity;
        this.case = builder.case;
    }

    /**
     * Converts the object to a map
     *
     * @return Map<String, Object>
     */
    public Map<String, Object> toMap(){

        return new Map<String, Object>{
            'lead'          => lead,
            'isSuccess'     => isSuccess,
            'account'       => stageAccount,
            'opportunity'   => stageOpportunity,
            'case'          => stageCase
        };
    }

    public class Builer {

        public BaseLead lead;
        public Boolean isSuccess;
        public Account stageAccount;
        public Opportunity stageOpportunity;
        public Case stageCase;

        public StageResult build() {

            return new StageResult(this);
        }

        public StageResult.Builer isSuccess(Boolean isSuccess) {

            this.isSuccess = isSuccess;

            return this;
        }

        public StageResult.Builer lead(BaseLead lead) {

            this.lead = lead;

            return this;
        }

        public StageResult.Builer account(Account account) {

            this.stageAccount = account;

            return this;
        }

        public StageResult.Builer opportunity(Opportunity opportunity) {

            this.stageOpportunity = opportunity;

            return this;
        }

        public StageResult.Builer case(Case case) {

            this.stageCase = case;

            return this;
        }
    }
}
