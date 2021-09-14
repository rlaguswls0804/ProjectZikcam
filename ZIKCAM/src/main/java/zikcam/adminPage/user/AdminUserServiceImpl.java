package zikcam.adminPage.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminUserDAO")
	private AdminUserDAO adminUserDAO;

	@Override 
	public List<Map<String, Object>> adUserList(Map<String, Object> map, String keyword, String searchType) throws Exception { 
		
		map.put("keyword", keyword); 
		map.put("searchType", searchType);
		
		if(keyword.equals("") || keyword == null) {
			return adminUserDAO.adUserList(map); 
		}else {
			return adminUserDAO.adUserSearchList(map); 
		}
	} 
	
	@Override
	public Map<String, Object> adUserDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminUserDAO.adUserDetail(map);
		return resultMap;
	}

	@Override
	public void adUserModify(Map<String, Object> map) throws Exception {
		adminUserDAO.adUserModify(map);
	}
	
}