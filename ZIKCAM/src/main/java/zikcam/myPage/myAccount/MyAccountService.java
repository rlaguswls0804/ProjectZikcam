package zikcam.myPage.myAccount;

import java.util.List;
import java.util.Map;

public interface MyAccountService {

	List<Map<String, Object>> selectAccount(Map<String, Object> commandMap) throws Exception;
	
	Map<String, Object> selectAccountModify(Map<String, Object> commandMap) throws Exception;
	
	void updateAccount(Map<String, Object> map) throws Exception;
}
