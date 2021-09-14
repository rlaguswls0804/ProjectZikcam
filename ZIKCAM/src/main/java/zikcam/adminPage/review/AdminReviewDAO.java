package zikcam.adminPage.review;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("adminReviewDAO")
public class AdminReviewDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adReviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminReview.selectReviewList", map);
	}
	 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adReviewSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminReview.selectReviewSearchList", map);
	}
		
	@SuppressWarnings("unchecked")
	public Map<String, Object> adReviewDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminReview.selectReviewDetail", map);
	}
	
	public void adReviewDelete(Map<String, Object> map) throws Exception {
		insert("adminReview.updateReviewDelete", map);
	}
	
}