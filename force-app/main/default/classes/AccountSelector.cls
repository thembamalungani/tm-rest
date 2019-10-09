public class AccountSelector implements IAccountSelector {
    
    public Account findByEmail(String email) {
        
        return [SELECT Name FROM Account WHERE Email=:email];
    }
}
