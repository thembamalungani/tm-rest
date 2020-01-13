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

        Set<String> productUuids = new Set<String>();

        for (String productUuid : lead.tracking.productUuids) {
            if (!String.isBlank(productUuid)) {
                productUuids.add(productUuid);
            }
        }

        try {

            lead.tracking.productIds = new List<String>();

            for (Product2 presentation : (new PresentationSelector()).selectByUuid(productUuids).values()) {
                lead.tracking.productIds.add(presentation.Id);
            }

        } catch (Exception e) {
            System.debug('Error while translating presentation: ' + e.getMessage());
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
            
            if (String.isBlank(parentProductUuid)) {
                continue;
            }

            try {

                Map<String, Object> payload = new Map<String, Object>{'courseId' => parentProductUuid};
                Map<String, Object> response= (Map<String, Object>)pipeline.process(payload);
                Product2 presentation       = (Product2)response.get('presentation');
                
                if (lead.tracking.productIds == null) lead.tracking.productIds = new List<String>();
                if (presentation != null) lead.tracking.productIds.add(presentation.Id);

            }catch(Exception e){
                
                System.debug('Error while translating parent products: ' + e.getMessage());
            }
        }

        return lead;
    }
}