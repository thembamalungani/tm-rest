public class StageResult {
    
    private BaseLead lead;
    private Boolean isSuccess;
    private Account stageAccount;
    private Opportunity stageOpportunity;
    private Case stageCase;

    public StageResult(StageResult.Builder builder) {

        this.lead               = builder.lead;
        this.isSuccess          = builder.isSuccess;
        this.stageAccount       = builder.stageAccount;
        this.stageOpportunity   = builder.stageOpportunity;
        this.stageCase          = builder.stageCase;
    }

    public static StageResult.Builder builder() {

        return new StageResult.Builder();
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

    public class Builder {

        public BaseLead lead;
        public Boolean isSuccess;
        public Account stageAccount;
        public Opportunity stageOpportunity;
        public Case stageCase;

        public StageResult build() {

            return new StageResult(this);
        }

        public StageResult.Builder isSuccess(Boolean isSuccess) {

            this.isSuccess = isSuccess;

            return this;
        }

        public StageResult.Builder lead(BaseLead lead) {

            this.lead = lead;

            return this;
        }

        public StageResult.Builder stageAccount(Account stageAccount) {

            this.stageAccount = stageAccount;

            return this;
        }

        public StageResult.Builder stageOpportunity(Opportunity stageOpportunity) {

            this.stageOpportunity = stageOpportunity;

            return this;
        }

        public StageResult.Builder stageCase(Case stageCase) {

            this.stageCase = stageCase;

            return this;
        }
    }
}