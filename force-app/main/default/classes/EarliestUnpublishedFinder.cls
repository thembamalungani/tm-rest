public class EarliestUnpublishedFinder implements IPipelineStage {
    /**
     * Get the earliest unpublished product
     *
     * @param Object payload
     * @return Object
     */
    public Object call(Object payload) {

        Map<String, Object> payloadMap  = (Map<String, Object>)payload;
        Course__c course                = (Course__c)payloadMap.get('course');
        List<Product2> presentations    = (new PresentationSelector()).selectUnPublishedPresentationsByCourseId(course.Id);

        if (presentations != null) {
            payloadMap.put('presentation', presentations.get(0));
        }

        return (Object)payloadMap;
    }
}
