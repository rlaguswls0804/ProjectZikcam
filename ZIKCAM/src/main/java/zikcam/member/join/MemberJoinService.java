package zikcam.member.join;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import zikcam.member.join.MemberJoinDAO;

@Service("memberJoinService")
public class MemberJoinService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberJoinDAO")
	private MemberJoinDAO memberJoinDAO;
	
	
	public int selectEmailCheck(Map<String, Object> map) throws Exception {
		return memberJoinDAO.selectEmailCheck(map);
	}
	
	
	public int selectIdCheck(Map<String, Object> map) throws Exception {
		return memberJoinDAO.selectIdCheck(map);
	}

	
	public void insertMember(Map<String, Object> map) throws Exception {
		memberJoinDAO.insertMember(map);
	}

	
	public void verifyMember(Map<String, Object> map) throws Exception {
		memberJoinDAO.verifyMember(map);
	}


}
