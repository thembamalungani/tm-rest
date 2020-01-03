public class CourseFinder implements IPipelineStage {
    /**
     * Finds a course by course uuid
     *
     * @param Object payload
     * @return Object
     */
    public Object call(Object payload) {

        Map<String, Object> payloadMap  = (Map<String, Object>)payload;
        Course__c course                = (new CourseSelector()).selectByUuid((String)payloadMap.get('courseId'));

        if (course != null) {
            payloadMap.put('course', course);
        }

        return (Object)payloadMap;
    }
}
