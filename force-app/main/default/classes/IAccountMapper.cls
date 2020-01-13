/**
 * @author Themba Malungani <themba.clarence@gmail.com>
 * @description Contract for Account mapper
 * @date 2019-10-04
 */
public interface IAccountMapper {
    /**
     * Creates a map of account fields to lead values
     *
     * @param Account account
     * @param Map<String, String> accountParameters
     * @return Account
     */
    Account doMap(Account account, Map<String, Object> accountParameters);
}