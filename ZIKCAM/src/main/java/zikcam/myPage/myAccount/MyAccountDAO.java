package zikcam.myPage.myAccount;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("myAccountDAO")
public class MyAccountDAO extends AbstractDAO{
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAccount(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectAccount", map); 
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAccountModify(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectAccount", map); 
	}
	
	public void updateAccount(Map<String, Object> map) throws Exception {
		update("mypage.updateAccount", map);
	}
}
