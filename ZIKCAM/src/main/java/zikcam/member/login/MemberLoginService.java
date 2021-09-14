package zikcam.member.login;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import zikcam.member.login.MemberLoginDAO;

@Service("memberLoginService")
public class MemberLoginService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberLoginDAO")
	private MemberLoginDAO memberLoginDAO; 

	 
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		return memberLoginDAO.selectId(map);
	}

	
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception {
		return memberLoginDAO.findIdWithEmail(map);
	}
	
	
	public int findId(Map<String, Object> map) throws Exception {
		return memberLoginDAO.findId(map);
	}

	
	public int findPwWithEmail(Map<String, Object> map) throws Exception {
		return memberLoginDAO.findPwWithEmail(map);
	}

	
	public void updateTempPw(Map<String,Object> map) throws Exception {
		memberLoginDAO.updateTempPw(map);
	}

}
