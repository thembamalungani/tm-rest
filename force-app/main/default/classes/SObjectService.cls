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
     * @param Map<Id, SObjectType> objectsMap
     */
    public void updateObjects(Map<Id, SObjectType> objectsMap){
        
        List<Database.SaveResult> results;

        List<Schema.SObjectType> objectsList  = new List<Schema.SObjectType>();

        for (SObject value: objectsMap.values()) {
            
            objectsList.add(object);
        }

        update objectsList;
    }
}
