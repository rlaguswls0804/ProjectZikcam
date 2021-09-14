package zikcam.adminPage.user;

import java.util.List;
import java.util.Map;

public interface AdminUserService {
	List<Map<String, Object>> adUserList(Map<String, Object> map, String keyword, String searchType) throws Exception;
	
	Map<String, Object> adUserDetail(Map<String, Object> map) throws Exception;
	
	void adUserModify(Map<String, Object>map)throws Exception;
	

	
}
