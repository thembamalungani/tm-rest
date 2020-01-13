/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Stage used to find earliest published product
 * @date 2019-10-04
 */
public class EarliestPublishedProductFinder implements IPipelineStage {
    /**
     * Get the earliest published product
     *
     * @param Object payload
     * @return Object
     */
    public Object call(Object payload) {

        Map<String, Object> payloadMap  = (Map<String, Object>)payload;
        Course__c course                = (Course__c)payloadMap.get('course');
        List<Product2> presentations    = (new PresentationSelector()).selectPublishedPresentationsByCourseId(course.Id);

        if (presentations != null) {
            payloadMap.put('presentation', presentations.get(0));
        }

        return (Object)payloadMap;
    }
}
