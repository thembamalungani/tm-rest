public class StageResult {
    
    private BaseLead lead;
    private Boolean isSuccess;
    private Account account;
    private Opportunity opportunity;
    private Case case;

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
            'account'       => account,
            'opportunity'   => opportunity,
            'case'          => case
        };
    }

    public class Builer {

        public BaseLead lead;
        public Boolean isSuccess;
        public Account account;
        public Opportunity opportunity;
        public Case case;

        public StageResult build() {

            return new StageResult(this);
        }

        public StageResult.Builer isSuccess(Boolean isSuccess) {

            this.isSuccess = isSuccess;

            return this;
        }

        public StageResult.Builer lead(BaseLead lead) {

            this.lead = baseLead;

            return this;
        }

        public StageResult.Builer account(Account account) {

            this.lead = baseLead;

            return this;
        }

        public StageResult.Builer opportunity(Opportunity opportunity) {

            this.opportunity = opportunity;

            return this;
        }

        public StageResult.Builer case(Case case) {

            this.case = case;

            return this;
        }
    }
}
