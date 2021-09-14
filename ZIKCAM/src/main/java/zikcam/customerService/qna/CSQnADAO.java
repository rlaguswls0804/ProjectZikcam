package zikcam.customerService.qna;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("csQnADAO")
public class CSQnADAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());
	
	 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("qna.selectQnaList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.selectQnaList2", map);
	}

	/* INSERT */
	public void insertQnaBoard(Map<String,Object> map) throws Exception{
		insert("qna.insertQnaBoard", map);
	}
	
	public void insertQnaAnswer(Map<String,Object> map) throws Exception{
		update("qna.insertQnaAnswer", map);
	}
	/* INSERT */
	
	
	/* DETAIL */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaBoardDetail (Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("qna.selectQnaBoardDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaAnswerDetail (Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("qna.selectQnaAnswerDetail", map);
	}
	/* DETAIL */
	
	public void updateQnaReply(Map<String,Object> map) throws Exception{
		update("qna.updateQnaReply", map);
	}
	
	public void updateQna(Map<String,Object> map) throws Exception{
		update("qna.updateQna", map);
	}
	
	public void updateQnaAnswer(Map<String,Object> map) throws Exception{
		update("qna.updateQnaAnswer", map);
	}
	public void deleteQna(Map<String,Object> map) throws Exception{
		update("qna.deleteQna", map);
	}
	
	public void deleteQnaReply(Map<String,Object> map) throws Exception{
		update("qna.deleteQnaReplyBoard", map);
		update("qna.deleteQnaReply", map);
		
	}
	
	public void insertQnaFile(Map<String,Object> map){
		insert("qna.insertQnaFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaFileList(Map<String,Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.selectQnaFileList", map);
	}

	public void deleteQnaFileList(Map<String,Object> map) throws Exception{
		update("qna.deleteQnaFileList", map);
	}
	
	public void updateQnaFile(Map<String,Object> map) throws Exception{
		update("qna.updateQnaFile", map);
	}
	
}
