/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Base service for sobjects
 * @date 2019-10-01
 */
public virtual class SObjectService {

    /**
     * Creates objects 
     *
     * @param List<Schema.SObjectType> objects
     */
    public void insertObjects(List<Schema.SObjectType> objects){
        
        insert objects;
    }

    /**
     * Creates or update an account based on condition
     *
     * @param Map<Id, SObject> objectsMap
     */
    public void updateObjects(Map<Id, SObject> objectsMap){
        
        List<Database.SaveResult> results;

        List<SObject> objectsList  = new List<SObject>();

        for (SObject value: objectsMap.values()) {
            
            objectsList.add(value);
        }

        update objectsList;
    }
}
