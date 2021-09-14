package zikcam.adminPage.user;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("adminUserDAO")
public class AdminUserDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked") 
	public List<Map<String, Object>> adUserList(Map<String, Object> map) throws Exception{ 
		return (List<Map<String, Object>>)selectPagingList("userInfo.selectUserList", map); }

	@SuppressWarnings("unchecked") 
	public List<Map<String, Object>> adUserSearchList(Map<String, Object> map) throws Exception{ 
		return (List<Map<String, Object>>)selectPagingList("userInfo.selectUserSearchList", map); }


	@SuppressWarnings("unchecked")
	public Map<String, Object> adUserDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("userInfo.selectUserDetail", map);
	}
	
	public void adUserModify(Map<String, Object> map) throws Exception {
		update("userInfo.updateUserDetail", map);
	}
	
}