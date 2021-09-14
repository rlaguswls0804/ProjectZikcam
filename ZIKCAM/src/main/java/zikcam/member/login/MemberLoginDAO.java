package zikcam.member.login;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("memberLoginDAO")
public class MemberLoginDAO extends AbstractDAO {
	
	Logger log = Logger.getLogger(this.getClass());
 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.selectId", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("login.findIdWithEmail", map);
	}
	
	public int findId(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("login.findId", map);
	}

	
	public int findPwWithEmail(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("login.findPwWithEmail", map);
	}

	public void updateTempPw(Map<String,Object> map) throws Exception {
		update("login.updateTempPw",map);
	}
}