package zikcam.myPage.myReview;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import zikcam.myPage.myReview.MyReviewDAO;

@Service("myReviewService")
public class MyReviewServiceImpl implements MyReviewService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "myReviewDAO")
	private MyReviewDAO myReviewDAO;

	@Override
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map, String keyword, String searchType, String sortType, String formSortType) throws Exception {
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		map.put("formSortType", formSortType);

		return myReviewDAO.selectMyReviewList(map);
	}

	@Override
	public Map<String, Object> selectReviewDetail(Map<String, Object> map) throws Exception {
		myReviewDAO.updateReviewHitCnt(map);
		Map<String, Object> resultMap = myReviewDAO.selectReviewDetail(map);
		return resultMap;
	}

	@Override
	public void updateReview(Map<String, Object> map) throws Exception {
		myReviewDAO.updateReview(map);
	}
	
	@Override
	public void deleteReview(Map<String, Object> map) throws Exception {
		myReviewDAO.deleteReview(map);
	}

}
