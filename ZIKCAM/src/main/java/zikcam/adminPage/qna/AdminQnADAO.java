package zikcam.adminPage.qna;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("adminQnADAO")
public class AdminQnADAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adQnAList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminQnA.selectQnAList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adQnASearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminQnA.selectQnASearchList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adQnADetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminQnA.selectQnADetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adQnASubDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminQnA.selectQnAReplyDetail", map);
	}
	
	public void adQnAReplyWrite(Map<String, Object> map) throws Exception {
		insert("adminQnA.insertQnAReply", map);
	}
	
	public void adQnASwitch(Map<String, Object> map) throws Exception {
		insert("adminQnA.updateQnASwitch", map);
	}
	
	public void adQnAReplyUpdate(Map<String, Object> map) throws Exception {
		insert("adminQnA.updateQnAReply", map);
	}
	
	public void adQnADelete(Map<String, Object> map) throws Exception {
		insert("adminQnA.updateQnADelete", map);
	}
		
}
