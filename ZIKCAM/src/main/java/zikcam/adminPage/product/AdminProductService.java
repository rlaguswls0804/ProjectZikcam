package zikcam.adminPage.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminProductService")
public class AdminProductService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminProductDAO")
	private AdminProductDAO adminProductDAO;
	
	public List<Map<String, Object>> adProductList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		map.put("keyword", keyword); 
		map.put("searchType", searchType);
		
		if(keyword.equals("") || keyword == null) {
			return adminProductDAO.adProductList(map);
		}else {
			return adminProductDAO.adProductSearchList(map);
		}
		
	} 
	
	public void insertProduct(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminProductDAO.insertProduct(map);
		
		map.put("PROD_NUM", map.get("PROD_NUM"));
	}

	public Map<String, Object> adProductModify(Map<String, Object> map) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = adminProductDAO.adProductModify(map);
		
		resultMap.put("map", tempMap);
		
		return resultMap;
	}
	
	public void updateProduct(Map<String, Object> map, HttpServletRequest request)  throws Exception {
		adminProductDAO.updateProduct(map);
	}
	
	public void deleteProduct(Map<String, Object> map) throws Exception {
		adminProductDAO.deleteProduct(map);
	}
}