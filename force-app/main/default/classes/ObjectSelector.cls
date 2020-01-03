/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Base object selector class
 * @date 2019-10-21
 */
public virtual class ObjectSelector {
    /**
     * @var Schema.SObjectType objectType
     */
    protected Schema.SObjectType objectType;

    /**
     * Inject the object type
     *
     * @param Schema.SObjectType objectType
     */
    public ObjectSelector(Schema.SObjectType objectType) {
        this.objectType = objectType;
    }

    /**
     * Used to get fields for the current object
     *
     * @return Set<Schema.SObjectField>
     */
    protected Set<String> getFieldNames()
    {
        List<Schema.SObjectField> fields = objectType.getDescribe().fields.getMap().values();

        Set<String> fieldNames = new Set<String> ();

        for (Schema.SObjectField field : fields) {
            fieldNames.add(field.getDescribe().getName());
        }

       return fieldNames;
    }

    /**
     * Runs the query
     *
     * @param String query
     * @return SObject
     */
    public Object query(String query) {

        try {
            return Database.query(query);
        } catch(QueryException e){
            return null;
        }
    }
}