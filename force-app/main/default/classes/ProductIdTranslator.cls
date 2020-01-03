public class ProductIdTranslator {
    /**
     * Translates product uuids or parent product uuids to actual product ids
     *
     * @param BaseLead lead
     * @return BaseLead
     */
    public BaseLead translate(BaseLead lead) {
        
        if (lead.tracking.productIds != null)           { return lead; }
        if (lead.tracking.productUuids != null)         { return translateProductUuids(lead); }
        if (lead.tracking.productParentUuids != null)   { return translateParentProductUuids(lead); }

        return lead;
    }

    /**
     * Translates product uuids to actual product ids
     *
     * @param BaseLead lead
     * @return BaseLead
     */
    public BaseLead translateProductUuids(BaseLead lead) {

        Set<String> productUuids = new Set<String>(lead.tracking.productUuids);

        for (Product2 presentation : (new PresentationSelector()).selectByUuid(productUuids).values()) {
            lead.tracking.productIds.add(presentation.Id);
        }

        return lead;
    }

    /**
     * Translates parent product ids into actual product ids
     * 
     * @param BaseLead lead
     * @return BaseLead
     */
    public BaseLead translateParentProductUuids(BaseLead lead) {
        
        IPipeline pipeline = (new Pipeline(new InterruptibleProcessor(new PresentationChecker())))
                             .pipe(new CourseFinder())
                             .pipe(new EarliestPublishedProductFinder())
                             .pipe(new EarliestUnpublishedFinder())
                             .pipe(new EligibleProductFinder());

        for (String parentProductUuid : lead.tracking.productParentUuids) {

            try {
                
                Product2 presentation = (Product2)((Map<String, Object>)pipeline.process(parentProductUuid)).get('presentation');
                lead.tracking.productIds.add(presentation.Id);

            } catch(Exception e) {
                
                System.debug(e.getMessage());
            }
        }

        return lead;
    }
}