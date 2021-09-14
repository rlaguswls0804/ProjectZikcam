package zikcam.customerService.notice;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;
 
@Repository("csNoticeDAO")
public class CSNoticeDAO extends AbstractDAO {
	
	Logger log = Logger.getLogger(this.getClass());
	   
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception{	
		return (List<Map<String, Object>>)selectPagingList("notice.selectNoticeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList2(Map<String, Object> map) throws Exception{	
		return (List<Map<String, Object>>)selectList("notice.selectNoticeList2", map);
	}
	
	public void insertNotice(Map<String, Object> map) throws Exception{
		insert("notice.insertNotice", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("notice.updateHitCount", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("notice.selectNoticeDetail", map);
	}

	public void updateNotice(Map<String, Object> map) throws Exception{
		update("notice.updateNotice", map);
	}

	public void deleteNotice(Map<String, Object> map) throws Exception{
		update("notice.deleteNotice", map);
	}

	public void insertNoticeFile(Map<String, Object> map) {
		insert("notice.insertNoticeFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeFileList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("notice.selectNoticeFileList", map);
	}
	
	public void deleteNoticeFileList(Map<String, Object> map) throws Exception{
		update("notice.deleteNoticeFileList", map);
	}
	
	public void updateNoticeFile(Map<String, Object> map) throws Exception{
		update("notice.updateNoticeFile", map);
	}
	
}