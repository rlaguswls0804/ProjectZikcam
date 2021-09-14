package zikcam.adminPage.pq;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("adminPQDAO")
public class AdminPQDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adPQList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminPQ.selectPQList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adPQSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminPQ.selectPQSearchList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adPQDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminPQ.selectPQDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adPQSubDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminPQ.selectPQReplyDetail", map);
	}
	
	public void adPQReplyWrite(Map<String, Object> map) throws Exception {
		insert("adminPQ.insertPQReply", map);
	}
	
	public void adPQSwitch(Map<String, Object> map) throws Exception {
		insert("adminPQ.updatePQSwitch", map);
	}
	
	public void adPQReplyUpdate(Map<String, Object> map) throws Exception {
		insert("adminPQ.updatePQReply", map);
	}
	
	public void adPQDelete(Map<String, Object> map) throws Exception {
		insert("adminPQ.updatePQDelete", map);
	}
	
	public void insertFile(Map<String, Object>map)throws Exception{
		insert("adminPQ.insertFile", map);
	}
		
}
