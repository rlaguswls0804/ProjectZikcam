package zikcam.adminPage.review;

import java.util.List;
import java.util.Map;

public interface AdminReviewService {

	List<Map<String, Object>> adReviewList(Map<String, Object> map, String keyword, String searchType, String sortType, String formSortType)throws Exception;

	Map<String, Object> adReviewDetail(Map<String, Object> map) throws Exception;
	
	void adReviewDelete(Map<String, Object>map)throws Exception;
	
}
