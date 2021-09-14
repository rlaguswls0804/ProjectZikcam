package zikcam.myPage.myPQ;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("myPQDAO")
public class MyPQDAO extends AbstractDAO {

//	PRODUCTQUESTION
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyPQList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("mypage.selectMyPQList", map); 
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPQDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectPQDetail", map); 
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPQModifyForm(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectPQModifyForm", map);
	}
	
	public void updatePQ(Map<String, Object> map) throws Exception{
		update("mypage.updatePQ", map);
	}
	
	public void deletePQ(Map<String, Object> map) throws Exception{
		update("mypage.deletePQ", map);
	}
	
//	QNA
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQNAList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("mypage.selectQNAList", map); 
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQNADetail(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectQNADetail", map); 
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQNAModifyForm(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectQNAModifyForm", map);
	}
	
	public void updateQNA(Map<String, Object> map) throws Exception{
		update("mypage.updateQNA", map);
	}
	
	public void deleteQNA(Map<String, Object> map) throws Exception{
		update("mypage.deleteQNA", map);
	}

}