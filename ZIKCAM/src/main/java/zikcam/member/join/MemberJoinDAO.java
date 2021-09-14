package zikcam.member.join;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("memberJoinDAO")
public class MemberJoinDAO extends AbstractDAO {
	
	Logger log = Logger.getLogger(this.getClass());

	public int selectEmailCheck(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("join.selectEmailCheck",map);
	}
	
	public int selectIdCheck(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("join.selectIdCheck",map);
	}
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("join.insertMember",map);
	}
	public void verifyMember(Map<String, Object> map) throws Exception{
		update("join.updateVerify",map);
	}

}