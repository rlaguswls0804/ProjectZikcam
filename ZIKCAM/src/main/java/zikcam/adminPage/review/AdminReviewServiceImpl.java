package zikcam.adminPage.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminReviewDAO")
	private AdminReviewDAO adminReviewDAO;

	public List<Map<String, Object>> adReviewList(Map<String, Object> map, String keyword, String searchType, String sortType, String formSortType)throws Exception {
		map.put("keyword", keyword); 
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		
		if((keyword.equals("") || keyword == null) && (sortType.equals("") || sortType == null)) {
			return adminReviewDAO.adReviewList(map); 
		}else {
			return adminReviewDAO.adReviewSearchList(map); 
		}
		
	}
	
	@Override
	public Map<String, Object> adReviewDetail(Map<String, Object> map) throws Exception {
		return adminReviewDAO.adReviewDetail(map);
	}
	
	@Override
	public void adReviewDelete(Map<String, Object>map)throws Exception{
		adminReviewDAO.adReviewDelete(map); 
	}
}