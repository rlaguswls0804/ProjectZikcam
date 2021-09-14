package zikcam.myPage.myReview;

import java.util.List;
import java.util.Map;

public interface MyReviewService {

	List<Map<String, Object>> selectMyReviewList(Map<String, Object> commandMap, String keyword, String searchType, String sortType, String formSortType) throws Exception;
	
	Map<String, Object> selectReviewDetail(Map<String, Object> map) throws Exception;
	
	void updateReview(Map<String, Object> map) throws Exception;
	
	void deleteReview(Map<String, Object> map) throws Exception;

}
