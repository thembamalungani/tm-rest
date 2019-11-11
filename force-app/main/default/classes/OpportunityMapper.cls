public virtual class OpportunityMapper {
    
    /**
     * Maps opportunity fields to account properties in map
     *
     * @param Opportunity opportunity
     * @param Map<String, Object> opportunityParameters
     * @return Opportunity
     */
    public virtual Opportunity doMap(Opportunity opportunity, Map<String, Object> opportunityParameters) {

        if ( opportunity == null ) {

            opportunity = new Opportunity();
        }

        for (String key : opportunityParameters.keySet()) {
            
            opportunity.put(key, opportunityParameters.get(key));
        }

        return opportunity;
    }
}
