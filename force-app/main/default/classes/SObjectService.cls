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
     * @return List<Database.SaveResult>
     */
    public List<Database.SaveResult> insertObjects(List<Schema.SObjectType> objects){
        
        List<Database.SaveResult> results;

        results = Database.insert(objects);

        return results;
    }

    /**
     * Creates or update an account based on condition
     *
     * @param Map<Id, SObjectType> objectsMap
     * @return List<Database.SaveResult> 
     */
    public List<Database.SaveResult> updateObjects(Map<Id, SObjectType> objectsMap){
        
        List<Database.SaveResult> results;

        List<Schema.SObjectType> objectsList    = new List<Schema.SObjectType>();

        for (SObject object: objectsMap.values()) {
            
            objectsList.add(object);
        }

        results = Database.update(objects);

        return results;
    }
}
