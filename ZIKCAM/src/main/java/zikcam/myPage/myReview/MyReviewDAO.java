package zikcam.myPage.myReview;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("myReviewDAO")
public class MyReviewDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("mypage.selectMyReviewList", map);
	}

	public void updateReviewHitCnt(Map<String, Object> map) throws Exception {
		update("mypage.updateReviewHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReviewDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("mypage.selectReviewDetail", map);
	}

	public void updateReview(Map<String, Object> map) throws Exception {
		update("mypage.updateReview", map);
	}
	
	public void deleteReview(Map<String, Object> map) throws Exception {
		update("mypage.deleteReview", map);
	}

}
