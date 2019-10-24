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
    protected Set<Schema.SObjectField> getFieldSet()
    {
       return objectType.getDescribe().fields.getMap().keySet();
    }
}
