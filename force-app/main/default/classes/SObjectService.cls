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
    public void insertObjects(List<SObject> objects){
        List<Database.SaveResult> results = Database.insert(objects);
    }

    /**
     * Creates or update an account based on condition
     *
     * @param Map<Id, SObject> objectsMap
     */
    public void updateObjects(Map<Id, SObject> objectsMap){
        List<SObject> objects  = new List<SObject>(objectsMap.values());
        List<Database.SaveResult> results = Database.update(objects);
    }
}