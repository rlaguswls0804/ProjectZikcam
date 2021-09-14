package zikcam.customerService.faq;

import javax.annotation.Resource;

import java.util.Map;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("csFAQService")
public class CSFAQService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="csFAQDAO")
	private CSFAQDAO csFAQDAO;
	
	
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map, String keyword, String searchType, String sortType) throws Exception{
		
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		/* if((keyword.equals("") || keyword == null) && (sortType.equals("") || sortType == null)) {
			return csFAQDAO.selectFaqList2(map);
		}else {
			return csFAQDAO.selectFaqList2(map); 
		} */
		return csFAQDAO.selectFaqList2(map); 
	}
	
	public void insertFaq(Map<String, Object> map, HttpServletRequest request) throws Exception{
		csFAQDAO.insertFaq(map);
	}
	
	
	public void updateHitCount(Map<String, Object> map) throws Exception{
	  
	}
	 
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception {
		csFAQDAO.updateHitCount(map);
		
		Map<String, Object> resultMap = csFAQDAO.selectFaqDetail(map);
		
		return resultMap; 
		
	}

	public void updateFaq(Map<String, Object> map) throws Exception{
		csFAQDAO.updateFaq(map);
	}
	
	public void deleteFaq(Map<String, Object> map) throws Exception{
		csFAQDAO.deleteFaq(map);
	}
	
}