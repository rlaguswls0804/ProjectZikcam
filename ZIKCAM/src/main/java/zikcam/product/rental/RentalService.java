package zikcam.product.rental;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("rentalService")
public class RentalService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="rentalDAO")
	private RentalDAO rentalDAO;
	
	public List<Map<String, Object>> selectRentalList(
		Map<String, Object> map, String keyword, String searchType, String sortType, String sortType2) throws Exception{
		
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		map.put("sortType2", sortType2);
		
		return rentalDAO.selectRentalList(map);
	}
	 
	/* 
	 * public List<Map<String, Object>> selectRentalList2(Map<String, Object> map)
	 * throws Exception{
	 * 
	 * return rentalDAO.selectRentalList2(map); }
	 */
	
	public Map<String, Object> selectRentalDetail(Map<String, Object> map) throws Exception {
		
		rentalDAO.updateHitCnt(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = rentalDAO.selectRentalDetail(map);
		
		resultMap.put("map", tempMap);
		
		
		return resultMap;
	}
	
	public Map<String, Object> selectRentalDetail2(Map<String, Object> map) throws Exception {
		 
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = rentalDAO.selectRentalDetail(map);
		
		resultMap.put("map", tempMap);
		
		
		return resultMap;
	}
	
	 public Map<String, Object> selectWishDetail(Map<String, Object> map) throws Exception { 
		 
		 Map<String, Object> resultMap = new HashMap<String, Object>();
		 Map<String, Object> tempMap = rentalDAO.selectWishDetail(map);
			
		 resultMap.put("wishMap", tempMap);
		 
		 return resultMap; 
	}
	
	 public void insertWish(Map<String, Object> map, HttpServletRequest request) throws Exception {
		 rentalDAO.insertWish(map);
			
			
		 map.put("PROD_NUM", map.get("PROD_NUM"));
		 map.put("MEMBER_ID", map.get("MEMBER_ID"));
	}
	 
	 public void deleteWish(Map<String, Object> map) throws Exception {
		 rentalDAO.deleteWish(map);
		 
		 map.put("PROD_NUM", map.get("PROD_NUM"));
		 map.put("MEMBER_ID", map.get("MEMBER_ID"));
	}
	
}